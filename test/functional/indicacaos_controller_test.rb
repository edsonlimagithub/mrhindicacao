require 'test_helper'

class IndicacaosControllerTest < ActionController::TestCase
  setup do
    @indicacao = indicacaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:indicacaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create indicacao" do
    assert_difference('Indicacao.count') do
      post :create, indicacao: { cliente_id: @indicacao.cliente_id, data: @indicacao.data, detalhes: @indicacao.detalhes, servico_id: @indicacao.servico_id, usuario_id: @indicacao.usuario_id }
    end

    assert_redirected_to indicacao_path(assigns(:indicacao))
  end

  test "should show indicacao" do
    get :show, id: @indicacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @indicacao
    assert_response :success
  end

  test "should update indicacao" do
    put :update, id: @indicacao, indicacao: { cliente_id: @indicacao.cliente_id, data: @indicacao.data, detalhes: @indicacao.detalhes, servico_id: @indicacao.servico_id, usuario_id: @indicacao.usuario_id }
    assert_redirected_to indicacao_path(assigns(:indicacao))
  end

  test "should destroy indicacao" do
    assert_difference('Indicacao.count', -1) do
      delete :destroy, id: @indicacao
    end

    assert_redirected_to indicacaos_path
  end
end
