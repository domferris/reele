class Project < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :media_type, presence: true
end
