class Post < ActiveRecord::Base
  acts_as_taggable
  include PgSearch
  pg_search_scope :search,
                  :against => [:title, :body],
                  :using => {
                    :tsearch => {:dictionary => "english"}
                  }

  has_many :comments

  validates :title, presence: true
  validates :body, presence: true
  validates :published_on, presence: true
end
