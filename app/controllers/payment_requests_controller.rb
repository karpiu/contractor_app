class PaymentRequestsController < ApplicationController
  def index
    @payment_requests = PaymentRequest.all
    @payment_request = PaymentRequest.new
  end

  def create
    payment_request = PaymentRequest.new(payment_request_params)

    if payment_request.save
      PaymentRequestService.new.send_request_payment(payment_request.to_json)
    end

    redirect_to payment_requests_path
  end

  private

  def payment_request_params
    params.require(:payment_request).permit(:amount, :currency, :description)
  end
end
