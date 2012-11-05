class CreateQuestoes < ActiveRecord::Migration
  def change
    create_table :questoes do |t|
      t.belongs_to :materia
      t.belongs_to :concurso
      t.belongs_to :assunto
      t.text :texto

      t.timestamps
    end
    add_index :questoes, :materia_id
    add_index :questoes, :concurso_id
    add_index :questoes, :assunto_id
  end
end
