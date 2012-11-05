require 'spec_helper'

describe "concursos/show" do
  before(:each) do
    @concurso = assign(:concurso, stub_model(Concurso,
      :nome => "Nome",
      :ano => 1,
      :cargo => "Cargo",
      :edital => "Edital",
      :gabarito => "Gabarito"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    rendered.should match(/1/)
    rendered.should match(/Cargo/)
    rendered.should match(/Edital/)
    rendered.should match(/Gabarito/)
  end
end
