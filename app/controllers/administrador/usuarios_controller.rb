class Administrador::UsuariosController < ApplicationController
  before_action :set_usuario, :only => [:show, :edit, :update, :destroy]

  def index

  end

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(parametros_usuario)
    if @usuario.save
      redirect_to @usuario
    else
      render 'new'
    end  

  end

  def show
    
  end

  def edit

  end

  def update

  end

  def destroy

  end


  private
  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  def parametros_usuario
    params.require(:usuario).permit(:nombre_usuario, :password, :nombre, :apellido)
  end
end
