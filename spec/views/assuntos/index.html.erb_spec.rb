require 'spec_helper'

describe "assuntos/index" do
  before(:each) do
    assign(:assuntos, [
      stub_model(Assunto,
        :nome => "Nome",
        :created_at => Date.today,
        :materia => Materia.new,
        :assunto => Assunto.new
      ),
      stub_model(Assunto,
        :nome => "Nome",
        :created_at => Date.today,
        :materia => Materia.new,
        :assunto => Assunto.new
      )
    ])
  end

  it "renders a list of assuntos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    #assert_select "tr>td", :text => nil.to_s, :count => 2
    #assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
