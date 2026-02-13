class ApplicationController < ActionController::Base
  ADMIN_CEDULA = "1041460642"

  helper_method :current_user, :admin?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def admin?
    current_user&.role == "admin"
  end

  def require_login
    unless current_user
      redirect_to new_user_path, alert: "Debes registrarte antes de votar"
    end
  end

  def require_admin
    unless admin?
      redirect_to root_path, alert: "Acceso no autorizado"
    end
  end
end