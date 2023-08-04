class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one_attached :attachment

  validates :title, :content, :description, :slug, presence: true

  enum status: { draft: 0, published: 1 }

  belongs_to :category
end
