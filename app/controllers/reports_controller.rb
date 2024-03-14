class ReportsController < ApplicationController
  before_action :authenticate_user!

  def index

    @accounts = current_user.company.accounts

  end

  def show
    puts "Params: #{params.inspect}"


    @account = current_user.company.accounts.find(params[:account_id])

    if @account.present?

      @payments = current_user.company.payments.where(
        '(sender_id = ? OR receiver_id = ?) AND date >= ? AND date <= ?',
        @account.id, @account.id, params[:from_date], params[:to_date]
      )


      @opening_balance = @account.opening_balance
      @receive_amount = @payments.where(receiver_id: @account.id).sum(:amount)
      @send_amount = @payments.where(sender_id: @account.id).sum(:amount)
      @closing_balance = @opening_balance + @receive_amount - @send_amount

      @payments.each do |payment|
        payment.receiver_amount = calculate_receiver_amount(payment)
        payment.sender_amount = calculate_sender_amount(payment)
      end
    else
      flash[:alert] = "Account not found."
      redirect_to reports_path
    end
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Account not found."
    redirect_to reports_path
  end

  private

def calculate_receiver_amount(payment)

  receiving_payments = current_user.company.payments.where(receiver_id: payment.receiver_id, sender_id: payment.sender_id)
  receiver_amount = receiving_payments.sum(:amount)
  receiver_amount
end
private

def calculate_sender_amount(payment)
  sending_payments = current_user.company.payments.where(sender_id: payment.sender_id, receiver_id: payment.receiver_id)
  sender_amount = sending_payments.sum(:amount)
  sender_amount
end

   end
