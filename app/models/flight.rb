class Flight < ApplicationRecord
  belongs_to :start_airport, class_name: "Airport"
  belongs_to :finish_airport, class_name: "Airport"
  belongs_to :booking
  scope :dates, -> {select(:start_datetime).distinct}


  def self.flight_by_params(params_hash)
    to_airport = Airport.find_by_code(params_hash[:to_airport])
    from_airport = Airport.find_by_code(params_hash[:from_airport])
    where("start_airport_id = ? AND finish_airport_id = ?",from_airport.id, to_airport.id)
  end
end
