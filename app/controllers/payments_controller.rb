class PaymentsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_company
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  # load_and_authorize_resource :company # Authorize based on the associated company

  def index
    @payments = @company.payments
  end

  def show
    # Show individual payment details
  end

  def new
    @payment = @company.payments.build
  end

  def create
    @payment = @company.payments.build(payment_params)

    if @payment.save
      redirect_to company_path(@company), notice: 'Payment created successfully.'
    else
      render :new
    end
  end

  def edit
    # Edit payment details
  end

  def update
    if @payment.update(payment_params)
      redirect_to company_payments_path(@company), notice: 'Payment updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @payment.destroy
    redirect_to company_payments_path(@company), notice: 'Payment deleted successfully.'
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_payment
    @payment = @company.payments.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:date, :amount, :sender_id, :receiver_id)
  end
end
