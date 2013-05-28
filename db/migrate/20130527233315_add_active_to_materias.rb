class AddActiveToMaterias < ActiveRecord::Migration
  def change
    add_column :materias, :active, :boolean
  end
end
