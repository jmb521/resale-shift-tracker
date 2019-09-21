class ShiftWorkersController < ApplicationController

  # GET: /shift_workers
  get "/shift_workers" do
    @shift_worker = ShiftWorker.all
    erb :"/shift_workers/index.html"
  end

  
  # # GET: /shift_workers/5
  # get "/shift_workers/:id" do
  #   @shift_worker = ShiftWorker.find(params[:id])
  #   erb :"/shift_workers/show.html"
  # end
  
 
  
  # PATCH: /shift_workers/5
  patch "/shift_workers/:id" do
    @shift_worker = ShiftWorker.find(params[:id])
    @shift_worker.update(checked_in: true)
    redirect "/shift_workers/#{@shift_worker.worker_id}"
    
  end
  
  # DELETE: /shift_workers/5/delete
  delete "/shift_workers/:id/delete" do
    @shift_worker = ShiftWorker.find(params[:id])
    redirect "/shift_workers"
  end
end
