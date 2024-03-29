class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
  before_action :set_locale, :default_url_options
  before_action :set_i18n_locale_from_params
  before_action :configure_permitted_parameters, if: :devise_controller?



  protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:username, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:username, :email, :password, :password_confirmation, :current_password)}
  end

  protected
  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
      else
        flash.now[:notice] =
        "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end

   private
	  
	  def after_sign_in_path_for(resource)
		root_path(current_user)
	  end

    def set_locale
      I18n.locale = params[:locale] || extract_locale_from_accept_language_header || I18n.default_locale
    end
    
    def extract_locale_from_accept_language_header
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end
    
    # app/controllers/application_controller.rb
    def self.default_url_options(options={})
      logger.debug "default_url_options is passed options: #{options.inspect}\n"
      { locale: I18n.locale }
    end

end

