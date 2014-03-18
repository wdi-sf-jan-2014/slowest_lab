class User < ActiveRecord::Base
  has_secure_password
  validate :email => :unique

  has_many :inward_follows, :class_name => 'Follow', :foreign_key => 'followed_id'
  has_many :outward_follows, :class_name => 'Follow', :foreign_key => 'follower_id'

  has_many :followers, :through => :inward_follows, :source => :follower
  has_many :followeds, :through => :outward_follows, :source => :followed

  has_many :attendances
end
