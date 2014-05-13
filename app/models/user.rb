class User < ActiveRecord::Base
  has_many :plans_owned, class_name: "Plan", foreign_key: 'owner_id'
  has_many :comments

  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication 

  # validates_confirmation_of :password
  # validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
end
 
 end
 