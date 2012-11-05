require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success    
  end

  test "index should have at least 4 links" do
    get :index  
    assert_select '#columns #side a', minimum: 4
  end
  
  test "index should have at least 3 products displayed" do
    get :index  
    assert_select '#main .entry', 3
  end
  
  test "index should display book titles as h3" do
    get :index  
    assert_select 'h3', 'Programming Ruby 1.9'
  end
  
  test "index should display price in currency format" do
    get :index  
    assert_select '.price', /\$[,\d]+\.\d\d/
  end
end
