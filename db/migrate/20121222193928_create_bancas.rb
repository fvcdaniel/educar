class CreateBancas < ActiveRecord::Migration
  def change
    create_table :bancas do |t|
      t.string :nome

      t.timestamps
    end
  end
end
