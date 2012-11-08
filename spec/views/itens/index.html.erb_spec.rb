require 'spec_helper'

describe "itens/index" do
  
  before(:each) do
    questao = FactoryGirl.create(:questao)
    assign(:itens, [
      stub_model(Item,
        :desc => "MyText",
        :questao => questao
      ),
      stub_model(Item,
        :desc => "MyText",
        :questao => questao
      )
    ])
  end

  it "renders a list of itens" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText...".to_s, :count => 2
    assert_select "tr>td", :text => '1 - Crase', :count => 2
  end
end
