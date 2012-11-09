require 'spec_helper'

describe "itens/new" do
  before(:each) do
    questao = FactoryGirl.create(:questao2)
    assign(:item, stub_model(Item,
      :desc => "MyText",
      :questao => questao
    ).as_new_record)
  end

  it "renders new item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => itens_path, :method => "post" do
      assert_select "textarea#item_desc", :name => "item[desc]"
      assert_select "select#item_questao_id", :name => "item[questao]"
    end
  end
end
