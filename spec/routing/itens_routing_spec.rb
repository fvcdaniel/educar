require "spec_helper"

describe ItensController do
  describe "routing" do

    it "routes to #index" do
      get("/itens").should route_to("itens#index")
    end

    it "routes to #new" do
      get("/itens/new").should route_to("itens#new")
    end

    it "routes to #show" do
      get("/itens/1").should route_to("itens#show", :id => "1")
    end

    it "routes to #edit" do
      get("/itens/1/edit").should route_to("itens#edit", :id => "1")
    end

    it "routes to #create" do
      post("/itens").should route_to("itens#create")
    end

    it "routes to #update" do
      put("/itens/1").should route_to("itens#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/itens/1").should route_to("itens#destroy", :id => "1")
    end

  end
end
