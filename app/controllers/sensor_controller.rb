class SensorController < ApplicationController
  skip_before_action :verify_authenticity_token
  require "base64"
  def index
    @sensors = Sensor.all
  end

  def show
    if params[:id].present?
      @sensor = Sensor.find(params[:id])
      if params[:start_date].present?
        @start_date = DateTime.civil(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i,params[:start_date][:hour].to_i, params[:start_date][:minute].to_i,0,"+"+@sensor.time_zona.to_s )
        @end_date = DateTime.civil(params[:end_date][:year].to_i, params[:end_date][:month].to_i, params[:end_date][:day].to_i,params[:end_date][:hour].to_i, params[:end_date][:minute].to_i,0,"+"+@sensor.time_zona.to_s )
      end
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

        if @start_date
          @sensor_values = @sensor.sensor_values.order("created_at DESC").where("created_at >= :start_date AND created_at <= :end_date", {:start_date => @start_date, :end_date => @end_date})
        else
          @sensor_values = @sensor.sensor_values.order("created_at DESC").limit(100)
          @start_date = DateTime.current.beginning_of_day
          @end_date = DateTime.current.end_of_day
        end
      end
    else
      render plain: "status:error data"
    end
  rescue ActiveRecord::RecordNotFound
    render plain: "status:invalid  id sensor"
  end

  def new
    if params[:sensor].present?
      @sensor = Sensor.find_by_sensor(Base64.decode64(params[:sensor]))
      if @sensor
        @value = @sensor.sensor_values.build(sensor_id: @sensor, value1: params[:param1].to_f,value2: params[:param2].to_f)
        @value.save
      end
      render plain: "status:good\n"+"date:"+Date.today.monday.to_s+
          "\ntime:"+Time.new.strftime("%H:%M:%S").to_s+
          "\ngmt:"+@sensor.time_zona.to_s
    else
      render plain: "status:error data"
    end
  rescue ActiveRecord::RecordNotFound
    render plain: "status:erorr id sendor"
  end

  def api
    if params[:sensor].present?
#      @sensor = Sensor.find_by_sensor(Base64.decode64(params[:sensor]))
      @sensor = Sensor.find(params[:sensor])
      @limit = 100
      if params[:limit].present?
        @limit = params[:limit].to_i
      end

      if @sensor
        render plain: @sensor.sensor_values.order("created_at DESC").limit(@limit).as_json
      end
    else
      render plain: "Error api format"
    end
  rescue ActiveRecord::RecordNotFound
    render plain: "invalid adress sensor"
  end




end

