class CreateResposta < ActiveRecord::Migration
  def change
    create_table :resposta do |t|
      t.belongs_to :questao
      t.belongs_to :user
      t.string :gabarito
      t.string :resposta
      t.integer :tempo

      t.timestamps
    end
    add_index :resposta, :questao_id
    add_index :resposta, :user_id
  end
end
