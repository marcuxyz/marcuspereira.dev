class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one_attached :attachment
  has_rich_text :content
  has_rich_text :description

  enum status: { draft: 0, published: 1 }

  validates :title, :content, :description, :slug, presence: true

  belongs_to :category

  def audio?
    ['audio/mp4', 'audio/mp3', 'audio/m4a'].include? attachment.content_type
  end
end
