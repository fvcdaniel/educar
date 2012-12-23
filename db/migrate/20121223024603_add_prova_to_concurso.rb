class AddProvaToConcurso < ActiveRecord::Migration
  def change
    add_column :concursos, :prova, :string
  end
end
