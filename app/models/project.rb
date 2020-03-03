class Project < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :photo

  validates :title, :media_type, presence: true
end
