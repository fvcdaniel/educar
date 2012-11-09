require 'spec_helper'

describe "itens/show" do
  before(:each) do
    questao = FactoryGirl.create(:questao2)
    @item = assign(:item, stub_model(Item,
      :desc => "MyText",
      :questao => questao
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/1 - Crase/)
  end
end
