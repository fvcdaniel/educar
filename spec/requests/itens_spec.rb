#encoding=utf-8
require 'spec_helper'

describe "Itens" do
  describe "without role admin" do
		subject{page}
		let(:user) { FactoryGirl.create(:user)}
		before do
			visit itens_path
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
			visit itens_path
			fill_in "Email",    with: user.email
			fill_in "Password", with: user.password
			click_button "Entrar"
		end

		it { should have_selector('div.alert.alert-success', text: 'Autenticado com sucesso.')}
		it { should have_selector('h1', text: 'Itens')}

		describe "validacao das questões" do

			before do
				FactoryGirl.create(:questao)
				visit new_item_path
			end

			describe "validacao 1" do
				before {click_button "Criar Item"}
				it {should have_selector('span', :text => 'não pode ficar em branco')}
			end

			describe "validacao 2" do
			before do				
				select '1 - Crase', from: 'Questão'
				click_button 'Criar Item'
			end
				it {should have_selector('span', :text => 'não pode ficar em branco')}
			end

			describe 'validacao 3' do
				before do
					select '1 - Crase', from: 'Questão'
					fill_in 'Descrição', with: 'Descrição do Item'
					click_button 'Criar Item'
				end
				it {should have_selector('div.alert.alert-success', text: 'Item criado com sucesso.')}
			end

		end
	end
end
