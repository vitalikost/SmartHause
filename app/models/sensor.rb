class Sensor < ApplicationRecord
  enum model: [:dht,:dallas,:bmp180]
end
