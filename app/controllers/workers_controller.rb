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
    # @shift_worker = ShiftWorker.find(params[:id])
    # @shift_worker.update(checked_in: true)
    # redirect "/shift_workers/#{@shift_worker.worker_id}"
    #! need to allow workers info to be edited. 
    
  end
  
  # DELETE: /workers/5/delete
  delete "/workers/:id/delete" do
    @worker = Worker.find(params[:id])
    redirect "/workers"
  end

  get '/search' do
    
    @workers = Worker.search(params[:search])
    erb :"/workers/index.html"
  end

  
end
