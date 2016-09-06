class Post < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

  self.per_page = 10
end
