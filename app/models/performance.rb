class Performance < ActiveRecord::Base
  attr_accessible :movie_id, :person_id, :role_id

  belongs_to :role
  belongs_to :movie
  belongs_to :person

  validates :person_id, presence: true
  validates :movie_id, presence: true
  validates :role_id, presence: true
end
