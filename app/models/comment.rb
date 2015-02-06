class Comment < ActiveRecord::Base
  belongs_to :post

  validates :message, presence: true
end
