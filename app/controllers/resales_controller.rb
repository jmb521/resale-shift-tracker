class ResalesController < ApplicationController

  # GET: /resales
  get "/resales" do
    @resales = Resale.all
    erb :"/resales/index.html"
  end

  # GET: /resales/new
  get "/resales/new" do
    erb :"/resales/new.html"
  end

  # POST: /resales
  post "/resales" do
    binding.pry 
    file = params[:resale][:file][:tempfile]
    @resale = Resale.create(:season => params[:resale][:season], :year => params[:resale][:year], :spreadsheet => file.path, :admin_id => current_user.id)
    if @resale
      
      new_sheet = Roo::Spreadsheet.open(@resale.spreadsheet)
      sheet_hash = new_sheet.sheet(0).each(date: 'Date', start_time: 'Start Time', end_time: 'End Time', description: 'Description', volunteer: 'Volunteer Name', seller_number: 'Seller Number' ) do |r|
        if r[:date] != "Date" && r[:start_time] != "Start Time" 
          first_name = r[:volunteer].split(", ")[1]
          last_name = r[:volunteer].split(", ")[0]
          w = Worker.find_or_create_by(first_name: first_name, last_name: last_name, member_number: r[:seller_number])
          s = w.shifts.find_or_create_by(resale_date: r[:date], start_time: r[:start_time], end_time: r[:end_time], description: r[:description], resale_id: @resale.id)
          
        end
      end
      
      redirect '/resales'
    else
      #! flash message that resale couldn't be saved. 
      redirect '/resales/new'
    end

    
  end

  # GET: /resales/5
  get "/resales/:id" do
    @resale = Resale.find(params[:id])
    erb :"/resales/show.html"
  end
  
  # GET: /resales/5/edit
  get "/resales/:id/edit" do
    @resale = Resale.find(params[:id])
    erb :"/resales/edit.html"
  end
  
  # PATCH: /resales/5
  patch "/resales/:id" do
    @resale = Resale.find(params[:id])
    redirect "/resales/:id"
  end
  
  # DELETE: /resales/5/delete
  delete "/resales/:id/delete" do
    
    @resale = Resale.find(params[:id])
    @admin = Admin.find(@resale.admin_id)
    if @admin.authenticate(params[:password])
      Shift.where(:resale_id => @resale.id).each {|r| r.destroy}
      
      @resale.destroy
      redirect '/resales'
    end
    #! you aren't allowed to edit flash message
    redirect "/resales/#{@resale.id}"
  end
end
