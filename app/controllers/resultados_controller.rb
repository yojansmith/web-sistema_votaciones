class ResultadosController < ApplicationController
  before_action :require_login

  def index
    @cargos = Cargo.includes(candidatos: :votos)
  end
end
