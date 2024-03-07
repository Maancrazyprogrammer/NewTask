class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.integer :role
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
