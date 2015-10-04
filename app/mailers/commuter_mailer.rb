class CommuterMailer < ApplicationMailer

  def commute_news_email(commute, restriction)
    @commute = commute
    @commuter = commute.commuter
    @restriction = restriction
    unless @commuter.email_address.blank?
      mail(to: @commuter.email_address,
        subject: "Traffic flow on #{@restriction.road_segment_name} is affected")
    end
  end

  def commute_news_text(commute, restriction)
    @commute = commute
    @commuter = commute.commuter
    @restriction = restriction
    unless @commuter.SMS_number.blank?
      mail(to: @commuter.SMS_number + @commuter.sms_provider, subject: "Traffic flow on #{@restriction.road_segment_name} is affected") do |format|
        format.text { render text: "#{@commuter.name } there's a new road restriction affecting your '#{@commute.name}' commute: #{@restriction.description }" }
      end
    end
  end
end
