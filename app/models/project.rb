class Project < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :photo
  has_one_attached :audio_file

  MEDIA_TYPE = ['audio', 'video']

  validates :title, :media_type, presence: true
end
