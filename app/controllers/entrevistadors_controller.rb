class EntrevistadorsController < ApplicationController
  before_action :set_entrevistador, only: %i[ show edit update destroy ]

  def index
    @entrevistadors = Entrevistador.all
  end

  def new
    @entrevistador = Entrevistador.new
  end

  def edit
  end

  def create
    @entrevistador = Entrevistador.new(entrevistador_params)

    respond_to do |format|
      if @entrevistador.save
        format.html { redirect_to entrevistador_url(@entrevistador), notice: "Entrevistador was successfully created." }
        format.json { render :show, status: :created, location: @entrevistador }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entrevistador.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entrevistador.update(entrevistador_params)
        format.html { redirect_to entrevistador_url(@entrevistador), notice: "Entrevistador was successfully updated." }
        format.json { render :show, status: :ok, location: @entrevistador }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entrevistador.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entrevistador.destroy

    respond_to do |format|
      format.html { redirect_to entrevistadors_url, notice: "Entrevistador was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_entrevistador
    @entrevistador = Entrevistador.where(id: params[:id]).first
  end

  def entrevistador_params
    params.require(:entrevistador).permit(:nome, :email, :telefone, :vaga_de_emprego_id)
  end
end
