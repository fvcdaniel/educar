require 'spec_helper'

describe "materias/index" do
  before(:each) do
    assign(:materias, [
      stub_model(Materia,
        :nome => "Nome",
        :imagem => "Imagem"
      ),
      stub_model(Materia,
        :nome => "Nome",
        :imagem => "Imagem"
      )
    ])
  end

  it "renders a list of materias" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Imagem".to_s, :count => 2
  end
end
