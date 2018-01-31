class Sensor < ApplicationRecord
  enum model: [:dht,:dallas,:bmp180]
  has_many :sensor_values
end
