class Venue < ActiveRecord::Base
  has_many :shows
  has_many :attendances, :through => :shows
end
