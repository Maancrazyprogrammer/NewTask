class ChangeCompanyReferenceInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :company_id, :bigint, null: true
  end
end
