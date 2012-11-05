class CreateConcursos < ActiveRecord::Migration
  def change
    create_table :concursos do |t|
      t.string :nome
      t.integer :ano
      t.string :cargo
      t.string :edital
      t.string :gabarito

      t.timestamps
    end
  end
end
