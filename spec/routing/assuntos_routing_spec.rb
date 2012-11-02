require "spec_helper"

describe AssuntosController do
  describe "routing" do

    it "routes to #index" do
      get("/assuntos").should route_to("assuntos#index")
    end

    it "routes to #new" do
      get("/assuntos/new").should route_to("assuntos#new")
    end

    it "routes to #show" do
      get("/assuntos/1").should route_to("assuntos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/assuntos/1/edit").should route_to("assuntos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/assuntos").should route_to("assuntos#create")
    end

    it "routes to #update" do
      put("/assuntos/1").should route_to("assuntos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/assuntos/1").should route_to("assuntos#destroy", :id => "1")
    end

  end
end
