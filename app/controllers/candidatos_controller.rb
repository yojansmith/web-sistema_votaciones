class CandidatosController < ApplicationController
  before_action :set_candidato, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]

  def new
    @candidato = Candidato.new
  end

  def show
    redirect_to new_voto_path
  end

  def edit
  end

  def create
    @candidato = Candidato.new(candidato_params)

    if @candidato.save
      redirect_to new_voto_path, notice: 'Candidato creado exitosamente.'
    else
      flash.now[:alert] = 'Error al crear el candidato.'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @candidato.update(candidato_params)
      redirect_to new_voto_path, notice: 'Candidato actualizado exitosamente.'
    else
      flash.now[:alert] = 'Error al actualizar el candidato.'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Rails.logger.info "========== INTENTANDO ELIMINAR CANDIDATO =========="
    Rails.logger.info "Candidato ID: #{@candidato.id}"
    Rails.logger.info "Candidato Nombre: #{@candidato.nombre}"
    Rails.logger.info "Usuario actual: #{current_user&.nombre}"
    Rails.logger.info "Es admin?: #{admin?}"
    
    nombre = @candidato.nombre
    
    begin
      
      votos_count = @candidato.votos.count
      Rails.logger.info "Votos a eliminar: #{votos_count}"
      @candidato.votos.destroy_all if votos_count > 0
      
      
      @candidato.foto.purge if @candidato.foto.attached?
      
      
      @candidato.destroy!
      
      Rails.logger.info "Candidato eliminado exitosamente"
      redirect_to new_voto_path, notice: "#{nombre} ha sido eliminado exitosamente."
    rescue => e
      Rails.logger.error "Error al eliminar: #{e.message}"
      Rails.logger.error e.backtrace.join("\n")
      redirect_to new_voto_path, alert: "Error al eliminar el candidato: #{e.message}"
    end
  end

  private

  def set_candidato
    @candidato = Candidato.find(params[:id])
  end

  def candidato_params
    params.require(:candidato).permit(:nombre, :propuesta, :cargo_id, :partido_id, :foto)
  end

  def require_admin
    Rails.logger.info "========== VERIFICANDO ADMIN =========="
    Rails.logger.info "Usuario actual: #{current_user&.id} - #{current_user&.nombre}"
    Rails.logger.info "Es admin?: #{current_user&.admin?}"
    
    unless current_user&.admin?
      Rails.logger.warn "Acceso denegado - no es admin"
      redirect_to root_path, alert: 'No tienes permisos para realizar esta acción.'
    end
  end
end