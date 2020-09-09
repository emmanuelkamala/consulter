class AddProfessionToConsultants < ActiveRecord::Migration[6.0]
  def change
    add_column :consultants, :profession, :string
  end
end
