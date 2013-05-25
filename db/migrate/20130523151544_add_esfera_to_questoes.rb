class AddEsferaToQuestoes < ActiveRecord::Migration
  def change
    add_column :questoes, :esfera, :string
  end
end
