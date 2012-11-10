#encoding=utf-8
require 'spec_helper'

describe "Home" do
	subject {page}
	before do 
		mat = FactoryGirl.create(:materia)
		mat2 = FactoryGirl.create(:materia2)
		assunto = FactoryGirl.create(:assunto, materia: mat)
		concurso = FactoryGirl.create(:concurso2)
		user = FactoryGirl.create(:user)
		questao = FactoryGirl.create(:questao, materia: mat, assunto: assunto, user: user)

		visit root_path
	end
	it { should_not have_selector('a', text: 'logica')}
	it { should have_selector('a', text: 'Portugues')}
	it { should have_selector('a', text: 'Programacao')}
	it { should have_selector('a', text: 'CRASE')}
	it { should have_selector('a', text: 'CONCURSO - CARGO')}
	it { should have_selector('a', text: 'CONCURSO2 - CARGO2')}

	describe "click link from materias menu 1" do
		before do
			click_link 'Portugues'
		end
		it { should_not have_selector('a', text: 'logica')}
		it { should have_selector('a', text: 'Portugues')}
		it { should have_selector('a', text: 'Programacao')}
		it { should have_selector('a', text: 'CRASE')}
		it { should have_selector('a', text: 'CONCURSO - CARGO')}
		it { should_not have_selector('a', text: 'CONCURSO2 - CARGO2')}
		describe "click link from assunto" do
			before do
				click_link "CRASE"
				save_and_open_page
			end

			it { should have_selector('h1', text: 'Resolvendo')}
		end
	end

	describe "click link from materias menu 2" do
		before do
			click_link 'Programacao'
		end
		it { should_not have_selector('a', text: 'logica')}
		it { should have_selector('a', text: 'Portugues')}
		it { should have_selector('a', text: 'Programacao')}
		it { should_not have_selector('a', text: 'CRASE')}
		it { should_not have_selector('a', text: 'CONCURSO - CARGO')}
		it { should_not have_selector('a', text: 'CONCURSO2 - CARGO2')}
	end
end