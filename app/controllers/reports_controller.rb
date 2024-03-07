class ReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    # You can implement the logic to fetch necessary data for the report
    @accounts = current_user.company.accounts
  end

  def show
    @account = current_user.company.accounts.find(params[:id])


      if @account.present?
        # Fetch payments for the account through the company based on a specific date
        @payments = current_user.company.payments.where(
          '(sender_id = ? OR receiver_id = ?) AND date = ?',
          @account.id, @account.id, params[:date]
        )

        # Calculate closing balance
        @opening_balance = @account.opening_balance
        @receive_amount = @payments.where(receiver_id: @account.id).sum(:amount)
        @send_amount = @payments.where(sender_id: @account.id).sum(:amount)
        @closing_balance = @opening_balance + @receive_amount - @send_amount
      else
        flash[:alert] = "Account not found."
        redirect_to reports_path
      end
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Account not found."
      redirect_to reports_path
    end
  end
