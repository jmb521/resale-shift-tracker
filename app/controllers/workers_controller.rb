class WorkersController < ApplicationController

  # GET: /workers
  get "/workers" do
    @workers = Worker.search(params[:search]).order(last_name: :asc) ||Worker.order(last_name: :asc) 
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
    @worker = current_resale.workers.find(params[:id])
    if @worker
      @shifts = @worker.shifts.join(:shift_workers).where(:checked_in => false)

      erb :"/workers/show.html"
    end
  end
  
  # GET: /workers/5/edit
  get "/workers/:id/edit" do
    @worker = Worker.find(params[:id])
    erb :"/workers/edit.html"
  end
  
  # PATCH: /workers/5
  patch "/workers/:id" do
    @worker = Worker.find(params[:id])
    @worker.update(params[:worker])
    redirect "/workers/#{@worker.id}"
    
  end
  
  # DELETE: /workers/5/delete
  delete "/workers/:id/delete" do
    @worker = Worker.find(params[:id])
    if current_user.authenticate(params[:password])
      @worker.destroy
      flash[:message] = "Worker Successfully Deleted"
      redirect '/workers'
    else
      flash[:message] = "You entered the wrong password"
      redirect "/workers"
    end
  end


  

  
end
