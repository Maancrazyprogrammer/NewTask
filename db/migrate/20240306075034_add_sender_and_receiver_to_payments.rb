class AddSenderAndReceiverToPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :payments, :sender_id, :integer
    add_column :payments, :receiver_id, :integer
  end
end
