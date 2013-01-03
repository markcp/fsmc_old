class Person < ActiveRecord::Base
  attr_accessible :gender, :first_name, :last_name
  has_many :performances
  has_many :movies, through: :performances
  has_many :roles, through: :performances

  validates :last_name, presence: true
  validates :gender, presence: true

  def name
    self.first_name ? self.first_name + " " + self.last_name : self.last_name
  end
end
