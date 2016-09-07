require 'spec_helper'

describe Posts do
  def app
    Posts
  end

  describe 'GET /api/v1/posts' do
    let!(:post) { create(:post) }

    it 'gets published posts' do
      get '/api/v1/posts'
      expect(last_response.status).to eq(200)
      expect(last_response.body['data'].size).to be > 0
    end
  end
end
