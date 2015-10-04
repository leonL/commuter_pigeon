class RouteStep < ActiveRecord::Base

  belongs_to :commute

  def self.near_point_within_distance(point, dist_meters=1000)
    where("ST_DWithin(coord, ST_Point(#{point.x}, #{point.y})::geography, #{dist_meters})")
  end

  def commuter
    commute.commuter
  end

end