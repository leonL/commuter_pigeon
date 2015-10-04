module ApplicationHelper

  def options_for_sms_provider_select
    options_for_select(
      [
        ['Rogers', '@pcs.rogers.com'],
        ['Fido', '@fido.ca'],
        ['Telus', '@msg.telus.com'],
        ['Bell', '@txt.bell.ca'],
        ['Kudo', '@msg.koodomobile.com'],
        ['Virgin', '@vmobile.ca'],
        ['Solo', '@txt.bell.ca'],
      ]
    )
  end
end
