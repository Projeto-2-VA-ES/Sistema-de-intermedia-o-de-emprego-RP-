class EntrevistadorsController < ApplicationController
  before_action :set_entrevistador, only: %i[ show edit update destroy ]

  # GET /entrevistadors or /entrevistadors.json
  def index
    @entrevistadors = Entrevistador.all
  end

  # GET /entrevistadors/1 or /entrevistadors/1.json
  def show
  end

  # GET /entrevistadors/new
  def new
    @entrevistador = Entrevistador.new
  end

  # GET /entrevistadors/1/edit
  def edit
  end

  # POST /entrevistadors or /entrevistadors.json
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

  # PATCH/PUT /entrevistadors/1 or /entrevistadors/1.json
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

  # DELETE /entrevistadors/1 or /entrevistadors/1.json
  def destroy
    @entrevistador.destroy

    respond_to do |format|
      format.html { redirect_to entrevistadors_url, notice: "Entrevistador was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entrevistador
      @entrevistador = Entrevistador.unscoped.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entrevistador_params
      params.require(:entrevistador).permit(:nome, :email, :telefone, :vaga_de_emprego_id)
    end
end
