class WorkersController < ApplicationController

  # GET: /workers
  get "/workers" do
    @workers = Worker.all
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
    @worker = Worker.find(params[:id])
    erb :"/workers/show.html"
  end
  
  # GET: /workers/5/edit
  get "/workers/:id/edit" do
    @worker = Worker.find(params[:id])
    erb :"/workers/edit.html"
  end
  
  # PATCH: /workers/5
  patch "/workers/:id" do
    @worker = Worker.find(params[:id])
    redirect "/workers/:id"
  end
  
  # DELETE: /workers/5/delete
  delete "/workers/:id/delete" do
    @worker = Worker.find(params[:id])
    redirect "/workers"
  end

  get '/search' do
    
    @workers = Worker.where("last_name LIKE ?", "%#{params[:search]}%")
    erb :"/workers/index.html"
  end
end
