class Commuter < ActiveRecord::Base

  has_many :commutes
  accepts_nested_attributes_for :commutes

end