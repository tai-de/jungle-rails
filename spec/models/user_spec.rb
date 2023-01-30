require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    it "saves successfully when all fields are valid" do
      @user = User.new(first_name: "Tai", last_name: "Delisle", email: "tai@tai.tai", password: "password", password_confirmation: "password")
      expect(@user.save!).to be true
    end

    it "saves successfully when password and password_confirmation match" do
      @user = User.new(first_name: "Tai", last_name: "Delisle", email: "tai@tai.tai", password: "password", password_confirmation: "password")
      expect(@user.save!).to be true
    end

    it "fails when password and password_confirmation do not match" do
      @user = User.new(first_name: "Tai", last_name: "Delisle", email: "tai@tai.tai", password: "password", password_confirmation: "doesntmatch")
      @user.save

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "fails when password is not given" do
      @user = User.new(first_name: "Tai", last_name: "Delisle", email: "tai@tai.tai")
      @user.save

      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "must prevent duplicate email addresses" do
      @user1 = User.new(first_name: "Tai", last_name: "Delisle", email: "tai@tai.tai", password: "password", password_confirmation: "password")
      @user1.save

      @user2 = User.new(first_name: "AnotherTai", last_name: "ForReal", email: "tai@tai.TAI", password: "password", password_confirmation: "password")
      @user2.save
      
      expect(@user2.errors.full_messages).to include("Email has already been taken")

    end

    it "must require email, and first and last names" do
      
    end

  end
end
