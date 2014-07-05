class User < ActiveRecord::Base
   authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
  
  
  has_many :plans_owned, class_name: "Plan", foreign_key: 'owner_id'
  has_many :comments
  has_many :save_plans
  has_many :plans, :through => :save_plans 
  has_many :authentications, :dependent => :destroy
  # has_secure_password

	  validates_confirmation_of :password
	  validates_presence_of :password, :on => :create
    validates_presence_of :password_confirmation, :on => :create
	  validates_presence_of :email
    validates_presence_of :first_name
    validates_presence_of :last_name
	  validates_uniqueness_of :email

 end
 