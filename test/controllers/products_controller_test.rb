require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'render products list' do
    get products_path

    assert_response :success
    assert_select '.product', 4
    assert_select '.category', 3
  end

  test 'render products list filtered by category' do
    get products_path(category_id: categories(:cameras).id)

    assert_response :success
    assert_select '.product', 2
  end

  test 'render a detail product page' do
    get product_path(products(:ps4))

    assert_response :success
    assert_select '.title', 'ps4'
    assert_select '.description', 'PlayStation 4 - new generation'
    assert_select '.price', '$9819'
  end

  test 'render new product form' do
    get new_product_path

    assert_response :success
    assert_select 'form'
  end

  test 'allows to create a new product' do
    post products_path, params: {
      product: {
        title: 'ps4',
        description: 'PlayStation 4 - new generation',
        price: 9819,
        category_id: categories(:videogames).id
      }
    }

    assert_redirected_to products_path
    assert_equal flash[:notice], 'Product was successfully saved!'
  end

  test 'does not allow to create a new product with empty field' do
    post products_path, params: {
      product: {
        title: 'ps4',
        price: 9819
      }
    }

    assert_response :unprocessable_entity
  end

  test 'render edit product form' do
    get edit_product_path(products(:ps4))

    assert_response :success
    assert_select 'form'
  end

  test 'allows to update a product' do
    patch product_path(products(:ps4)), params: {
      product: {
        price: 2500
      }
    }

    assert_redirected_to products_path
    assert_equal flash[:notice], 'Product was successfully updated!'
  end

  test 'does not allow to update a product with an invalid field' do
    patch product_path(products(:ps4)), params: {
      product: {
        price: nil
      }
    }

    assert_response :unprocessable_entity
  end

  test 'can delete products' do
    assert_difference('Product.count', -1) do
      delete product_path(products(:ps4))
    end

    assert_redirected_to products_path
    assert_equal flash[:notice], 'Product was successfully deleted!'
  end
end