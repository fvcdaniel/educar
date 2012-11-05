require 'spec_helper'

describe "questoes/edit" do
  before(:each) do
    @questao = assign(:questao, stub_model(Questao,
      :materia => nil,
      :concurso => nil,
      :texto => "MyText"
    ))
  end

  it "renders the edit questao form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => questoes_path(@questao), :method => "post" do
      assert_select "input#questao_materia", :name => "questao[materia]"
      assert_select "input#questao_concurso", :name => "questao[concurso]"
      assert_select "textarea#questao_texto", :name => "questao[texto]"
    end
  end
end
