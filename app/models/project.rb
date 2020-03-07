require 'Nokogiri'
require 'open-uri'

class Project < ApplicationRecord
  belongs_to :user
  # has_many :project_categories
  # has_one :category, through: :project_categories
  has_many :comments, dependent: :destroy
  # CLOUDINARY RELATION -- REMOVED UNTIL STABLE
  # has_one_attached :photo
  has_one_attached :audio_file
  MEDIA_TYPE = ['audio', 'video']
  validates :title, :media_type, presence: true

  def bandcamp_scrape(url)
    html = open(url).read
    doc = Nokogiri::HTML(html)
    string = doc.css('meta[property="twitter:player"]').to_s
    embed = string.scan(/https.*list=true/)
    # split string into two portions for insertion into iframe
    embed_split = embed[0].split('size=large')
  end

  def bandcamp_embed

  end
end

# interpolating the return int othe recipe instance


# <input type="text" class="embed_text" data-bind="value: code" readonly="">
