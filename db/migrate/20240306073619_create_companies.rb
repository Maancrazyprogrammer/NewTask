class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.date :start_date
      t.integer :opening_balance

      t.timestamps
    end
  end
end
