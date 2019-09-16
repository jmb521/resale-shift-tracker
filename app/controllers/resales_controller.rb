class ResalesController < ApplicationController

  # GET: /resales
  get "/resales" do
    erb :"/resales/index.html"
  end

  # GET: /resales/new
  get "/resales/new" do
    erb :"/resales/new.html"
  end

  # POST: /resales
  post "/resales" do
    redirect "/resales"
  end

  # GET: /resales/5
  get "/resales/:id" do
    erb :"/resales/show.html"
  end

  # GET: /resales/5/edit
  get "/resales/:id/edit" do
    erb :"/resales/edit.html"
  end

  # PATCH: /resales/5
  patch "/resales/:id" do
    redirect "/resales/:id"
  end

  # DELETE: /resales/5/delete
  delete "/resales/:id/delete" do
    redirect "/resales"
  end
end
