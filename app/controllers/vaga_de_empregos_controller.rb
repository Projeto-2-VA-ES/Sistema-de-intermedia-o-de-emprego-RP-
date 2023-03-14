class VagaDeEmpregosController < ApplicationController
  before_action :set_vaga_de_emprego, only: %i[ show edit update destroy ]

  # GET /vaga_de_empregos or /vaga_de_empregos.json
  def index
    @vaga_de_empregos = VagaDeEmprego.all
  end

  # GET /vaga_de_empregos/1 or /vaga_de_empregos/1.json
  def show
  end

  # GET /vaga_de_empregos/new
  def new
    @vaga_de_emprego = VagaDeEmprego.new
  end

  # GET /vaga_de_empregos/1/edit
  def edit
  end

  # POST /vaga_de_empregos or /vaga_de_empregos.json
  def create
    @empregador = Empregador.find(params[:empregador_id])
    @vaga_de_emprego = @empregador.vaga_de_empregos.create(vaga_de_emprego_params)
    redirect_to empregador_path(@empregador)
  end

  # PATCH/PUT /vaga_de_empregos/1 or /vaga_de_empregos/1.json
  def update
    respond_to do |format|
      if @vaga_de_emprego.update(vaga_de_emprego_params)
        format.html { redirect_to vaga_de_emprego_url(@vaga_de_emprego), notice: "Vaga de emprego was successfully updated." }
        format.json { render :show, status: :ok, location: @vaga_de_emprego }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vaga_de_emprego.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vaga_de_empregos/1 or /vaga_de_empregos/1.json
  def destroy
    @vaga_de_emprego.destroy

    respond_to do |format|
      format.html { redirect_to vaga_de_empregos_url, notice: "Vaga de emprego was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vaga_de_emprego
      @vaga_de_emprego = VagaDeEmprego.unscoped.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vaga_de_emprego_params
      params.require(:vaga_de_emprego).permit(:titulo, :descricao, :salario, :empregador_id)
    end
end
