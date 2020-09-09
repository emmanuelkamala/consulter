class RemoveDescriptionFromConsultants < ActiveRecord::Migration[6.0]
  def change
    remove_column :consultants, :description, :text
  end
end
