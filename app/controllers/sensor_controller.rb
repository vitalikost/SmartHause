class SensorController < ApplicationController
  def index
  end

  def new
    puts params
    render plain: "OK"
  end
end
