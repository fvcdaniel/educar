class AddNivelToQuestao < ActiveRecord::Migration
  def change
    add_column :questoes, :nivel, :string
  end
end
