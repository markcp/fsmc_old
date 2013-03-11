class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  before_save :create_remember_token
  # before_create { generate_token(:remember_token) }

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, on: :create

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  # def generate_token(column)
    # begin
      # self[column] = SecureRandom.urlsafe_base64
    # end while User.exists?(column => self[column])
  # end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
