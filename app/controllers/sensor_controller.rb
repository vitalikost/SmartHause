class SensorController < ApplicationController
  skip_before_action :verify_authenticity_token
  require "base64"
  def index
  end

  def new
    #puts "Temperatuta:"+params[:t]+" Humidity:"+params[:h]
    puts Base64.decode64(params[:sensor])
    render plain: "OK"
  end
end
