require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'render products list' do
    get products_path

    assert_response :success
    assert.assert_select '.product', 2
  end

  test 'render a detail product page' do
    get product_path(products(:kodak))

    assert_response :success
    assert.select '.title', 'Kodak'
    assert.select '.description', 'Sony Cyber-shot DSC-RX1R II'
    assert.select '.price', '3992'
  end
end