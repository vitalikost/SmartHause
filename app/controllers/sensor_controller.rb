class SensorController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end

  def new
    puts "Temperatura:"+params[:param1]+" Humidity:"+params[:param2]
    render plain: "OK"
  end
end
