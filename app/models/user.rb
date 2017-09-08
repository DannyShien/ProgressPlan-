class User < ApplicationRecord
  validates :name, :email, presence: true

  has_secure_password

  has_many :posts, foreign_key: 'poster_id'
  has_many :goals, dependent: :destroy


  #mount_uploader :avatar, AvatarUploader

  def image_url_or_default
    image_url || image_url.presence || "http://lorempixel.com/128/128/people/"
  end

  def self.from_omniauth(auth)
    # Check out the Auth Hash function at https://github.com/mkdynamic/omniauth-facebook#auth-hash
    # and figure out how to get email for this user.
    # Note that Facebook sometimes does not return email,
    # in that case you can use facebook-id@facebook.com as a workaround
    email = auth[:info][:email] || "#{auth[:uid]}@facebook.com"
    user = where(email: email).first_or_initialize
    user.image_url = auth[:info][:image]
    user.name = auth[:info][:name]
    user.password = SecureRandom.hex
    #
    # Set other properties on user here. Just generate a random password. User does not have to use it.
    # You may want to call user.save! to figure out why user can't save
    #
    # Finally, return user
    user.save(validate: false) && user
  end
end
