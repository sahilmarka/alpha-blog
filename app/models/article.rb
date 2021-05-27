class Article < ApplicationRecord
  validates :title,:description, presence: true, length: {minimum: 5, maximum: 100}
  belongs_to :user
end


