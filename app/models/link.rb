class Link < ActiveRecord::Base
  has_many :comments
  validates :headline, :presence => true
end
