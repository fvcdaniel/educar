require 'spec_helper'

describe "questoes/show" do
  let(:mat) {FactoryGirl.create(:materia)}
  let(:conc) {FactoryGirl.create(:concurso)}
  before(:each) do
    @questao = assign(:questao, stub_model(Questao,
      :materia => mat,
      :concurso => conc,
      :assunto => Assunto.new(:nome => :nome),
      :texto => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(mat.nome)
    rendered.should match(conc.nome)
    rendered.should match(/MyText/)
  end
end
