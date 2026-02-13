class VotosController < ApplicationController
  before_action :require_login

  def new
    @cargos = Cargo.all
    @partidos = Partido.all
    @voto = Voto.new
    
    if params[:cargo_id].present?
      @candidatos = Candidato.where(cargo_id: params[:cargo_id])
      
      
      if params[:partido_id].present?
        @candidatos = @candidatos.where(partido_id: params[:partido_id])
      end
    else
      @candidatos = []
    end
  end

  def create
    
    @voto = Voto.new(voto_params)
    @voto.user_id = current_user.id
    @voto.cedula = current_user.cedula

    if @voto.save
      redirect_to resultados_path, notice: 'Tu voto ha sido registrado exitosamente.'
    else
      @cargos = Cargo.all
      @partidos = Partido.all
      
      
      cargo_id = params.dig(:voto, :cargo_id)
      
      if cargo_id.present?
        @candidatos = Candidato.where(cargo_id: cargo_id)
      else
        @candidatos = []
      end
      
      flash.now[:alert] = "Error al registrar tu voto: #{@voto.errors.full_messages.join(', ')}"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def voto_params
    params.require(:voto).permit(:candidato_id, :cargo_id)
  end

  def require_login
    unless current_user
      redirect_to root_path, alert: 'Debes iniciar sesión para votar.'
    end
  end
end