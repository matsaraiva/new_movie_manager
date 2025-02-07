class ApplicationController < ActionController::Base
  # Protege contra CSRF (Cross-Site Request Forgery)
  protect_from_forgery with: :exception

  # Método auxiliar para obter o usuário atual (se você tiver autenticação)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # Define current_user como um método helper para views
  helper_method :current_user
end