class AdminsController < ApplicationController

  # GET: /admins
  # get "/admins" do
  #   erb :"/admins/index.html"
  # end

  # GET: /admins/new
  get "/signup" do
    erb :"/admins/new.html"
  end

  # POST: /admins
  post "/admins" do

    @admin = Admin.new(params[:admin])
    if @admin.save
      session[:admin_id] = @admin.id
      flash[:message] = "Sign up successful"
      redirect '/resales'
    else
      flash[:error] = "Something went wrong!"
      redirect '/signup'
    end
  end

  # GET: /admins/5
  get "/admins/:id" do
    #admin profile page
    @admin = Admin.find(params[:id])
    erb :"/admins/show.html"
  end
  
  # GET: /admins/5/edit
  get "/admins/:id/edit" do
    @admin = Admin.find(params[:id])
    erb :"/admins/edit.html"
  end
  
  # PATCH: /admins/5
  patch "/admins/:id" do
    @admin = Admin.find(params[:id])
    if !params[:admin][:password].empty? && !params[:admin][:new_password].empty?
      if @admin.authenticate(params[:admin][:password])
        @admin.update(:first_name => params[:admin][:first_name], :last_name => params[:admin][:last_name], :username => params[:admin][:username], :password => params[:admin][:new_password])
        flash[:message] = "Admin account updated"
        redirect "/admins/#{@admin.id}"
      else
        flash[:error] = "Password was incorrect"
        redirect "/admins/#{@admin.id}/edit"
        #!add flash message that the password they entered was wrong. 
      end
    else
      @admin.update(:first_name => params[:admin][:first_name], :last_name => params[:admin][:last_name], :username => params[:admin][:username])
      flash[:message] = "Admin accounted updated!"
      redirect "/admins/:id"
    end
  end

  # DELETE: /admins/5/delete
  # delete "/admins/:id/delete" do
  #   redirect "/admins"
  # end
end
