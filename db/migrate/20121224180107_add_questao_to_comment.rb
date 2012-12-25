class AddQuestaoToComment < ActiveRecord::Migration
  def change
    add_column :comments, :questao_id, :integer
    add_index :comments, :questao_id
  end
end
