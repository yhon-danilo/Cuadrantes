class Usuario < ActiveRecord::Base
  attr_accessor :contrasena, :confirmacion_contrasena
  validates :nombre_usuario, :presence => :true, :uniqueness => true
  validates :contrasena, :presence => :true
  before_save :encrypt_password
  
  def self.authenticate(username="", login_password="")
    user = Usuario.find_by_nombre_usuario(username)
    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end 

  def match_password(login_password="")
    password == BCrypt::Engine.hash_secret(login_password, salt)
  end

  def encrypt_password
    #if self.contrasena == self.confirmacion_contrasena
      if contrasena.present?
	      self.salt = BCrypt::Engine.generate_salt
	      self.password = BCrypt::Engine.hash_secret(contrasena, salt)
	      
      end
    #else
      #self.errors[:contrasena] = 'contrasena y confirmacion contrasena no son iguales'
      
    #end
  end 


end
