require 'spec_helper'

describe "concursos/edit" do
  before(:each) do
    @concurso = assign(:concurso, stub_model(Concurso,
      :nome => "MyString",
      :ano => 1,
      :cargo => "MyString",
      :edital => "MyString",
      :gabarito => "MyString"
    ))
  end

  it "renders the edit concurso form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => concursos_path(@concurso), :method => "post" do
      assert_select "input#concurso_nome", :name => "concurso[nome]"
      assert_select "select#concurso_ano", :name => "concurso[ano]"
      assert_select "input#concurso_cargo", :name => "concurso[cargo]"
      assert_select "input#concurso_edital", :name => "concurso[edital]"
      assert_select "input#concurso_gabarito", :name => "concurso[gabarito]"
    end
  end
end
