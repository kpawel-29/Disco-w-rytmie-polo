class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    ## Use first_or_create
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      #user.email = auth.info.email
      #user.oauth_token = auth.credentials.token
      #user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      ## Removed
      user.save!
    end
  end

end