class VagaDeEmpregosController < ApplicationController
  before_action :set_vaga_de_emprego, only: %i[ show edit update destroy ]

  def index
    @vaga_de_empregos = VagaDeEmprego.all
  end

  def new
    @vaga_de_emprego = VagaDeEmprego.new
  end

  def edit
  end

  def create
    @vaga_de_emprego = VagaDeEmprego.new(vaga_de_emprego_params)

    respond_to do |format|
      if @vaga_de_emprego.save
        format.html { redirect_to @vaga_de_emprego, notice: "Vaga de emprego foi criada com sucesso." }
        format.json { render :show, status: :created, location: @vaga_de_emprego }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vaga_de_emprego.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @vaga_de_emprego.update(vaga_de_emprego_params)
        format.html { redirect_to vaga_de_emprego_url(@vaga_de_emprego), notice: "Vaga de emprego foi atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @vaga_de_emprego }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vaga_de_emprego.errors, status: :unprocessable_entity }
      end
    end
  end

  def disponiveis
    @vagas_de_emprego = VagaDeEmprego.all
  end

  def destroy
    @vaga_de_emprego.destroy

    respond_to do |format|
      format.html { redirect_to vaga_de_empregos_url, notice: "Vaga de emprego foi destruida com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  def set_vaga_de_emprego
    @vaga_de_emprego = VagaDeEmprego.unscoped.find(params[:id])
  end

  def vaga_de_emprego_params
    params.require(:vaga_de_emprego).permit(:titulo, :descricao, :salario, :empregador_id)
  end
end
