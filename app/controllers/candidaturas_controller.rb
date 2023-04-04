class CandidaturasController < ApplicationController
  before_action :set_candidatura, only: %i[ show edit update destroy ]

  def index
    @candidaturas = Candidatura.all
  end

  def new
    @candidatura = Candidatura.new
  end

  def edit
  end

  def create
    @candidatura = Candidatura.new(candidatura_params)

    respond_to do |format|
      if @candidatura.save
        format.html { redirect_to @candidatura, notice: "Candidatura was successfully created." }
        format.json { render :show, status: :created, location: @candidatura }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @candidatura.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @candidatura.update(candidatura_params)
        format.html { redirect_to candidatura_url(@candidatura), notice: "Candidatura was successfully updated." }
        format.json { render :show, status: :ok, location: @candidatura }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @candidatura.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @candidatura.destroy

    respond_to do |format|
      format.html { redirect_to candidaturas_url, notice: "Candidatura was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_candidatura
    @candidatura = Candidatura.where(id: params[:id]).first
  end

  def candidatura_params
    params.require(:candidatura).permit(:mensagem, :candidato_id, :vaga_de_emprego_id)
  end
end