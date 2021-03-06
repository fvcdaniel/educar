#encoding=utf-8
require 'spec_helper'

describe "All" do

  subject{page}

  let(:user) { FactoryGirl.create(:user)}
  let(:role) { FactoryGirl.create(:role)}
  before do
    user.roles << role
    visit materias_path
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Entrar"
  end

  describe "teste de link materias na pagina inicial" do
    before do
      click_link "Gerenciar"
      click_link "Materias"
    end
    it { should have_selector('h1', :text => "Materias")}
  end

  describe "teste de link assuntos na pagina inicial" do
    before do
      click_link "Gerenciar"
      click_link "Assuntos"
    end
    it { should have_selector('h1', :text => "Assuntos")}
  end

  describe "teste de link concursos na pagina inicial" do
    before do
      click_link "Gerenciar"
      click_link "Concursos"
    end
    it { should have_selector('h1', :text => "Concursos")}
  end

  describe "teste de link Questoes na pagina inicial" do
    before do
      click_link "Gerenciar"
      click_link "Questões"
    end
    it { should have_selector('h1', :text => "Questões")}
  end

end
