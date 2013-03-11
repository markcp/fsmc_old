class Password < ActiveRecord::Base
  attr_accessible :password, :password_confirmation
  has_secure_password

  before_create { generate_token }

  validates :password, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, on: :create

  def generate_token
    self.generate_token = SecureRandom.urlsafe_base64
  end
end
