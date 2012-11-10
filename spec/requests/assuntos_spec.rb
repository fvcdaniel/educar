#encoding=UTF-8
require 'spec_helper'

describe "Assuntos" do

  
  describe "with role admin" do

  	subject{page}

    let(:user) { FactoryGirl.create(:user)}
    let(:role) { FactoryGirl.create(:role)}
    before do
      FactoryGirl.create(:materia)
      FactoryGirl.create(:materia2)
      FactoryGirl.create(:materia3)
      user.roles << role
      visit assuntos_path
      fill_in "Email",    with: user.email
      fill_in "Password", with: user.password
      click_button "Entrar"
    end

    it { should have_selector('div.alert.alert-success', text: 'Autenticado com sucesso.')}
    it { should have_selector('h1', text: 'Assuntos')}

  	describe "GET /assuntos" do
      it "works! (now write some real specs)" do
        # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
        get assuntos_path
        response.status.should be(302)
      end
    end

    describe "validacao dos assuntos" do

      before do
        visit new_assunto_path
      end

      describe "validacao 1" do
        before {click_button "Criar Assunto"}
        it {should have_selector('span', :text => 'o pode ficar em branco')}
      end

      describe "validacao 2" do
        before do
          fill_in 'Nome', with: 'AssuntoNome'
          click_button 'Criar Assunto'
        end
        it {should have_selector('span', :text => 'o pode ficar em branco')}
      end

      describe 'validacao 3' do
        before do
          fill_in 'Nome', with: 'AssuntoMateria'
          select 'portugues', from: 'Matéria'
          click_button 'Criar Assunto'
        end
        it {should have_selector('div.alert.alert-success', text: 'Assunto criado com sucesso.')}
      end

    end
  end
  
end
