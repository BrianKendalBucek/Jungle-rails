require 'rails_helper'

RSpec.describe User, type: :model do

  subject{
    described_class.create(
      first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.com',
        password: 'test',
        password_confirmation: 'test'
    )
  }

  describe 'Validations' do

    it "Should validate a user with the correct input" do
      expect(subject).to be_valid
    end

    it "Should not validate a user if the passwords don't match" do
      subject.password_confirmation = 'nope'
      expect(subject).to_not be_valid
    end

    it "Should not validate a user without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "Should not validate a user without a first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "Should not validate a user without a last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "Should not allow duplicate email addresses" do
      temp_user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.com',
        password: 'test',
        password_confirmation: 'test'
      )

      test_user = User.new(
        first_name: 'Jane',
        last_name: 'Doe',
        email: 'test@test.com',
        password: 'test',
        password_confirmation: 'test'
      )
      temp_user.save
      test_user.save

      expect(test_user).to_not be_valid
    end

    it "Should not validate a password that is less than the minimum length" do
      test_user = User.new(
        first_name: 'Jane',
        last_name: 'Doe',
        email: 'test@test.com',
        password: 't',
        password_confirmation: 't'
      )

      expect(test_user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do

    it "Should pass when given the correct information" do
      subject.save
      validate = User.authenticate_with_credentials(subject.email, subject.password)
      expect(validate).to_not be_nil
    end

    it "Should return nil if the email is not correct" do
      subject.save
      validate = User.authenticate_with_credentials('bbucek@gmail.com', subject.password)
      expect(validate).to be_nil
    end

    it "Should return nil if the password is not correct" do
      subject.save
      validate = User.authenticate_with_credentials(subject.email, 'toast')
      expect(validate).to be_nil
    end
  end
end
