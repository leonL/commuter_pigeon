class CreateCommutes < ActiveRecord::Migration
  def change
    create_table :commutes do |t|
      t.integer :commuter_id
      t.string :name
    end
  end
end
