class CommuterMailer < ApplicationMailer

  def commute_news_email(commute, restriction)
    @commute = commute
    @commuter = commute.commuter
    @restriction = restriction
    mail(to: @commuter.email_address,
      subject: "Traffic flow on #{@restriction.road_segment_name} is affected")
  end
end
