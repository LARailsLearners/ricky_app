require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "Example User", password: "letmein", password_confirmation: "letmein")
  end

  test "valid password should validate" do
    @user.password = @user.password_confirmation = "foobarbaz"
    assert @user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
end
