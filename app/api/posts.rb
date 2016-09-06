class Posts < Grape::API
  prefix 'api'
  version 'v1'
  format :json

  get :posts do
    { data: Post.page(params[:page]).order('created_at DESC') }
  end
end
