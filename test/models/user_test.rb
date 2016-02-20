require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
	def setup
		@user = User.new(name: "Example User", email: "user@example.com",
			password: "foobar", password_confirmation: "foobar")
	end

	test "should be valid" do  
		assert @user.valid?	
	end #end "should be valid" test.

	test "name should be present" do
		@user.name = "a" * 51
		assert_not @user.valid?
	end #end "name should be present" test.

	test "email should be present" do
		@user.email = "a" * 244 + "@example.com"
		assert_not @user.valid?
	end # end "email should be present" test.

	test "email validation should accept valid addresses" do
		valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
		valid_addresses.each do |valid_addresses|
			@user.email = valid_addresses
			assert @user.valid?, "#{valid_addresses.inspect} should be valid"
		end #end valid_addresses.each 
	end #end "email validation should accept valid addresses" test.

	test "email address must be unique" do
		duplicate_user = @user.dup
		duplicate_user.email = @user.email.upcase
		@user.save
		assert_not duplicate_user.valid?
	end #end  "email address must be unique" test.

	test "passwod should be present - not blank" do
		@user.password = @user.password_confirmation = " " * 6
		assert_not @user.valid?
	end #end "passwod shold be present - not blank" test.

	test "password should be 6 characters long" do
		@user.password = @user.password_confirmation = "a" * 5
		assert_not @user.valid?
	end #end "password should be at least 6 characters long" test. 

end #end class.
