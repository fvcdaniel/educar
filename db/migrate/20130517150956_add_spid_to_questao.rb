class AddSpidToQuestao < ActiveRecord::Migration
  def change
    add_column :questoes, :spid, :integer
  end
end
