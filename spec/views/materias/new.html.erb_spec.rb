require 'spec_helper'

describe "materias/new" do
  before(:each) do
    assign(:materia, stub_model(Materia,
      :nome => "MyString",
      :imagem => "MyString"
    ).as_new_record)
  end

  it "renders new materia form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => materias_path, :method => "post" do
      assert_select "input#materia_nome", :name => "materia[nome]"
      assert_select "input#materia_imagem", :name => "materia[imagem]"
    end
  end
end
