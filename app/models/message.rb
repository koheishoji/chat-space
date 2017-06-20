class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  mount_uploader :image, ImageUploader

  validates :body, presence: true, if: "image.blank?"
  validates :group_id, presence: true
  validates :user_id, presence: true
end
