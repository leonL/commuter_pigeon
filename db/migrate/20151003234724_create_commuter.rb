class CreateCommuter < ActiveRecord::Migration
  def change
    create_table :commuters do |t|
      t.string :name
      t.string :email_address
      t.integer :SMS_number
      t.string :twitter_handle
    end
  end
end
