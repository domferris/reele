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
  ############## AUDIO SCRAPE / EMBED METHODS ##############
  ####################################################

  def bandcamp_embed(part1, part2)
    iframe = "<iframe style=\"border: 0; width: 100%; height: 120px;\"
              src=\"#{part1}size=medium#{part2}\" seamless></iframe>"
    iframe.html_safe
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

  def soundcloud_embed(embed)
    iframe = "<iframe style=\"border: 0; width: 50%; height: 120px;\"
              src=\"#{embed}\" frameborder=\"0\"></iframe>"
    iframe.html_safe
  end

  def soundcloud_scrape(url)
    html = open(url).read
    doc = Nokogiri::HTML(html)
    string = doc.css('meta[property="twitter:player"]').to_s
    embed = string.scan(/https.*;/)
    soundcloud_embed(embed.reduce)
  end

  def spotify_embed(url)
    split_url = url.split('track')
    iframe = "<iframe src=\"#{split_url[0]}embed/track#{split_url[1]}\" width=\"100%\" height=\"80\" frameborder=\"0\"
              allowtransparency=\"true\" allow=\"encrypted-media\"></iframe>"
    iframe.html_safe
  end

  def apple_embed(url)
    split_url = url.split('music')
    iframe = "<iframe allow=\"autoplay *; encrypted-media *;\" frameborder=\"0\" height=\"450\"
              style=\"width:100%;max-width:660px;overflow:hidden;background:transparent;\"
              sandbox=\"allow-forms allow-popups allow-same-origin allow-scripts
              allow-storage-access-by-user-activation allow-top-navigation-by-user-activation\"
              src=\"#{split_url[0]}embed.music#{split_url[1]}?app=music\">
              </iframe>"
    iframe.html_safe
  end
end

# interpolating the return int othe recipe instance


# <input type="text" class="embed_text" data-bind="value: code" readonly="">
