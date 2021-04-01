# Rails.application.config.middleware.use OmniAuth::Builder do
#     provider :twitter, "5jCqnLRWkHLHbbEysebnqtNST", "MCP2Fr1jIleF7bbhLJy5KI3R3szjTzXCEUgo6HK1RpaXHRrqnd"
#   end


  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
  end