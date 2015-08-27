class Administrador::ClientesController < ApplicationController

  def index
  end

  def importar
  	Cliente.importar(params[:file])
  	redirect_to root_url, notice: "Clientes importados"
  end

  protected
  def parametros_cliente
    params.require(:cliente).permit(:nit, :valor, :email, :telefono)
  end

end
