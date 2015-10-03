class CreateRoadRestrictions < ActiveRecord::Migration
  def change
    create_table :road_restrictions do |t|
      t.st_point :coord, srid: 4326
      t.string :description
      t.string :road_segment_name
    end
  end
end
