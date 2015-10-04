class RoadRestrictionsController < ApplicationController

  def new
    @restriction = RoadRestriction.new
  end

  def create
    rr = params[:road_restriction]
    @restriction = RoadRestriction.create(
      description: rr['description'],
      road_segment_name: rr['road_segment_name'],
      coord: "POINT(#{params['lat']} #{params['long']})"
    )
    mail_affected_commuters
    head :ok
  end

private

  def mail_affected_commuters
    affected_steps = RouteStep.near_point_within_distance(@restriction.coord)
    unless affected_steps.empty?
      affected_commutes = affected_steps.map(&:commute).uniq!
      affected_commutes.each do |commute|
        CommuterMailer.commute_news_email(commute, @restriction).deliver_now
        CommuterMailer.commute_news_text(commute, @restriction).deliver_now
      end
    end
  end

end

