require 'spec_helper'

describe "Materias" do
  
  describe "GET /materias" do

    describe "without role admin" do

      subject{page}

      let(:user) { FactoryGirl.create(:user)}
      before do
        visit materias_path
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_button "Entrar"
      end

      it { should have_selector('div.alert.alert-error', text: 'autorizado o acesso a esta ')}

    end  

    describe "with role admin" do

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

      it { should have_selector('div.alert.alert-success', text: 'Autenticado com sucesso.')}
      it { should have_selector('h1', text: 'Materias')}

    end  

  end

  describe "GET /materias" do
    it "not works! without validation" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get materias_path
      response.status.should be(302)
    end
  end
end
