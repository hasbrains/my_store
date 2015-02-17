class Users::RegistrationsController < Devise::RegistrationsController
  def create

    build_resource(sign_up_params)

    if verify_recaptcha
      super
    else
      flash.now[:error] = "Incorrect recaptcha! Please try again."
      render "new"
    end

  end
end
