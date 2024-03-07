class Company < ApplicationRecord
  has_many :users
  has_many :accounts
  has_many :payments
  accepts_nested_attributes_for :users, allow_destroy: true, reject_if: :all_blank

  validates :name, presence: :true, uniqueness: true
  validates :start_date, presence: :true
  validates :opening_balance, presence: true


end
