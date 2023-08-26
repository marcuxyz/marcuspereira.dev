class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: %i[slugged finders]

  has_one_attached :attachment
  has_rich_text :content

  enum status: { draft: 0, published: 1 }

  validates :title, :content, :slug, presence: true

  belongs_to :category

  def audio?
    ['audio/mp4', 'audio/mp3', 'audio/m4a'].include? attachment.content_type
  end

  def estimated_reading_time
    return if content.to_plain_text.blank?

    calculate_estimated_reading
  end

  private

  def should_generate_new_friendly_id?
    title_changed?
  end

  def calculate_estimated_reading
    words_per_minute = 225
    words_count = content.to_plain_text.strip.split(/\s+/).count

    estimed = (words_count / words_per_minute).ceil

    estimed <= 1 ? '1 minuto de leitura' : "#{estimed} minutos de leitura"
  end
end
