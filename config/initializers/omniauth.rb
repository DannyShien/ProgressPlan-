OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '283296398853049', '32f0b124f819e632abdb206b8d96bb57'
end