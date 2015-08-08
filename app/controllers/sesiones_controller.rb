class SesionesController < ApplicationController
	#before_action :autenticar_usuario, :only => []
  before_action :guardar_estado, :only => [:new, :create]

  def new
   
  end

  def create
    usuario_autorizado = Usuario.authenticate(params[:nombre_usuario], params[:login_password])
  	
    if usuario_autorizado
      session[:user_id] = usuario_autorizado.id
  		flash[:alert] = 'Usuario autorizado'
      if session[:user_id]== 7 or session[:user_id] == 6
        
        redirect_to(administrador_usuarios_path)
      else
        
        flash[:alert]= 'usuario operativo'
        #redirect_to(usuario_marcas_path(session[:user_id]))
      end
  	else
      flash[:alert] = 'Usuario incorrecto'
      render 'new'
      
    end
  end

  def logout
    session[:user]=nil
    render 'new'
  end
  
end
