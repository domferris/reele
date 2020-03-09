class Project < ApplicationRecord
  belongs_to :user
  # has_many :project_categories
  # has_one :category, through: :project_categories
  has_many :comments, dependent: :destroy

  # CLOUDINARY RELATION -- REMOVED UNTIL STABLE
  # has_one_attached :photo

  has_one_attached :audio_file

  MEDIA_TYPE = ['audio', 'video']

  # validates :title, :media_type, presence: true

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  # acts_as_taggable_on :skills, :interests
end
