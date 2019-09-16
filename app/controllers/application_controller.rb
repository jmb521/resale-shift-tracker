require './config/environment'
require 'rubyXL/convenience_methods/cell'
require 'rubyXL/convenience_methods/color'
require 'rubyXL/convenience_methods/font'
require 'rubyXL/convenience_methods/workbook'
require 'rubyXL/convenience_methods/worksheet'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "resale is fun"
  end

  get "/" do
    erb :welcome
  end

  def current_user
    @user = User.find_by(:id => session[:user_id]) if session[:user_id]
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
