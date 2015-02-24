class User < ActiveRecord::Base
	has_many :comments
	has_many :events, :through => :comments
	has_many :friendships
	has_many :friends, :through => :friendships
	has_many :boards
	has_many :events
	attr_accessor :password, :password_confirmation
	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, :presence => true
	validates :email, :uniqueness => true, :format => { :with => email_regex }
	validates :password, :password_confirmation, :presence => true

	before_save :encrypt_password

	def has_password?(submitted_password)
		self.encrypted_password == encrypt(submitted_password)
	end

	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end

	private
		def encrypt_password
			self.salt = Digest::SHA2.hexdigest("#{Time.now.utc}--#{self.password}") if self.new_record?
			self.encrypted_password = encrypt(self.password)
		end

		def encrypt(pass)
			Digest::SHA2.hexdigest("#{self.salt}--#{pass}")
		end
end
