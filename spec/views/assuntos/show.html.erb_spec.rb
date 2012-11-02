require 'spec_helper'

describe "assuntos/show" do
  before(:each) do
    @assunto = assign(:assunto, stub_model(Assunto,
      :nome => "Nome",
      :materia => nil,
      :assunto => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
