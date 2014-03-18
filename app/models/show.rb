class Show < ActiveRecord::Base
  belongs_to :venue
  has_many :attendances
end
