class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company
  def index
    @accounts = @company.accounts
  end

  def new
    # @company = Company.find(params[:company_id])
    @account = @company.accounts.build
  end

  def create
    @account = @company.accounts.build(account_params)

    if @account.save
      redirect_to company_path(@company), notice: 'Account created successfully.'
    else
      render :new
    end
  end
  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private
  def set_company
    @company = Company.find(params[:company_id])
  end

  def account_params
    params.require(:account).permit(:name, :starting_date, :col_balance, :opening_balance,:company_id)
  end
end
