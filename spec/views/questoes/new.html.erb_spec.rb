require 'spec_helper'

describe "questoes/new" do
  before(:each) do
    assign(:questao, stub_model(Questao,
      :materia => nil,
      :concurso => nil,
      :texto => "MyText"
    ).as_new_record)
  end

  it "renders new questao form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => questoes_path, :method => "post" do
      assert_select "select#questao_materia_id", :name => "questao[materia]"
      assert_select "select#questao_concurso_id", :name => "questao[concurso]"
      assert_select "select#questao_assunto_id", :name => "questao[concurso]"
      assert_select "textarea#questao_texto", :name => "questao[texto]"
    end
  end
end
