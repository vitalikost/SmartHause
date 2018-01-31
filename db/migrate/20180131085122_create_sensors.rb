class CreateSensors < ActiveRecord::Migration[5.1]
  def change
    create_table :sensors do |t|
      t.string :name
      t.integer :model
      t.string :sensor
      t.timestamps
    end
  end
end
