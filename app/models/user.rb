class User < ActiveRecord::Base

  validates_presence_of :email, :name
  before_validation :setup_token, on: :create

  has_many :orders

  def admin?
    self.level == 'admin'
  end

  def self.from_omniauth(auth_hash)
    user = where( fb_uid: auth_hash[:uid] ).first_or_initialize
    user.name = auth_hash[:info][:name]
    user.email = auth_hash[:info][:email]

    if auth_hash[:credentials]
      user.fb_token = auth_hash[:credentials][:token]
      user.fb_expires_at = Time.at(auth_hash[:credentials][:expires_at])
    end

    user.save!
    user
  end

  def self.verify_facebook_token(access_token)
    conn = Faraday.new(url: 'https://graph.facebook.com/me')
    response = conn.get "/me", { access_token: access_token }
    data = JSON.parse(response.body)

    if response.status == 200
      data
    else
      Rails.logger.warn(data)
      nil
    end
  end

  def setup_token(options={})
    self.token = Digest::SHA1.hexdigest("--#{SecureRandom.hex}--#{Time.now.to_s}--#{self.id.to_s}")[0,32]
  end

end
