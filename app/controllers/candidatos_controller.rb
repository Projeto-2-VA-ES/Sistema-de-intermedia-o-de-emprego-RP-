class CandidatosController < ApplicationController
  before_action :set_candidato, only: %i[ show edit update destroy ]

  def index
    @candidatos = Candidato.all
  end

  def show
    @candidaturas = Candidatura.all.where(:candidato_id => params[:id])
  end

  def newCandidatura
    @candidato = Candidato.find(params[:id])
    @candidatura = @candidato.candidaturas.build

  end

  def createCandidatura
    @candidato = Candidato.find(params[:id])
    @candidatura = @candidato.candidaturas.build(candidatura_params)
    if @candidatura.save
      redirect_to @candidato, notice: "Candidatura was successfully created."
    else
      render :newCandidatura
    end
  end

  def new
    @candidato = Candidato.new
    @candidato.build_curriculo
  end

  def edit
    @candidato.build_curriculo if @candidato.curriculo.nil?
  end

  def create
    @candidato = Candidato.new(candidato_params)
    @candidato.build_curriculo(candidato_params[:curriculo_attributes])

    respond_to do |format|
      if @candidato.save
        format.html { redirect_to @candidato, notice: "Candidato foi criado com sucesso." }
        format.json { render :show, status: :created, location: @candidato }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @candidato.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @candidato.update(candidato_params)
        format.html { redirect_to candidato_url(@candidato), notice: "Candidato was successfully updated." }
        format.json { render :show, status: :ok, location: @candidato }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @candidato.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @candidato.destroy

    respond_to do |format|
      format.html { redirect_to candidatos_url, notice: "Candidato was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_candidato
    @candidato = Candidato.find(params[:id])
    @curriculo = Curriculo.find_by_candidato_id(@candidato.id)
  end

  def candidato_params
    params.require(:candidato).permit(:nome, :email, :cpf, :dataNascimento, :telefone, curriculo_attributes: [:nome, :objetivo, :experiencia_profissional, :formacao_academica, :habilidades, :candidato_id])
  end

  def curriculo_params
    params.require(:curriculo).permit(:nome, :objetivo, :experiencia_profissional, :formacao_academica, :habilidades, :candidato_id)

  end

  def vagas_disponiveis
    @candidato = current_candidato
    render 'vaga_de_empregos/index/disponiveis'
  end

end