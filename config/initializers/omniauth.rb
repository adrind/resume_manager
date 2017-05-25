Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.secrets.omniauth_provider_key, Rails.application.secrets.omniauth_provider_secret,
           scope: 'email,user_education_history,user_work_history', info_fields:'id,name,education,work,email'
end
