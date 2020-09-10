class AddConfirmToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :confirm, :boolean, default: false
  end
end
