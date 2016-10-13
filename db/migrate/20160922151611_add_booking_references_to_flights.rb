class AddBookingReferencesToFlights < ActiveRecord::Migration[5.0]
  def change
    add_reference :flights, :booking, foreign_key: true
  end
end
