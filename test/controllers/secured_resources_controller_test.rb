require 'test_helper'

class SecuredResourcesControllerTest < ActionDispatch::IntegrationTest

  def authenticated_header
      token = Knock::AuthToken.new(payload: { sub: users(:one).id }).token
    {
      'Authorization': "Bearer #{token}"
    }
  end

  test 'responds successfully' do
    get '/tools', headers: authenticated_header

    assert_response :success
  end
end
