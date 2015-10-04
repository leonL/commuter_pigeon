class AddSmsProviderToCommuter < ActiveRecord::Migration
  def change
    add_column :commuters, :sms_provider, :string
  end
end
