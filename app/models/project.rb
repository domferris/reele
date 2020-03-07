require 'nokogiri'
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


  ####################################################
  ############## BANDCAMP EMBED METHODS ##############
  ####################################################

  def bandcamp_embed(part1, part2)
   @send = "<iframe style=\"border: 0; width: 100%; height: 120px;\" src=\"#{part1}size=medium#{part2}\" seamless></iframe>"
   @send.html_safe
  end

  def bandcamp_scrape(url)
    html = open(url).read
    doc = Nokogiri::HTML(html)
    string = doc.css('meta[property="twitter:player"]').to_s
    embed = string.scan(/https.*list=true/)
    # split string into two portions for insertion into iframe
    embed_split = embed[0].split('size=large')
    bandcamp_embed(embed_split[0], embed_split[1])
  end
end

# interpolating the return int othe recipe instance


# <input type="text" class="embed_text" data-bind="value: code" readonly="">
