class User < ActiveRecord::Base
	# callbacks
	before_save {self.email = email.downcase } 

	# contants
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	# validators 
	validates :name, presence: true, length:  {maximum: 50}
	validates :email, presence: true, length: {maximum: 255},
					  format: { with: VALID_EMAIL_REGEX },
					  uniqueness: {case_sensitive: false}
	# check password with bcrypt: https://www.railstutorial.org/book/modeling_users (section 6.34) 
	has_secure_password				  
end
