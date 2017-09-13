class User < ApplicationRecord
  validates :name, :email, presence: true

  has_secure_password

  has_many :posts, foreign_key: 'poster_id'
  has_many :goals, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships


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

  def completed_goals
    goals.where("completed is not null").order("created_at DESC")
  end

  def incomplete_goals
    goals.where("completed is null").order("created_at DESC")
  end

  def toggle_like!(item)
    if like = likes.where(item: item).first
      like.destroy  
    else
      likes.where(item: item).create!
    end
  end

  def liking?(item)
    likes.where(item: item).exists?
  end

  def add_friend(another_user)
    friends << another_user
  end
  
  def is_friend?(another_user)
    friends.include?(another_user)
  end
  
  def friend_names
    friends.map{|e| e.name}
  end

  def self.except(user)
    where.not(id: user.id)
  end

  def friends 
    friendships
  end
  
  def self.recipient_options(user)
    except(user).map{|e| [e.name, e.id]}
  end

  def self.generate_users(n = 5, gender = "female")
    url = "https://randomuser.me/api?results=#{n}&gender=#{gender}"
    body = HTTP.get(url).parse
    body["results"].each do |person|
      hash = {}
      hash[:name] = person["name"]["first"] + " " + person["name"]["last"]
      hash[:email] = person["email"]
      hash[:password] = person["login"]["password"]
      hash[:password] = person["login"]["password"]
      hash[:image_url] = person["picture"]["large"]
      User.create! hash
    end
  end 

  def self.random_user
    random_index = rand(User.count)
    User.offset(random_index).first
  end
end

