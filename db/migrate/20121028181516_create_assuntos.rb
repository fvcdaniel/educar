class CreateAssuntos < ActiveRecord::Migration
  def change
    create_table :assuntos do |t|
      t.string :nome
      t.belongs_to :materia
      t.belongs_to :assunto

      t.timestamps
    end
    add_index :assuntos, :materia_id
    add_index :assuntos, :assunto_id
  end
end
