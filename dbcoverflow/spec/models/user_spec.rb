require 'spec_helper'

describe User do

  describe "create User" do

    it " is valid by creating a new instance of User" do
      user = FactoryGirl.build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a username" do
      expect(User.new(username: '', password: 'password', password_confirmation: 'password', email: 'email2@yahoo.com')).to have(2).errors_on(:username)
    end

    it "is invalid without a unique username" do
      User.create(username: 'alexander', password: 'password', password_confirmation: 'password', email: 'email1@yahoo.com')
      expect(User.new(username: 'alexander', password: 'password', password_confirmation: 'password', email: 'email2@yahoo.com')).to have(1).errors_on(:username)
    end

    it "is invalid without a username greater than 3 chars" do
      expect(User.new(username: 'al', password: 'password', password_confirmation: 'password', email: 'email@yahoo.com')).to have(1).errors_on(:username)
    end

    it "is invalid without an email" do
      expect(User.new(username: 'alexander', password: 'password', password_confirmation: 'password', email: '')).to have(2).errors_on(:email)
    end

    it "is invalid without a unique email" do
      User.create(username: 'alexander', password: 'password', password_confirmation: 'password', email: 'email@yahoo.com')
      expect(User.new(username: 'alexander', password: 'password', password_confirmation: 'password', email: 'email@yahoo.com')).to have(1).errors_on(:email)
    end

    it "is invalid without a correctly formatted email" do
      expect(User.new(username: 'alexander', password: 'password', password_confirmation: 'password', email: 'yahoo.com')).to have(1).errors_on(:email)
    end

    it "is invalid without a pasword" do
      expect(User.new(username: 'alexander', password: '', password_confirmation: 'password', email: 'email@yahoo.com')).to have(1).errors_on(:password)
    end

    it "is invalid without a correct password confirmation" do
     expect(User.new(username: 'alexander', password: 'password', password_confirmation: 'wrong', email: 'email@yahoo.com')).to have(1).errors_on(:password_confirmation)
    end
  end

  describe "User associations" do
    it { should have_many :questions }
    it { should have_many :answers }
    it { should have_many :comments }
    it { should have_many :votes }
  end

end
