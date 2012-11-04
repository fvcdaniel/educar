class AdicionaRoleAdmin < ActiveRecord::Migration
  def up
    puts 'ok teste'
  	Role.create!(:name=>'admin') if Role.find_by_name(:admin).nil?
  end

  def down
  	Role.find_by_name('admin').destroy unless Role.find_by_name(:admin).nil?
  end
end
