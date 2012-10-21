class CreateMaterias < ActiveRecord::Migration
  def change
    create_table :materias do |t|
      t.string :nome
      t.string :imagem

      t.timestamps
    end
  end
end
