class Usuario < ActiveRecord::Base
  attr_accessor :password_confirmation
  validates :nombre_usuario, :presence => :true, :uniqueness => true
  before_save :encrypt_password



  def encrypt_password
    if password.present?
	  self.salt=BCrypt::Engine.generate_salt
	  self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
	end
  end 

  def self.authenticate(username="", login_password="")
    user = Usuario.find_by_nombre_usuario(username)
    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end 

  def match_password(login_password="")
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end

end
