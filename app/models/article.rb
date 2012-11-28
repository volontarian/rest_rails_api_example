class Article < ActiveRecord::Base
  has_and_belongs_to_many :categories
  
  attr_accessible :description, :published_at, :title, :category_names
  
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :published_at, presence: true
  
  def as_json(options = {})
    super.merge(category_names: categories.map(&:title))
  end
  
  def category_names=(names)
    names = names.split(',').map(&:strip) if names.is_a? String
    self.categories = names.uniq.map{|n| Category.find_or_create_by_title(n) }
  end
end
