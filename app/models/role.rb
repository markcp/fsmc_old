class Role < ActiveRecord::Base
  attr_accessible :name
  has_many :performances
  has_many :people, through: :performances
  has_many :movies, through: :performances

  validates :name, presence: true

end
