class CommutesController < ApplicationController

  def new

  end

  def create
    respond_to do |format|

      format.json do
        lines = params[:_json]
        lines.each do |line|
          start = line['start']
          terminus = line['end']
          RouteStep.create(geom: "LINESTRING(#{start['H']} #{start['L']}, #{terminus['H']} #{terminus['L']})")
        end
      end

    end
  end

end

