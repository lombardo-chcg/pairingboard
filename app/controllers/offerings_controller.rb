class OfferingsController < ApplicationController
  def index
    @offerings
  end

  def create
    p "PARAM"
    p params
    p "OFFERING TAG"
    offering_tags = params["offering_tag"]
    offering_tags.each do |time,checked|
      current_user.offerings.create(start_time: time)
    end
    # current_user.offerings.create(offering_params)
    redirect_to offerings_path
  end

  private
    def offering_params
      params.permit(:start_time, :end_time, :offering_tag)
    end
end
