
require 'roo'
require 'roo-xls'
require 'sinatra/flash'


class ApplicationController < Sinatra::Base

  configure do
    register Sinatra::Flash
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "resale is fun"
  end

  get "/" do
    erb :welcome
  end

  get '/login' do
    erb :"login.html"
  end

  post '/login' do
    @admin = Admin.find_by(:username => params[:admin][:username])
    
    if @admin && @admin.authenticate(params[:admin][:password])
      session[:admin_id] = @admin.id
      flash[:message] = "Signed in!"
      redirect '/resales'
    else
      flash[:error] = "Wrong password, try again!"
      redirect '/login'
    end
  end

  get '/logout' do
    session.destroy
    redirect '/'
  end

  def current_user
    @user = Admin.find_by(:id => session[:admin_id]) if session[:admin_id]
  end


  def is_logged_in?
    !!current_user
  end

  def redirect_if_not_allowed
    if @admin != current_user
      redirect '/shifts'
    end
  end

end
