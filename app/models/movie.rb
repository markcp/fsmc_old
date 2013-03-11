class Movie < ActiveRecord::Base
  attr_accessible :director, :title, :year
  has_many :viewings

  validates :title, presence: true
  validates :year, presence: true
  validates :director, presence: true

  default_scope order: "title_sort"

  before_save :title_sort

  def title_sort
    self.title_sort = self.title.match(/^(the|a|an)\s+/i) ? self.title.sub(/^(the|a|an)\s+/i, '') + ", " + $1 : self.title
  end
end
