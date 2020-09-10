class AddAdminToConsultants < ActiveRecord::Migration[6.0]
  def change
    add_column :consultants, :admin, :boolean, default: false
  end
end
