require "spec_helper"

describe ConcursosController do
  describe "routing" do

    it "routes to #index" do
      get("/concursos").should route_to("concursos#index")
    end

    it "routes to #new" do
      get("/concursos/new").should route_to("concursos#new")
    end

    it "routes to #show" do
      get("/concursos/1").should route_to("concursos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/concursos/1/edit").should route_to("concursos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/concursos").should route_to("concursos#create")
    end

    it "routes to #update" do
      put("/concursos/1").should route_to("concursos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/concursos/1").should route_to("concursos#destroy", :id => "1")
    end

  end
end
