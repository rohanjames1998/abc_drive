class ShortenedUrl < ApplicationRecord
  belongs_to :upload

  validates :unique_identifier, presence: true, uniqueness: true
  validates :full_url, presence: true


  def short_url
    # Ideally, we should use the domain from the environment
    # But for ease of setting up the application locally, we are using localhost
    "http://localhost:3000/d/#{unique_identifier}"
  end
end
