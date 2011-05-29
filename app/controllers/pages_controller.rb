class PagesController < ApplicationController

  def home
    @params = params
                # rest_graph originates from the rest_graph gem.
                # rest_graph was initialized in the application_controller.rb
    @room = Room.assign params, request.remote_ip, rest_graph
    p @room
  end
  
  def get_users
    render "pages/home/get_users"
  end
  
end
