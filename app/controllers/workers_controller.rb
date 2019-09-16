class WorkersController < ApplicationController

  # GET: /workers
  get "/workers" do
    erb :"/workers/index.html"
  end

  # GET: /workers/new
  get "/workers/new" do
    erb :"/workers/new.html"
  end

  # POST: /workers
  post "/workers" do
    redirect "/workers"
  end

  # GET: /workers/5
  get "/workers/:id" do
    erb :"/workers/show.html"
  end

  # GET: /workers/5/edit
  get "/workers/:id/edit" do
    erb :"/workers/edit.html"
  end

  # PATCH: /workers/5
  patch "/workers/:id" do
    redirect "/workers/:id"
  end

  # DELETE: /workers/5/delete
  delete "/workers/:id/delete" do
    redirect "/workers"
  end
end
