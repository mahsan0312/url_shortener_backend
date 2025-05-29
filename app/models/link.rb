class Link < ApplicationRecord
  before_validation :generate_slug, on: :create
  validates :original, presence: true, format: URI::regexp(%w[http https])
  validates :slug, presence: true, uniqueness: true

  def generate_slug
    self.slug ||= SecureRandom.uuid[0..5]
    self.shortened = "http://localhost:3000/#{self.slug}"
  end
end
