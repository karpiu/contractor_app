class BunnyConfiguration
  def initialize
    @connection = Bunny.new
    @connection.start
    @channel = @connection.create_channel
    @exchange = @channel.default_exchange
    @push_queue = @channel.queue("payment_requests.create", :durable => true)
    @pop_queue = @channel.queue("payment_requests.update", :durable => true)

    @pop_queue.subscribe do |delivery_info, metadata, payload|
      params = JSON.parse(payload)
      PaymentRequest.find(params['id']).update!(state: params['state'])
    end
  end

  def publish(payload)
    @exchange.publish(payload, :routing_key => "payment_requests.create")
  end
end

BUNNY_OBJECT = BunnyConfiguration.new
