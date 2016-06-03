require 'test_helper'

class InstagrammerTest < ActiveSupport::TestCase
 
	def setup
		@instagrammer = Instagrammer.new(instagram: "Instagrammer", email: "instagrammer@example.com")
	end


	test "should be valid" do
		assert @instagrammer.valid?
	end


	test "sould be present" do
		@instagrammer.instagram = "    "
		assert_not @instagrammer.valid?
	end


	test "sould be present" do
		@instagrammer.email = "    "
		assert_not @instagrammer.valid?
	end


	test "instagram should not be too long" do
    @instagrammer.instagram = "a" * 30
    assert_not @instagrammer.valid?
  	end


  	test "email should not be too long" do
    @instagrammer.email = "a" * 244 + "@example.com"
    assert_not @instagrammer.valid?
  	end


  	test "email validation should accept valid addresses" do
    	valid_addresses = %w[instagrammer@example.com INSTAGRAMMER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    	valid_addresses.each do |valid_address|
      		@instagrammer.email = valid_address
      		assert @instagrammer.valid?, "#{valid_address.inspect} should be valid"
    	end
  	end


  	test "email validation should reject invalid addresses" do
    	invalid_addresses = %w[instagrammer@example,com user_at_foo.org instagrammer.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    	invalid_addresses.each do |invalid_address|
      	@instagramer.email = invalid_address
      	assert_not @instagrammer.valid?, "#{invalid_address.inspect} should be invalid"
    	end
  	end


  	test "email addresses should be unique" do
    duplicate_instagrammer = @instagrammer.dup
    duplicate_instagrammer.email = @instagrammer.email.upcase
    @instagrammer.save
    assert_not duplicate_instagrammer.valid?
  	end
end
