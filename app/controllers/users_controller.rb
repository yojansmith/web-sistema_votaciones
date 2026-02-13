class UsersController < ApplicationController
  before_action :require_login, only: [:destroy], if: -> { defined?(require_login) }
  before_action :require_self_or_admin, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = "votante"
    
   
    if params[:user][:cedula] == ApplicationController::ADMIN_CEDULA
      @user.role = "admin"
    end

    if @user.save
      session[:user_id] = @user.id
      redirect_to new_voto_path, notice: "¡Cuenta creada exitosamente! Bienvenido, #{@user.nombre}"
    else
      flash.now[:alert] = @user.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    
    
    unless current_user && (current_user.id == user.id || admin?)
      redirect_to root_path, alert: 'No tienes permisos para realizar esta acción.'
      return
    end

    nombre = user.nombre

   
    user.votos.destroy_all if user.votos.any?
    user.destroy

    if current_user && current_user.id == user.id
      session[:user_id] = nil
      redirect_to root_path, notice: "Tu cuenta ha sido eliminada exitosamente."
    else
      redirect_to new_voto_path, notice: "#{nombre} ha sido eliminado exitosamente."
    end
  end

  private

  def user_params
    params.require(:user).permit(:nombre, :cedula, :password, :password_confirmation)
  end

  def require_self_or_admin
    user = User.find(params[:id])
    unless current_user && (current_user.id == user.id || admin?)
      redirect_to root_path, alert: 'No tienes permisos para realizar esta acción.'
    end
  end
end