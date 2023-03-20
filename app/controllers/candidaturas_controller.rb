class CandidaturasController < ApplicationController
  before_action :set_candidatura, only: %i[ show edit update destroy ]

  # GET /candidaturas or /candidaturas.json
  def index
    @candidaturas = Candidatura.all
  end

  # GET /candidaturas/1 or /candidaturas/1.json
  def show
  end

  # GET /candidaturas/new
  def new
    @candidato = Candidato.find(params[:candidato_id])
    @candidatura = @candidato.candidaturas.build
  end


  # GET /candidaturas/1/edit
  def edit
  end

  # POST /candidaturas or /candidaturas.json
  def create
    @candidato = Candidato.find(params[:candidato_id])
    @candidatura = @candidato.candidaturas.build(candidatura_params)
    if @candidatura.save
      redirect_to @candidato, notice: "Candidatura was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /candidaturas/1 or /candidaturas/1.json
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

  # DELETE /candidaturas/1 or /candidaturas/1.json
  def destroy
    @candidatura.destroy

    respond_to do |format|
      format.html { redirect_to candidaturas_url, notice: "Candidatura was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_candidato
    @candidato = Paciente.find(params[:id])
    @curriculo = Curriculo.find_by_candidato_id(@candidato.id)
  end




    # Use callbacks to share common setup or constraints between actions.
    def set_candidatura
      @curriculo = Curriculo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def candidatura_params
      params.require(:candidatura).permit(:mensagem,:vaga_de_empregos_id)
    end
end
