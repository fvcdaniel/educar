class AddBancaToConcurso < ActiveRecord::Migration
  def change
    add_column :concursos, :banca_id, :integer
  end
end
