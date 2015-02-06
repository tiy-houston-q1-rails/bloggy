class Post < ActiveRecord::Base
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true
  validates :published_on, presence: true
end
