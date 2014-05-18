class User < ActiveRecord::Base
  has_many :plans_owned, class_name: "Plan", foreign_key: 'owner_id'
  has_many :comments
  has_many :save_plans
  has_many :plans, :through => :save_plans 

  authenticates_with_sorcery! 

	  validates_confirmation_of :password
	  validates_presence_of :password, :on => :create
	  validates_presence_of :email
	  validates_uniqueness_of :email

 end
 