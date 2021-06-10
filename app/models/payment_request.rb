class PaymentRequest < ApplicationRecord
  enum state: {
    pending: 0,
    accepted: 1,
    rejected: 2
  }
end
