class SensorController < ApplicationController
  skip_before_action :verify_authenticity_token
  require "base64"
  def index
    @sensors = Sensor.all
  end

  def show
   # @test = Date.civil(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
   # puts(@test)
    @sensor = Sensor.find(params[:id])

    if @sensor

      @param_value = ["",""]
      if @sensor.model == "dht"
        @param_value[0]="Температура, С"
        @param_value[1]="Влажность, %"
      end

      if @sensor.model == "bmp180"
        @param_value[0]="Температура, С"
        @param_value[1]="Давление, мм/р.т."
      end

      if @sensor.model == "dallas"
        @param_value[0]="Температура, С"
        @param_value[1]="Температура, F"
      end

      @sensor_values = @sensor.sensor_values.order("created_at DESC").limit(100)

    end
  end

  def new
    if params[:sensor].present?
      @sensor = Sensor.find_by_sensor(Base64.decode64(params[:sensor]))
      if @sensor
       #puts "Name sensor:"+@sensor.name
       #puts "Value1:"+params[:param1]+" Value2:"+params[:param2]

        @value = @sensor.sensor_values.build(sensor_id: @sensor, value1: params[:param1].to_f,value2: params[:param2].to_f)
        @value.save
      end
      render plain: "OK"
    else
      render plain: "Error data"
    end
  end
end
