# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(
      name: "Test",
      password: "secret",
      password_confirmation: "secret",
    )
    @user.save
    
    @new_password = {
      password: "new",
      password_confirmation: "new"
    } 
  end
  
  test "should allow update if current password is correct" do
     @user.current_password = "secret"
     assert(@user.update_attributes(@new_password))
  end
  
  test "should not allow update if current password is wrong" do
     @user.current_password = "this is wrong"
     assert_equal(@user.update_attributes(@new_password),false)
  end
end
