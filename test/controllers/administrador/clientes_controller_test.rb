require 'test_helper'

class Administrador::ClientesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get importar" do
    get :importar
    assert_response :success
  end

end
