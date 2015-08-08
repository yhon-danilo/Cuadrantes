class Administrador::UsuariosController < ApplicationController
  before_action :set_usuario, :only => [:show, :edit, :update, :destroy]
  before_filter :guardar_estado, :only => [:new, :create]
  def index
    @usuarios = Usuario.all
  end

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(parametros_usuario)
    if @usuario.save
      redirect_to administrador_usuario_path(@usuario)
    else
      render 'new'
    end  

  end

  def show
    
  end

  def edit

  end

  def update
    if @usuario.update(parametros_usuario)
      @usuario.save
      render 'show'
    end

  end

  def destroy

    if @usuario.delete
      @usuario.destroy
      redirect_to administrador_usuarios_path
    end

  end


  private
  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  def parametros_usuario
    params.require(:usuario).permit(:nombre_usuario, :contrasena, :confirmacion_contrasena, :nombre, :apellido)
  end
end
