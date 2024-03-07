class CompaniesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource # Add this lin
  def index
    @companies=Company.accessible_by(current_ability)

  end
  def new
    @company = Company.new
    @company.users.build

    @company_Temp_Id = SecureRandom.uuid


  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to company_path(@company), notice: 'Company Registered successfully!'
    else
      render :new
    end
  end
  def show
    @company=Company.find(params[:id])
    @users=@company.users
    @accounts = @company.accounts
    @new_account = @company.accounts.build
    @payments = @company.payments
  end

  def edit
  end

  def update
  end

  private

  def company_params
    params.require(:company).permit(:name,:start_date, :opening_balance,users_attributes: [:id,:name,:role,:email,:password,:company_id, :_destroy])
  end
end
