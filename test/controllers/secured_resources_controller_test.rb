# require 'spec_helper'

class SecuredResourcesControllerTest < ActionDispatch::IntegrationTest

  def authenticated_header
    token = Knock::AuthToken.new(payload: { sub: users(:one).id }).token

    {
      'Authorization': "Bearer #{token}"
    }
  end

  it 'responds successfully' do
    get secured_resources_url, headers: authenticated_header

    assert_response :success
  end
end
