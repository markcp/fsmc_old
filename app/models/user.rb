# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :password
  has_secure_password

  before_save :create_remember_token

  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
