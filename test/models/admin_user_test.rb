require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # def setup
  #   @admin_user = AdminUser.new(email: "admin@example.com", password: "password",  password_confirmation: "password")
  # end

  test "create user" do
    admin =  AdminUser.new(email: "admin@example.com", encrypted_password: "password")
    assert_not admin.save
  end

  # test "should be valid" do
  #   @assert @admin_user.valid?
end
