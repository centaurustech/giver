require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should not save if email already exists' do
  	User.create(
  		first_name: 'Jun',
  		last_name: 'Seba',
  		email: 'nujabes@yahoo.com'
  		)
  	user = User.new(
  		first_name: 'Peter',
  		last_name: 'Parker',
  		email: 'nujabes@yahoo.com'
  		)
  	expect(user).to be_invalid
  end
  it 'should not save if first_name field is blank' do

	  user = User.new(
	  	first_name: ''
	  	)
	  expect(user).to be_invalid
	end
	it 'should contain a valid email' do
		user = User.new(
			first_name: "Peter",
			last_name: "Parker",
			email: "spiderman"
			)
		expect(user).to be_invalid
	end
	it 'should not save if password field is blank' do
		user = User.new(
			first_name: "Peter",
			last_name: "Parker",
			email: "spiderman@yahoo.com",
			password: "",
			password_confirmation: "password"
			)
		expect(user).to be_invalid
	end
	it 'should not save if password confirmation field is blank' do
		user = User.new(
			first_name: "Peter",
			last_name: "Parker",
			email: "spiderman@yahoo.com",
			password: "password",
			password_confirmation: ""
			)
		expect(user).to be_invalid
	end
end

describe User, "when saved" do
	it "should create a salt" do
		user = User.create(
			first_name: "Peter",
			last_name: "Parker",
			email: "spiderman@yahoo.com",
			password: "password",
			password_confirmation: "password"
			)
		user.salt.should_not be_blank
	end
	it "should create an encrypted password" do
		user = User.create(
			first_name: "Peter",
			last_name: "Parker",
			email: "spiderman@yahoo.com",
			password: "password",
			password_confirmation: "password"
			)
		user.encrypted_password.should_not be_blank
	end
end 
