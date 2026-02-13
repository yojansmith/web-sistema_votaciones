class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(cedula: params[:session][:cedula])

    if user
      
      if user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to new_voto_path, notice: "Bienvenido, #{user.nombre}!"
      else
        flash.now[:alert] = 'Contraseña incorrecta'
        render :new, status: :unprocessable_entity
      end
    else
      
      flash[:alert] = 'No existe una cuenta con esa cédula. Por favor regístrate primero.'
      redirect_to new_user_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Sesión cerrada exitosamente'
  end
end