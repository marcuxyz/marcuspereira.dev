class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one_attached :attachment
  has_rich_text :content
  has_rich_text :description

  enum status: { draft: 0, published: 1 }

  validates :title, :content, :description, :slug, presence: true

  belongs_to :category
end
