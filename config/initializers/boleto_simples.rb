BoletoSimples.configure do |c|
  c.environment = :sandbox
  c.user_agent = Rails.application.credentials[:user_agent]
  c.api_token = Rails.application.credentials[:api_token]
end