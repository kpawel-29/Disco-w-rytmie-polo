class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.extra.raw_info.login
      user.oauth_token = auth.credentials.token
=begin
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
=end
      user.save!
    end
  end

end