class EmpregadorsController < ApplicationController
  before_action :set_empregador, only: %i[ show edit update destroy ]

  def index
    @empregadors = Empregador.all
  end

  def new
    @empregador = Empregador.new
  end

  def edit
  end

  def create
    @empregador = Empregador.new(empregador_params)

    respond_to do |format|
      if @empregador.save
        format.html { redirect_to empregador_url(@empregador), notice: "Empregador was successfully created." }
        format.json { render :show, status: :created, location: @empregador }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empregador.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @empregador.update(empregador_params)
        format.html { redirect_to empregador_url(@empregador), notice: "Empregador was successfully updated." }
        format.json { render :show, status: :ok, location: @empregador }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empregador.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @empregador.destroy

    respond_to do |format|
      format.html { redirect_to empregadors_url, notice: "Empregador was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_empregador
    @empregador = Empregador.find(params[:id])
  end

  def empregador_params
    params.require(:empregador).permit(:nome, :nomeEmpresa, :email, :endereco, :telefone, :cnpj)
  end
end
