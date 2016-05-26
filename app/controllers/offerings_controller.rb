class OfferingsController < ApplicationController
  def index
    @offerings
  end

  def create
    current_user.offerings.create(offering_params)
    redirect_to offerings_path
  end

  private
    def offering_params
      params.permit(:start_time, :end_time)
    end
end
