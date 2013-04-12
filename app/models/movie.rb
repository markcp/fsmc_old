# == Schema Information
#
# Table name: movies
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  year          :string(255)
#  skandies_year :string(255)
#  director      :string(255)
#  title_sort    :string(255)
#  short         :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

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
