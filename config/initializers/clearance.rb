Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = "reply@example.com"
  config.rotate_csrf_on_sign_in = true
  Rails.configuration.action_controller.per_form_csrf_tokens = true

end
