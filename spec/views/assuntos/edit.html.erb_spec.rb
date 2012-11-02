require 'spec_helper'

describe "assuntos/edit" do
  before(:each) do
    @assunto = assign(:assunto, stub_model(Assunto,
      :nome => "MyString",
      :materia => nil,
      :assunto => nil
    ))
  end

  it "renders the edit assunto form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => assuntos_path(@assunto), :method => "post" do
      assert_select "input#assunto_nome", :name => "assunto[nome]"
      assert_select "select#assunto_materia_id", :name => "assunto[materia]"
      assert_select "select#assunto_assunto_id", :name => "assunto[assunto]"
    end
  end
end
