class Feed < ActiveRecord::Base
  scope :outdated, where(state: 'outdated')
  
  attr_accessible :title, :url
  
  validates :title, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
end
