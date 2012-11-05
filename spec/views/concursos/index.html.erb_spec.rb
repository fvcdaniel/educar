require 'spec_helper'

describe "concursos/index" do
  before(:each) do
    assign(:concursos, [
      stub_model(Concurso,
        :nome => "Nome",
        :ano => 1,
        :cargo => "Cargo",
        :edital => "Edital",
        :gabarito => "Gabarito"
      ),
      stub_model(Concurso,
        :nome => "Nome",
        :ano => 1,
        :cargo => "Cargo",
        :edital => "Edital",
        :gabarito => "Gabarito"
      )
    ])
  end

  it "renders a list of concursos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Cargo".to_s, :count => 2
    assert_select "tr>td", :text => "Edital".to_s, :count => 2
    assert_select "tr>td", :text => "Gabarito".to_s, :count => 2
  end
end
