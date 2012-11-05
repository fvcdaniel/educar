require 'spec_helper'

describe "Concursos" do
  describe "with role admin" do

  	subject{page}

    let(:user) { FactoryGirl.create(:user)}
    let(:role) { FactoryGirl.create(:role)}
    before do
      user.roles << role
      visit concursos_path
      fill_in "Email",    with: user.email
      fill_in "Password", with: user.password
      click_button "Entrar"
    end

    it { should have_selector('div.alert.alert-success', text: 'Autenticado com sucesso.')}
    it { should have_selector('h1', text: 'Concursos')}

    describe "validacao dos assuntos" do

      before do
        visit new_concurso_path
      end

      describe "validacao 1" do
        before {click_button "Criar Concurso"}
        it {should have_selector('span', :text => 'o pode ficar em branco')}
      end

      describe "validacao 2" do
        before do
          fill_in 'Nome', with: 'ConcursoNome'
          click_button 'Criar Concurso'
        end
        it {should have_selector('span', :text => 'o pode ficar em branco')}
      end

      describe 'validacao 3' do
        before do
          fill_in 'Nome', with: 'ConcursoNome'
          select '2012', from: 'Ano'
          click_button 'Criar Concurso'
        end
        it {should have_selector('span', :text => 'o pode ficar em branco')}
      end

      describe 'validacao 4' do
        before do
          fill_in 'Nome', with: 'ConcursoNome'
          select '2012', from: 'Ano'
          fill_in 'Cargo', with: 'Programador'
          click_button 'Criar Concurso'
        end
        it {should have_selector('div.alert.alert-success', text: 'Concurso criado com sucesso.')}
      end

    end
  end
end
