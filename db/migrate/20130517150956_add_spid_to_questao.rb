class AddSpidToQuestao < ActiveRecord::Migration
  def change
    add_column :questoes, :spid, :string
  end
end
