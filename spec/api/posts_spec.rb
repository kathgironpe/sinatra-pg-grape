require 'spec_helper'

describe Posts do
  def app
    Posts
  end

  let!(:browser) { Rack::Test::Session.new(Rack::MockSession.new(app)) }

  describe 'GET /api/v1/posts' do
    let!(:post) { create(:post) }

    it 'gets published posts' do
      browser.get '/api/v1/posts/published'
      expect(browser.last_response.status).to eq(200)
      expect(browser.last_response.body['data'].size).to be > 0
    end
  end

  describe 'POST /api/v1/posts' do
    let(:post) { build(:post) }

    context 'with valid data' do
      it 'creates post' do
        post_params = { title: post.title, body: post.body }
        browser.post '/api/v1/posts', post_params
        expect(browser.last_response.status).to eq(201)
      end
    end

    context 'with missing title' do
      it 'returns error' do
        post_params = { title: '', body: post.body }
        browser.post '/api/v1/posts', post_params
        response = JSON(browser.last_response.body)
        expect(browser.last_response.status).to eq(422)
        expect(response['message']).to eq("Validation failed: Title can't be blank")
      end
    end
  end
end
