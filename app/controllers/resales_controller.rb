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
    
    file = params[:resale][:file][:tempfile]
    @resale = Resale.create(:season => params[:resale][:season], :year => params[:resale][:year], :spreadsheet => file.path, :admin_id => current_user.id)
    if @resale
      
      new_sheet = Roo::Spreadsheet.open(@resale.spreadsheet)
      sheet_hash = new_sheet.sheet(0).each(date: 'Date', start_time: 'Start Time', end_time: 'End Time', description: 'Description', volunteer: 'Volunteer Name', seller_number: 'Seller Number' ) do |r|
        if r[:date] != "Date" && r[:start_time] != "Start Time" && r[:volunteer] != "empty"
          first_name = r[:volunteer].split(", ")[1].strip
          last_name = r[:volunteer].split(", ")[0].strip
          
          w = Worker.find_or_create_by(first_name: first_name, last_name: last_name, member_number: r[:seller_number]) 
          w.update(:first_name => first_name, :last_name => last_name, :member_number => r[:seller_number])
          if !@resale.workers.include?(w)
            @resale.workers << w 
          end
          s = Shift.find_or_create_by(resale_date: r[:date], start_time: r[:start_time], end_time: r[:end_time], description: r[:description], resale_id: @resale.id)  
          w.shifts << s
            # s = rw.shifts.find_or_initialize_by(resale_date: r[:date], start_time: r[:start_time], end_time: r[:end_time], description: r[:description], resale_id: @resale.id)
            # s.save
          
          
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
    
    if current_user.authenticate(params[:password])
      Shift.where(:resale_id => @resale.id).each {|r| r.destroy}
      
      @resale.destroy
      redirect '/resales'
    end
    flash[:error] = "Sorry, you are not authorized to edit"
    redirect "/resales/#{@resale.id}"
  end

  get '/set_default_resale/:id' do
    @resale = Resale.find(params[:id])
    if @resale
      session[:resale_id] = @resale.id
      redirect '/resales'
    else
      flash[:error] = "Couldn't set default resale"
    end
  end
end
