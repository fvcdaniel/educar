require 'spec_helper'

describe "itens/edit" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :desc => "MyText",
      :questao => nil
    ))
  end

  it "renders the edit item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => itens_path(@item), :method => "post" do
      assert_select "textarea#item_desc", :name => "item[desc]"
      assert_select "select#item_questao_id", :name => "item[questao]"
    end
  end
end
