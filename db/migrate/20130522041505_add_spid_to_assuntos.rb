class AddSpidToAssuntos < ActiveRecord::Migration
  def change
    add_column :assuntos, :spid, :integer
  end
end
