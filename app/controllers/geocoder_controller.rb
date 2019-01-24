class GeocoderController < ApplicationController
  def localposittion
    @address = Geocoder.address([params[:latitude], params[:longitude]])
  end
end
