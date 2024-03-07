class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.date :date
      t.integer :amount
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
