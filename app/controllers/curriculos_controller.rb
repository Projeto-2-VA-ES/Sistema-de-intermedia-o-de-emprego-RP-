class CurriculosController < ApplicationController
  before_action :set_curriculo, only: %i[ show edit update destroy ]

  # GET /curriculos or /curriculos.json
  def index
    @curriculos = Curriculo.all
  end

  # GET /curriculos/1 or /curriculos/1.json
  def show
  end

  # GET /curriculos/new
  def new
    @curriculo = Curriculo.new
  end

  # GET /curriculos/1/edit
  def edit
  end

  # POST /curriculos or /curriculos.json
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

  # PATCH/PUT /curriculos/1 or /curriculos/1.json
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

  # DELETE /curriculos/1 or /curriculos/1.json
  def destroy
    @curriculo.destroy

    respond_to do |format|
      format.html { redirect_to curriculos_url, notice: "Curriculo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculo
      @curriculo = Curriculo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def curriculo_params
      params.require(:curriculo).permit(:nome, :objetivo, :experiencia_profissional, :formacao_academica, :habilidades, :candidato_id)
    end
end
