class Account < ApplicationRecord
  belongs_to :company
  has_many :sending_payments, class_name: 'Payment', foreign_key: 'sender_id'
  has_many :receiving_payments, class_name: 'Payment', foreign_key: 'receiver_id'
  has_many :reports
end
