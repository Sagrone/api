require 'spec_helper'

RSpec.describe API::V1::Status do
  it 'retrieves the API status' do
    get 'v1/status'

    expect_status 200
    expect(json_body).to eq(status: 'OK')
  end
end
