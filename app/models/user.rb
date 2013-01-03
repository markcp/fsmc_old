# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  has_secure_password

  before_create { generate_token(:remember_token) }

  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, on: :create

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def name
    self.first_name ? self.first_name + " " + self.last_name : self.last_name
  end
end
