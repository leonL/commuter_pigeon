class CreateRouteSteps < ActiveRecord::Migration
  def change
    create_table :route_steps do |t|
      t.integer :route_id
      t.line_string :coord, srid: 4326
      t.integer :sequence_index
    end
  end
end
