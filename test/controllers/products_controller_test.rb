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

  test 'Render new product form' do
    get new_product_path

    assert_response :success
    assert_select 'form'
  end

  test 'allow to create a new product' do
    post products_path, params: {
      product: {
        title: 'Kodak',
        description: 'Kodak QI-456',
        price: 3456
      }
    }

    assert_redirected_to products_path
  end
end