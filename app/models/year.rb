class Year < ActiveRecord::Base
  attr_accessible :end_voting_at, :name, :start_voting_at, :start_results_display_at
  has_many :movies
end
