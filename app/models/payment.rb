class Payment < ApplicationRecord
  belongs_to :sender, class_name: 'Account', foreign_key: 'sender_id', optional: true
  belongs_to :receiver, class_name: 'Account', foreign_key: 'receiver_id'
  belongs_to :company
  attr_accessor :receiver_amount
  attr_accessor :sender_amount

end
