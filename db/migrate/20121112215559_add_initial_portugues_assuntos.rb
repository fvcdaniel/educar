#encoding=utf-8
class AddInitialPortuguesAssuntos < ActiveRecord::Migration
  def up
  	materia = Materia.find_by_nome('Português')
  	ass1 = Assunto.create!(:nome => 'Gramática Básica', :materia_id => materia.id)
  	Assunto.create!(:nome => 'Plural dos Compostos', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Acentuação Gráfica', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Adjetivos', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Advérbios', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Pronomes', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Substantivos', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Preposição', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Classes das Palavras', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Parônimos', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Figuras de Linguagem', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Formação de Palavras', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Vícios de Linguagem', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Vocabulário', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Ortografia', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Emprego do Porque', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Emprego do QUE', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Emprego do SE', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Termos da Oração', :assunto_id => ass1.id, :materia_id => materia.id)

  	ass2 = Assunto.create!(:nome => 'Gramática Avançada', :materia_id => materia.id)
  	Assunto.create!(:nome => 'Crase', :assunto_id => ass2.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Pontuação', :assunto_id => ass2.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Conjunções e Conectivos', :assunto_id => ass2.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Concordância Nominal', :assunto_id => ass2.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Regência', :assunto_id => ass2.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Concordância Verbal', :assunto_id => ass2.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Verbos', :assunto_id => ass2.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Colocação Pronominal', :assunto_id => ass2.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Período composto por coordenação e subordinação', :assunto_id => ass2.id, :materia_id => materia.id)

  	ass3 = Assunto.create!(:nome => 'Análise Textual', :materia_id => materia.id)
  	Assunto.create!(:nome => 'Ordenação Textual', :assunto_id => ass3.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Clareza Coesão e Coerência', :assunto_id => ass3.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Causa e Efeito', :assunto_id => ass3.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Substituição de frases e parágrafos', :assunto_id => ass3.id, :materia_id => materia.id)
  	
  	ass4 = Assunto.create!(:nome => 'Interpretação de Textos', :materia_id => materia.id)
  	Assunto.create!(:nome => 'Cotidiano', :assunto_id => ass4.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Literatura', :assunto_id => ass4.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Meio Ambiente', :assunto_id => ass4.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Política', :assunto_id => ass4.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Economia', :assunto_id => ass4.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Sociologia', :assunto_id => ass4.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Filosofia', :assunto_id => ass4.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Interpretação de Textos', :assunto_id => ass4.id, :materia_id => materia.id)

  	ass5 = Assunto.create!(:nome => 'Vários', :materia_id => materia.id)
  	Assunto.create!(:nome => 'Diversos', :assunto_id => ass5.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Outros', :assunto_id => ass5.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Redação Oficial', :assunto_id => ass5.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Geral', :assunto_id => ass5.id, :materia_id => materia.id)

  end

  def down
  	materia = Materia.find_by_nome('Português')
  	id1 = Assunto.where(:nome => 'Gramática Básica', :materia_id => materia.id).first.id
  	id2 = Assunto.where(:nome => 'Geral', :materia_id => materia.id).first.id
  	(id1..id2).each do |id|
  		Assunto.find(id).delete
  	end
  end
end
