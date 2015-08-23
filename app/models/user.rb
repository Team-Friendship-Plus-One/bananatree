class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable, :omniauth_providers => [:twitter]
  has_many :donations
  has_many :campaigns

  def self.from_omniauth(auth, user)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.nickname   # assuming the user model has a name
      user.name = auth.info.name
      user.image = auth.info.image[0...-12]+".jpeg" # assuming the user model has an image
      user.oauth_token = auth.credentials.token
      user.uid = auth.uid
      user.provider = auth.provider
      user.signed_through_twitter = true
      # user.params = serialize :auth
      user.save!
    end
  end

end
