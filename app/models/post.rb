class Post < ApplicationRecord
  has_and_belongs_to_many :categories
  #
  # t.string :title
  # t.text :content
  # t.string :author
  # t.datetime :published_at


end
