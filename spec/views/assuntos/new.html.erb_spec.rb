require 'spec_helper'

describe "assuntos/new" do
  before(:each) do
    assign(:assunto, stub_model(Assunto,
      :nome => "MyString",
      :materia => nil,
      :assunto => nil
    ).as_new_record)
  end

  it "renders new assunto form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => assuntos_path, :method => "post" do
      assert_select "input#assunto_nome", :name => "assunto[nome]"
      assert_select "select#assunto_materia_id", :name => "assunto[materia]"
      assert_select "select#assunto_assunto_id", :name => "assunto[assunto]"
    end
    assert_select "h1", text: 'Novo Assunto'
  end
end
