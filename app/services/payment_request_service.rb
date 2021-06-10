class PaymentRequestService
  def initialize
  	@bunny = ::BUNNY_OBJECT
  end

  def send_request_payment(payload)
  	@bunny.publish(payload)
  end
end
