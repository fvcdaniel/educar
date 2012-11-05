require "spec_helper"

describe QuestoesController do
  describe "routing" do

    it "routes to #index" do
      get("/questoes").should route_to("questoes#index")
    end

    it "routes to #new" do
      get("/questoes/new").should route_to("questoes#new")
    end

    it "routes to #show" do
      get("/questoes/1").should route_to("questoes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/questoes/1/edit").should route_to("questoes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/questoes").should route_to("questoes#create")
    end

    it "routes to #update" do
      put("/questoes/1").should route_to("questoes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/questoes/1").should route_to("questoes#destroy", :id => "1")
    end

  end
end
