class CreateItens < ActiveRecord::Migration
  def change
    create_table :itens do |t|
      t.text :desc
      t.belongs_to :questao

      t.timestamps
    end
    add_index :itens, :questao_id
  end
end
