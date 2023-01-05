require "test_helper"

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
    @tennis = products(:tennis)
    @surf = products(:surf)
  end

  test 'should return my favorites' do
    get favorites_url

    assert_response :success
  end

  test "should create favorite" do
    assert_difference('Favorite.count', 1) do
      post favorites_url(product_id: @tennis.id)
    end

    assert_redirected_to product_path(@tennis)
  end

  test "should destroy favorite" do
    assert_difference('Favorite.count', -1) do
      delete favorite_url(product_id: @surf.id)
    end

    assert_redirected_to product_path(@surf)
  end
end
