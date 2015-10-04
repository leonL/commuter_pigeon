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
        push_start_end_to_yohans_service(route_steps.first, route_steps.last)
        head :ok
      end

    end
  end

  def commute_params
    params.require(:commute).permit(:name)
  end

  def commuter_params
    params.require(:commuter).permit(:name, :email_address, :SMS_number, :sms_provider)
  end

  def route_steps
    JSON.parse(params[:route_steps])
  end

  def push_start_end_to_yohans_service(first_step, last_step)
    response = HTTParty.get(
      "http://yyee.ca/trafficjam/?origin=#{first_step['start']['H']},#{first_step['start']['L']}&destination=#{last_step['end']['H']},#{last_step['end']['L']}"
    )
    puts "Response Code From Yoha's app #{response.code}"
  end

end