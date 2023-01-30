require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    before(:each) do
      @user = User.new(first_name: "Tai", last_name: "Delisle", email: "tai@tai.tai", password: "password", password_confirmation: "password")
    end

    it "saves successfully when all fields are valid" do
      @user.save
      expect(@user).to be_valid
    end

    it "saves successfully when password and password_confirmation match" do
      @user.save
      expect(@user).to be_valid
    end

    it "fails when password and password_confirmation do not match" do
      @user.password_confirmation = "notmatching"
      @user.save

      expect(@user).not_to be_valid
    end

    it "fails when password is not given" do
      @user.password = nil
      @user.password_confirmation = nil
      @user.save

      expect(@user).not_to be_valid
    end

    it "must prevent duplicate email addresses" do
      @user.save

      @user2 = User.new(first_name: "AnotherTai", last_name: "ForReal", email: "tai@tai.TAI", password: "password", password_confirmation: "password")
      @user2.save

      expect(@user2).not_to be_valid

    end

    it "must require email, and first and last names" do
      @user = User.new
      expect(@user.save).to be false
    end

    it "must fail if password does not meet minimum length" do
      @user.password = "p"
      @user.password_confirmation = "p"
      @user.save

      expect(@user).not_to be_valid
    end

  end

  describe ".authenticate_with_credentials" do

    before(:each) do
      @user = User.new(first_name: "Tai", last_name: "Delisle", email: "tai@tai.tai", password: "password", password_confirmation: "password")
      @user.save
    end

    it "should log in with valid credentials" do
      expect(User.authenticate_with_credentials("tai@tai.tai", "password")).to be_truthy
    end

    it "should not log in with invalid credentials" do
      expect(User.authenticate_with_credentials("tai@tai.tai", "wrongpassword")).to be_falsy
    end

    it "should log in when emails are case insensitive" do
      expect(User.authenticate_with_credentials("tai@TAI.tai", "password")).to be_truthy
    end

    it "should log in when email has extra spaces" do
      expect(User.authenticate_with_credentials(" tai@TAI.tai  ", "password")).to be_truthy
    end

  end
end
