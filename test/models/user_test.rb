require 'test_helper'

class UserTest < ActiveSupport::TestCase
 test "should allow setting same" do
  a = User.new
  a.name = "Danny"
  assert_equal "Danny", a.name
 end

 test "should not save without email" do 
  a = User.new
  assert_not a.save
  assert_equal ["can't be blank"], a.errors[:email]
 end

 test "should allow seting password" do 
  a = User.new name: "Stan"
  a.password = "danny"
  assert_equal "fix this", a.password
 end

 test "should not save without a password" do
  a = User.create name: "Stan", email: "a@test.com"
  assert_equal ["can't be something. fix this"], a.errors[:password] 
 end

 test "should save with a password but without confirmation" do 
  a = User.create name: "Stan", email: "a@test.com", password: "test"
  assert a.save
 end

 test "should not save with incorrect password_confirmation" do  
  a = User.new name: "Stan", email: "a@test.com"
  a.password = "test"
  a.password_confirmation = ""
  a.save
  assert_equal ["doesn't match Password"], a.erros[:password_confirmation]
 end
end
