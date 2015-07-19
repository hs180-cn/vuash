class ApplicationController < ActionController::Base
  include HttpAcceptLanguage::AutoLocale
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def set_locale
    if params[:lang]
      I18n.locale = params[:lang]
    else
      super
    end
  rescue I18n::InvalidLocale
  end
end
