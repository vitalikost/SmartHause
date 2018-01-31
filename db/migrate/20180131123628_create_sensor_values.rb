class CreateSensorValues < ActiveRecord::Migration[5.1]
  def change
    create_table :sensor_values do |t|
      t.integer :sensor_id
      t.decimal :value1
      t.decimal :value2
      t.timestamps
    end
  end
end
