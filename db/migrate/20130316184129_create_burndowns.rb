class CreateBurndowns < ActiveRecord::Migration
  def change
    create_table :burndowns do |t|
      t.string :portugues
      t.string :dadmin
      t.string :dconst
      t.string :computacao
      t.string :rlogico
      t.integer :dias
      t.string :colors

      t.timestamps
    end
  end
end
