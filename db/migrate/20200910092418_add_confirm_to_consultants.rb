class AddConfirmToConsultants < ActiveRecord::Migration[6.0]
  def change
    add_column :consultants, :confirm, :boolean, default: false
  end
end
