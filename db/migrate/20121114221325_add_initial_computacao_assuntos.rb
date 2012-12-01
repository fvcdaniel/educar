#encoding=UTF-8
class AddInitialComputacaoAssuntos < ActiveRecord::Migration
  def up
  	materia = Materia.find_by_nome('Ciência da Computação')

  	ass1 = Assunto.create!(:nome => 'Organização de Computadores', :materia_id => materia.id)  	
  	Assunto.create!(:nome => 'Arquitetura de Computadores', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Circuitos Digitais', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Compiladores e Interpretadores', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Hardware de Microinformática', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'RAID', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'RISC x CISC', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Sistemas de Numeração', :assunto_id => ass1.id, :materia_id => materia.id)

  	ass1 = Assunto.create!(:nome => 'Sistemas Operacionais', :materia_id => materia.id)
  	Assunto.create!(:nome => 'Gerência de Memória e Processo', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'S.O.s - Diversos', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Sistemas Cliente Servidor', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Sistemas de Arquivo', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Unix e Linux', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Virtualização', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Windows 2000 e XP', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Windows NT', :assunto_id => ass1.id, :materia_id => materia.id)

  	ass1 = Assunto.create!(:nome => 'Redes de Computadores', :materia_id => materia.id)
  	Assunto.create!(:nome => 'ATM e Frame-Relay', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Cabeamento', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Equipamentos e Topologias de Redes', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'LDAP', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Modelo OSI', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Padrão Ethernet', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Protocolos de Roteamento e Gerenciamento', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Protocolos Diversos', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Redes - Diversos', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Redes sem fio', :assunto_id => ass1.id, :materia_id => materia.id)
  	ass2 = Assunto.create!(:nome => 'TCP/IP', :materia_id => materia.id, :assunto_id => ass1.id)
  	Assunto.create!(:nome => 'Aplicações', :assunto_id => ass2.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Arquitetura', :assunto_id => ass2.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'DHCP', :assunto_id => ass2.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Endereçamento IP', :assunto_id => ass2.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Protocolo HTTP', :assunto_id => ass2.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'VLANs', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'VOIP', :assunto_id => ass1.id, :materia_id => materia.id)

  	ass1 = Assunto.create!(:nome => 'Segurança', :materia_id => materia.id)
  	Assunto.create!(:nome => 'Auditoria', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Backup', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Conceitos Básicos de Segurança', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Criptografia, Assinatura e Certificados Digitais', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Ferramentas de Segurança', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Firewalls', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'IDS', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Políticas de Segurança', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Segurança - Diversos', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Tipos de Ataque', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'VPN', :assunto_id => ass1.id, :materia_id => materia.id)

  	ass1 = Assunto.create!(:nome => 'Linguagens de Programação', :materia_id => materia.id)
  	Assunto.create!(:nome => 'ASP', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'C C++ JAVA', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Conceitos LPs', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Conceitos de Orientação a Objetos', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Estrutura de Dados (pilhas, filas e listas)', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'HTML XML', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Lógica de Programação', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Outras Linguagens', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Pascal Delphi', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'PHP', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'VB e Interdev', :assunto_id => ass1.id, :materia_id => materia.id)

  	ass1 = Assunto.create!(:nome => 'Banco de Dados', :materia_id => materia.id)
  	Assunto.create!(:nome => 'Modelagem de Dados', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'MySQL', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'OLAP e Datawarehouse', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Oracle', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Organização de Arquivos', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'SGBDs', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'SGBD - ADABAS', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'SQL Server', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'SQL', :assunto_id => ass1.id, :materia_id => materia.id)

  	ass1 = Assunto.create!(:nome => 'Engenharia de Software', :materia_id => materia.id)
  	Assunto.create!(:nome => 'Análise Estruturada e Essencial', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'CASE e Reengenharia', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'CMM', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Desenvolvimento para WEB', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Diversos ENG-SOFT', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Engenharia de Requisitos', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Gerência de Projetos', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Metodologias de Desenvolvimento', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Métricas e Qualidade de Software', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'MPS-BR', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'PMBOK', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Projeto Implantação e Manutenção', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'RUP', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Testes', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'UML', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Usabilidade', :assunto_id => ass1.id, :materia_id => materia.id)
  	
  	ass1 = Assunto.create!(:nome => 'Diversos', :materia_id => materia.id)
  	Assunto.create!(:nome => 'COBIT', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'GED Workflow e BPM', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Geral', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Gestão de TI', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Help DESK', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'ITIL', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Licitação e Contratos de TI', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Planejamento Estratégico e SI', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Software Diversos', :assunto_id => ass1.id, :materia_id => materia.id)
  	Assunto.create!(:nome => 'Teleprocessamento', :assunto_id => ass1.id, :materia_id => materia.id)
  	 
  end

  def down
  	materia = Materia.find_by_nome('Ciência da Computação')
  	id1 = Assunto.where(:nome => 'Organização de Computadores', :materia_id => materia.id).first.id
  	id2 = Assunto.where(:nome => 'Teleprocessamento', :materia_id => materia.id).first.id
  	(id1..id2).each do |id|
  		Assunto.find(id).delete
  	end
  end
end