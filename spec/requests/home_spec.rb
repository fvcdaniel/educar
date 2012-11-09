#encoding=utf-8
require 'spec_helper'

describe "Home" do
	subject {page}
	before do 
		mat = FactoryGirl.create(:materia)
		mat2 = FactoryGirl.create(:materia2)
		assunto = FactoryGirl.create(:assunto, materia: mat)
		concurso = FactoryGirl.create(:concurso2)
		questao = FactoryGirl.create(:questao, materia: mat, assunto: assunto)

		visit root_path
	end
	it { should_not have_selector('a', text: 'logica')}
	it { should have_selector('a', text: 'portugues')}
	it { should have_selector('a', text: 'programacao')}
	it { should have_selector('a', text: 'CRASE')}
	it { should have_selector('a', text: 'CONCURSO - CARGO')}
	it { should have_selector('a', text: 'CONCURSO2 - CARGO2')}

	describe "click link from materias menu 1" do
		before do
			click_link 'portugues'
		end
		it { should_not have_selector('a', text: 'logica')}
		it { should have_selector('a', text: 'portugues')}
		it { should have_selector('a', text: 'programacao')}
		it { should have_selector('a', text: 'CRASE')}
		it { should have_selector('a', text: 'CONCURSO - CARGO')}
		it { should_not have_selector('a', text: 'CONCURSO2 - CARGO2')}
	end

	describe "click link from materias menu 2" do
		before do
			click_link 'programacao'
		end
		it { should_not have_selector('a', text: 'logica')}
		it { should have_selector('a', text: 'portugues')}
		it { should have_selector('a', text: 'programacao')}
		it { should_not have_selector('a', text: 'CRASE')}
		it { should_not have_selector('a', text: 'CONCURSO - CARGO')}
		it { should_not have_selector('a', text: 'CONCURSO2 - CARGO2')}
	end
end