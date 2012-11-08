require 'spec_helper'

describe "questoes/index" do
  before(:each) do
    assign(:questoes, [
      stub_model(Questao,
        :materia => Materia.new(:nome => 'mat'),
        :concurso => Concurso.new(:nome => 'conc'),
        :assunto => Assunto.new(:nome => 'ass'),
        :texto => "MyText"
      ),
      stub_model(Questao,
        :materia => Materia.new(:nome => 'mat'),
        :concurso => Concurso.new(:nome => 'conc'),
        :assunto => Assunto.new(:nome => 'ass'),
        :texto => "MyText"
      )
    ])
  end

  it "renders a list of questoes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 'mat', :count => 2
    assert_select "tr>td", :text => 'conc', :count => 2
    assert_select "tr>td", :text => 'ass', :count => 2
    assert_select "tr>td", :text => "MyText...".to_s, :count => 2
  end
end
