require 'test_helper'

class LoanProductsControllerTest < ActionController::TestCase
  setup do
    @loan_product = loan_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loan_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loan_product" do
    assert_difference('LoanProduct.count') do
      post :create, loan_product: { code: @loan_product.code }
    end

    assert_redirected_to loan_product_path(assigns(:loan_product))
  end

  test "should show loan_product" do
    get :show, id: @loan_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loan_product
    assert_response :success
  end

  test "should update loan_product" do
    patch :update, id: @loan_product, loan_product: { code: @loan_product.code }
    assert_redirected_to loan_product_path(assigns(:loan_product))
  end

  test "should destroy loan_product" do
    assert_difference('LoanProduct.count', -1) do
      delete :destroy, id: @loan_product
    end

    assert_redirected_to loan_products_path
  end
end
