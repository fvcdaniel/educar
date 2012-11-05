require 'spec_helper'

describe "questoes/show" do
  before(:each) do
    @questao = assign(:questao, stub_model(Questao,
      :materia => nil,
      :concurso => nil,
      :texto => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/MyText/)
  end
end
