 class Posts < Grape::API
  prefix 'api'
  version 'v1'
  format :json

  get :posts do
  end
end
