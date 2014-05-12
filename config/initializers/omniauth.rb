Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], {
    :image_aspect_ratio => "square",
    :access_type => "online"
  }
  provider :developer unless Rails.env.production?
end