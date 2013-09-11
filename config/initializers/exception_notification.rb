if Rails.env == "production" || Rails.env == "staging"

  exceptions = []
  exceptions << 'ActiveRecord::RecordNotFound'
  exceptions << 'AbstractController::ActionNotFound'
  exceptions << 'ActionController::RoutingError'
  exceptions << 'ActionController::InvalidAuthenticityToken'

  server_name = case Rails.env
    when "production"     then "mystore.com"
    when "staging"        then "staging.mystore.com"
    when "development"    then "DEVELOPMENT mystore"
    else
      "unknown env mystore"
  end

  MyStore::Application.config.middleware.use ExceptionNotification::Rack,
      email: {
        email_prefix:   "[#{server_name} error] ",
        sender_address: "error500@mystore.com",
        exception_recipients: ["richard.m.n.white@gmail.com"]
      },
      ignore_exceptions: exceptions

end
