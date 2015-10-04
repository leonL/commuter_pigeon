class Commute < ActiveRecord::Base

  belongs_to :commuter

  has_many :route_steps
end