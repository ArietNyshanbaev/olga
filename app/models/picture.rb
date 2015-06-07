class Picture < ActiveRecord::Base
  has_many :comentps, dependent: :destroy
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :photo, PictureUploader
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :photo, presence: true
  validate  :photo_size

  private

    # Validates the size of an uploaded picture.
    def photo_size
      if photo.size > 5.megabytes
        errors.add(:photo, "should be less than 5MB")
      end
    end
end
