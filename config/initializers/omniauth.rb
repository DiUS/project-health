Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "676829387040.apps.googleusercontent.com", "p7YXYV4031t4DZCYywGBAzej", {
    :image_aspect_ratio => "square"
  }
  provider :developer unless Rails.env.production?
end