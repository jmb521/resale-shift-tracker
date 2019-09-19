class ShiftWorkersController < ApplicationController

  # GET: /shift_workers
  get "/shift_workers" do
    erb :"/shift_workers/index.html"
  end

  # GET: /shift_workers/new
  get "/shift_workers/new" do
    erb :"/shift_workers/new.html"
  end

  # POST: /shift_workers
  post "/shift_workers" do
    redirect "/shift_workers"
  end

  # GET: /shift_workers/5
  get "/shift_workers/:id" do
    erb :"/shift_workers/show.html"
  end

  # GET: /shift_workers/5/edit
  get "/shift_workers/:id/edit" do
    erb :"/shift_workers/edit.html"
  end

  # PATCH: /shift_workers/5
  patch "/shift_workers/:id" do
    @shift_worker = ShiftWorker.find(params[:id])
    @shift_worker.update(checked_in: true)
    redirect "/shift_workers/#{@shift_worker.worker_id}"
    
  end

  # DELETE: /shift_workers/5/delete
  delete "/shift_workers/:id/delete" do
    redirect "/shift_workers"
  end
end
