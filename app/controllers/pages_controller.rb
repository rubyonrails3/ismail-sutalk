class PagesController < ApplicationController

  def home
    @params = params
                # rest_graph originates from the rest_graph gem.
                # rest_graph was initialized in the application_controller.rb
    @room = Room.assign params, request.remote_ip, rest_graph
    p @room
  end
  
  def get_users
    # Current Time 
    ct = Time.now
    # New Time
    nt = Time.new(ct.year, ct.month, ct.day, ct.hour, ct.min, ct.sec, "-07:00")
    # Compare for the last ten minute visists 
    @rooms = Room.where("created_at > ?", nt - 2.hours)
    render "pages/home/get_users"
  end
  
end
