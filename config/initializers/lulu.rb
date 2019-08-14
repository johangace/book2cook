LULU_LIVE = ENV['LULU_LIVE'] == "true"

LULU_API_KEY =  if LULU_LIVE
                  ENV['LULU_LIVE_API_KEY']
                else
                  ENV['LULU_SANDBOX_API_KEY']
                end

LULU_URL = if LULU_LIVE
              "https://api.lulu.com/auth/realms/glasstree/protocol/openid-connect/token"
            else
              "https://api.sandbox.lulu.com/auth/realms/glasstree/protocol/openid-connect/token"
            end

response =  HTTParty.post(
              LULU_URL,
              body: {
                "grant_type" => "client_credentials"
              },
              headers: {
                "Content-Type" => "application/x-www-form-urlencoded",
                "Authorization" => "Basic #{LULU_API_KEY}"
              }
            )

LULU_TOKEN = JSON.parse(response.body)['access_token']

class Lulu
  def self.token
    LULU_TOKEN
  end

  def self.base_url
    LULU_LIVE ? "https://api.lulu.com" : "https://api.sandbox.lulu.com"
  end
end
