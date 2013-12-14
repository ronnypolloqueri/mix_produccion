require 'test_helper'

class PaginasControllerTest < ActionController::TestCase
  test "should get ingrese_productos" do
    get :ingrese_productos
    assert_response :success
  end

  test "should get variables_produccion" do
    get :variables_produccion
    assert_response :success
  end

  test "should get produccion_diaria" do
    get :produccion_diaria
    assert_response :success
  end

  test "should get costos_totales" do
    get :costos_totales
    assert_response :success
  end

end
