class CurriculosController < ApplicationController
  before_action :set_curriculo, only: %i[ show edit update destroy ]

  def index
    @curriculos = Curriculo.all
  end

  def new
    @curriculo = Curriculo.new
  end

  def edit
  end

  def create
    @curriculo = Curriculo.new(curriculo_params)

    respond_to do |format|
      if @curriculo.save
        format.html { redirect_to curriculo_url(@curriculo), notice: "Curriculo was successfully created." }
        format.json { render :show, status: :created, location: @curriculo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @curriculo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @curriculo.update(curriculo_params)
        format.html { redirect_to curriculo_url(@curriculo), notice: "Curriculo was successfully updated." }
        format.json { render :show, status: :ok, location: @curriculo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @curriculo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @curriculo.destroy

    respond_to do |format|
      format.html { redirect_to curriculos_url, notice: "Curriculo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_curriculo
    @curriculo = Curriculo.where(id: params[:id]).first
  end

  def curriculo_params
    params.require(:curriculo).permit(:nome, :objetivo, :experiencia_profissional, :formacao_academica, :habilidades, :candidato_id)
  end
end
