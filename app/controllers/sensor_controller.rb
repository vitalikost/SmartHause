class SensorController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end

  def new
    puts params
    render plain: "OK"
  end
end
