class FlightsController < ApplicationController
  def new

  end

  def index
    @airports_for_select = Airport.codes.map {|airport| [airport.code, airport.code]}
    @dates_for_select = Flight.dates.map {|date| [date.start_datetime.to_date, date.start_datetime.to_date]}

    if params[:to_airport]
      @flights = Flight.flight_by_params(params)
      @passengers = params[:passengers]
    end

  end

  private

end
