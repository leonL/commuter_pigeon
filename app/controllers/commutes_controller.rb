class CommutesController < ApplicationController

  def new
    @commute = Commute.new
  end

  def create
    respond_to do |format|

      format.json do
        commuter = Commuter.create(commuter_params)
        commute = commuter.commutes.create(commute_params)
        route_steps.each do |line|
          start = line['start']
          terminus = line['end']
          commute.route_steps.create(coord: "LINESTRING(#{start['H']} #{start['L']}, #{terminus['H']} #{terminus['L']})")
        end
        head :ok
      end

    end
  end

  def commute_params
    params.require(:commute).permit(:name)
  end

  def commuter_params
    params.require(:commuter).permit(:name, :email_address)
  end

  def route_steps
    JSON.parse(params[:route_steps])
  end

end