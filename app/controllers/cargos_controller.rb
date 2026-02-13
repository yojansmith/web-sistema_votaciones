class CargosController < ApplicationController
  def index
    render json: Cargo.all
  end

  def show
    cargo = Cargo.find(params[:id])
    render json: cargo
  end
end

