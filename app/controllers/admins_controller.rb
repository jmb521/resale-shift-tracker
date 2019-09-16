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
      redirect '/resales'
    else
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
        #!add flash messages verifying profile is updated
      else
        redirect "/admins/#{@admin.id}"
        #!add flash message that the password they entered was wrong. 

    redirect "/admins/:id"
  end

  # DELETE: /admins/5/delete
  delete "/admins/:id/delete" do
    redirect "/admins"
  end
end
