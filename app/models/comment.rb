class Comment < ApplicationRecord
  belongs_to :Post ,optional: true
end
