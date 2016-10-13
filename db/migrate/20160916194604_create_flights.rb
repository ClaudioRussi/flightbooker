class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.references :start_airport, foreign_key: true
      t.references :finish_airport, foreign_key: true
      t.datetime :start_datetime
      t.time :flight_duration

      t.timestamps
    end
  end
end
