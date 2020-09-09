class RemoveAdminFromConsultants < ActiveRecord::Migration[6.0]
  def change
    remove_column :consultants, :admin, :boolean
  end
end
