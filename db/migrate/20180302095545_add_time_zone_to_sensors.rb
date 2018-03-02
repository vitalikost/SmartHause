class AddTimeZoneToSensors < ActiveRecord::Migration[5.1]
  def change
    add_column :sensors, :time_zona, :integer
  end
end
