class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end
  configure do
    enable :cross_origin
  end

  get "/all" do
    Todo.all.to_json
  end

  get '/all/:id' do
    task = Todo.find(params[:id])
    task.to_json
  end
  
  patch '/patch/:id' do
    review = Todo.find(params[:id])
    review.update(
      name: params[:name],
      description: params[:description]
    )
    review.to_json
  end

  post '/post' do
    cat = Category.create(category: params[:category])
    todo = Todo.create(
      name: params[:name],
      description: params[:description],
      category_id: cat.id
    )
    content_type :json
    { category: cat, todo: todo }.to_json
  end

  post '/register' do
    users = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      phone_number: params[:phone_number]
    )
    users.to_json
  end
  delete '/delete/:id' do
    # find the review using the ID
    review = Todo.find(params[:id])
    # delete the review
    review.destroy
    # send a response with the deleted review as JSON
    review.to_json
  end

  get '/credentials' do
    User.all.to_json
  end
end