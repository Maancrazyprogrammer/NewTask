# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.admin?
      can :manage, :all
    elsif user.accountant?
      can :read, Company, id: user.company_id

      can [:read], Report

      can [:new], Payment

      can [:read, :new], Account, company_id: user.company_id
    elsif user.employee?
      can :read, Company, id: user.company_id
    end
  end
end
