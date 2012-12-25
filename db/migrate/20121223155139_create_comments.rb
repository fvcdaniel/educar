class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :texto

      t.timestamps
    end
  end
end
