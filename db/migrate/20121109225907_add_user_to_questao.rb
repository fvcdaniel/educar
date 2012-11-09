class AddUserToQuestao < ActiveRecord::Migration
  def change
    add_column :questoes, :user_id, :integer
    add_index :questoes, :user_id
  end
end
