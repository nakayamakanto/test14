class User < ActiveRecord::Base
  #uploader mounting
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable

  has_many :pictures, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :follower_relations, foreign_key: "follower_id", class_name: "Relation", dependent: :destroy
  has_many :followed_relations, foreign_key: "followed_id", class_name: "Relation", dependent: :destroy
  has_many :followers, through: :followed_relations, source: :follower
  has_many :followed_users, through: :follower_relations, source: :followed
  
  def following?(followed_id)
    Relation.find_by(followed_id: followed_id)
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first

    unless user
      user = User.new(
          name:     auth.extra.raw_info.name,
          provider: auth.provider,
          uid:      auth.uid,
          email:    auth.info.email ||= "#{auth.uid}-#{auth.provider}@example.com",
          image:   auth.info.image,
          password: Devise.friendly_token[0, 20]
      )
      user.skip_confirmation!
      user.save(validate: false)
    end
    user
  end
  
  def self.find_for_twitter_oauth(auth, signed_in_resource = nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first

    unless user
      user = User.new(
          name:     auth.info.nickname,
          image: auth.info.image,
          provider: auth.provider,
          uid:      auth.uid,
          email:    auth.info.email ||= "#{auth.uid}-#{auth.provider}@example.com",
          password: Devise.friendly_token[0, 20],
      )
      user.skip_confirmation!
      user.save
    end
    user
  end
  
  def self.create_unique_string
    SecureRandom.uuid
  end
end
