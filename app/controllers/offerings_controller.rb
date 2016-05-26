class OfferingsController < ApplicationController
  def index
    @offerings
    @users = User.all
  end

  def create
    p "params"
    p params
    offering_tags = params["offering_tag"]
    offering_tags.each do |time,checked|
      current_user.offerings.create(start_time: time, offering_date: params["date"])
    end

    # current_user.offerings.create(offering_params)
    redirect_to offerings_path
  end

  private
    def offering_params
      params.permit(:start_time, :end_time, :offering_tag, :date)
    end
end
