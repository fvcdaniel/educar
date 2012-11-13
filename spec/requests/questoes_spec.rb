#encoding=utf-8
require 'spec_helper'

describe "Questoes" do
	describe "without role admin" do
		subject{page}
		let(:user) { FactoryGirl.create(:user)}
		before do
			visit questoes_path
			fill_in "Email",    with: user.email
			fill_in "Password", with: user.password
			click_button "Entrar"
		end
		it { should have_selector('div.alert.alert-error', text: 'Não autorizado o acesso a esta página.')}
	end  

	describe "with role admin" do

		subject{page}

		let(:user) { FactoryGirl.create(:user)}
		let(:role) { FactoryGirl.create(:role)}
		before do
			user.roles << role
			visit questoes_path
			fill_in "Email",    with: user.email
			fill_in "Password", with: user.password
			click_button "Entrar"
		end

		it { should have_selector('div.alert.alert-success', text: 'Autenticado com sucesso.')}
		it { should have_selector('h1', text: 'Questões')}

		describe "validacao das questões" do

			before do
				FactoryGirl.create(:concurso)
				#FactoryGirl.create(:materia)
				FactoryGirl.create(:assunto)
				visit new_questao_path
			end

			describe "validacao 1" do
				before {click_button "Criar Questão"}
				it {should have_selector('span', :text => 'não pode ficar em branco')}
			end

			describe "validacao 2" do
			before do				
				select 'concurso', from: 'Concurso'
				click_button 'Criar Questão'
			end
				it {should have_selector('span', :text => 'não pode ficar em branco')}
			end

			describe 'validacao 3' do
				before do
				select 'concurso', from: 'Concurso'
				select 'logica', from: 'Matéria'
				click_button 'Criar Questão'
			end
				it {should have_selector('span', :text => 'não pode ficar em branco')}
			end

			describe 'validacao 4' do
				before do
					select 'concurso', from: 'Concurso'
					select 'logica', from: 'Matéria'
					select 'Crase', from: 'Assunto'
					click_button 'Criar Questão'
				end
				it {should have_selector('span', text: 'não pode ficar em branco')}
			end

			describe 'validacao 5' do
				before do
					select 'concurso', from: 'Concurso'
					select 'logica', from: 'Matéria'
					select 'Crase', from: 'Assunto'
					fill_in 'Texto', with: 'Quem nasceu primeiro o ovo ou a galinha?'
					select 'A', from: 'Gabarito'
					click_button 'Criar Questão'
				end
				it {should have_selector('div.alert.alert-success', text: 'Questão criada com sucesso.')}
			end
		end
	end
end
