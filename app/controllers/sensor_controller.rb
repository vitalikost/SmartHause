class SensorController < ApplicationController
  skip_before_action :verify_authenticity_token
  require "base64"
  def index
  end

  def new
    #puts "Temperatuta:"+params[:t]+" Humidity:"+params[:h]


    if params[:sensor].present?

      @sensor = Sensor.find_by_sensor(Base64.decode64(params[:sensor]))
      if @sensor
        puts "Name sensor:"+@sensor.name
        puts "Temperatuta:"+params[:t]+" Humidity:"+params[:h]
      end
      render plain: "OK"
    else
      render plain: "Error data"
    end
  end
end
