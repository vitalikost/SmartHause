class SensorController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end

  def new
    puts "Temperatuta:"+params[:t]+" Humidity:"+params[:h]
    render plain: "OK"
  end
end
