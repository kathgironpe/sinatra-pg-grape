class Posts < Grape::API
  prefix 'api'
  version 'v1'
  format :json

  rescue_from ActiveRecord::RecordInvalid do |e|
    error!({
      error: "#{e.class} error",
      message: e.message
    }, 422)
  end

  resources :posts do
    desc 'Returns a list of posts.'
    get :published do
      { data: Post.published.page(params[:page]).order('created_at DESC') }
    end

    desc 'Creates a post.'
    params do
      requires :title, type: String, desc: 'Post title.'
      requires :body, type: String, desc: 'Body.'
    end

    post do
      Post.create!(title: params[:title], body: params[:body])
    end
  end
end
