class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         mount_uploader :image, AvatarUploader

         has_many :user_pages, dependent: :destroy

          validate :upload_is_image

         def upload_is_image
    unless upload and upload.content_type =~ /^image\/(jpeg|pjpeg|gif|png|bmp)$/
      errors.add(:upload, "Not a valid image")
    end
  end

  def admin?
    self.is_admin == "true"
  end
end
