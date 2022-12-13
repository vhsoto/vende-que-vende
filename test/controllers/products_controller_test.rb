require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'render products list' do
    get products_path

    assert_response :success
    assert_select '.product', 2
  end

  test 'render a detail product page' do
    get product_path(products(:kodak))

    assert_response :success
    assert_select '.title', 'Kodak'
    assert_select '.description', 'Sony Cyber-shot DSC-RX1R II'
    assert_select '.price', '$3992'
  end

  test 'render new product form' do
    get new_product_path

    assert_response :success
    assert_select 'form'
  end

  test 'allows to create a new product' do
    post products_path, params: {
      product: {
        title: 'Kodak',
        description: 'Kodak QI-456',
        price: 3456
      }
    }

    assert_redirected_to products_path
    assert_equal flash[:notice], 'Product was successfully saved!'
  end

  test 'does not allow to create a new product with empty field' do
    post products_path, params: {
      product: {
        title: 'Kodak',
        price: 3456
      }
    }

    assert_response :unprocessable_entity
  end

  test 'render edit product form' do
    get edit_product_path(products(:kodak))

    assert_response :success
    assert_select 'form'
  end

  test 'allows to update a product' do
    patch product_path(products(:kodak)), params: {
      product: {
        price: 2500
      }
    }

    assert_redirected_to products_path
    assert_equal flash[:notice], 'Product was successfully updated!'
  end

  test 'does not allow to update a product with an invalid field' do
    patch product_path(products(:kodak)), params: {
      product: {
        price: nil
      }
    }

    assert_response :unprocessable_entity
  end
end