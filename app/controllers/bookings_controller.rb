class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])

  end

  def new
    @booking = Booking.new
    @booking.flight = Flight.find(params[:flight])

    params[:passengers_number].to_i.times do 
      @booking.passengers.build
    end
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      @booking.passengers.each do |passenger|
        PassengerMailer.thank_you_email(passenger).deliver_later
      end
      redirect_to booking_path(@booking)
    else
      render 'new'
    end
  end
  private

  def booking_params
    parametros = params.require(:booking).permit([:flight,passengers_attributes:[:name, :email]])
    parametros[:flight] = Flight.find(parametros[:flight])
    return parametros
  end

end
