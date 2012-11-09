#encoding=UTF-8
class AddInitialMateria < ActiveRecord::Migration
  def up
  	Materia.create!(:nome => 'Português')
  	Materia.create!(:nome => 'Raciocínio Lógico')
  	Materia.create!(:nome => 'Direito Administrativo')
  	Materia.create!(:nome => 'Direito Constitucional')
  	Materia.create!(:nome => 'Ciência da Computação')
  	Materia.create!(:nome => 'Língua Inglesa')
  	Materia.create!(:nome => 'Informática Básica')
  end

  def down
  	Materia.find_by_nome('Português').destroy
  	Materia.find_by_nome('Raciocínio Lógico').destroy
  	Materia.find_by_nome('Direito Administrativo').destroy
  	Materia.find_by_nome('Direito Constitucional').destroy
  	Materia.find_by_nome('Ciência da Computação').destroy
  	Materia.find_by_nome('Língua Inglesa').destroy
  	Materia.find_by_nome('Informática Básica').destroy
  end
end
