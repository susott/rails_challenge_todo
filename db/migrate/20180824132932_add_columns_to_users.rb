class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :status, :string
    add_column :users, :type, :string
    add_column :users, :profession, :string
    add_column :users, :service, :string
  end
end
