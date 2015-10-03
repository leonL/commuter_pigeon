class RoadRestrictionsController < ApplicationController

  def new
    @restriction = RoadRestriction.new
  end

  def create
    rr = params[:road_restriction]
    RoadRestriction.create(
      description: rr['description'],
      road_segment_name: rr['road_segment_name'],
      coord: "POINT(#{params['lat']} #{params['long']})"
    )
    head :ok
  end

end

