class OfferingsController < ApplicationController
  def index
    @offerings
    @users = User.all
  end

  def create

    offering_tags = params["offering_tag"]
    if offering_tags == nil
      if request.xhr?
        error = "Invalid offering!"
        render json: { message: error }, status: 422
      end
    else
    offering_tags.each do |time,checked|
      offering = current_user.offerings.new(start_time: time, offering_date: params["date"])
        unless offering.save
          if request.xhr?
            error = offering.errors.messages
            render json: { message: error }, status: 422
            return false
          end
        end
      end
    end
    if request.xhr?
      render '_offering_row', layout: false, locals: {user: current_user}
    else
  # current_user.offerings.create(offering_params)
      redirect_to offerings_path
    end

  end

  private
    def offering_params
      params.permit(:start_time, :end_time, :offering_tag, :date)
    end
end