class Movie < ActiveRecord::Base
  attr_accessible :director_display, :screenwriter_display, :title, :year_id
  belongs_to :year
  has_many :performances
  has_many :people, through: :performances
  has_many :roles, through: :performances

  validates :title, presence: true
  validates :year_id, presence: true

  default_scope order: "title_sort"

  before_save :title_sort

  def title_sort
    self.title_sort = self.title.match(/^(the|a|an)\s+/i) ? self.title.sub(/^(the|a|an)\s+/i, '') + ", " + $1 : self.title
  end


end
