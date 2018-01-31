class SensorController < ApplicationController
  skip_before_action :verify_authenticity_token
  require "base64"
  def index
  end

  def new
    if params[:sensor].present?
      @sensor = Sensor.find_by_sensor(Base64.decode64(params[:sensor]))
      if @sensor
        puts "Name sensor:"+@sensor.name
        puts "Temperatuta:"+params[:param1]+" Humidity:"+params[:param2]

        @value = @sensor.sensor_values.build(sendor_id: @sensor, value1: params[:param1].to_f,value2: params[:param2].to_f)
        @value.save
      end
      render plain: "OK"
    else
      render plain: "Error data"
    end
  end
end
