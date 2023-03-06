class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # @api: Enable CORS Headers
  configure do
    enable :cross_origin
  end
  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end
  options "*" do
    response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
    response.headers["Access-Control-Allow-Origin"] = "*"
    200
  end
  # @api: Format the json response
  def json_response(code: 200, data: nil)
    status = [200, 201].include?(code) ? "SUCCESS" : "FAILED"
    headers['Content-Type'] = 'application/json'
    if data
      [ code, { data: data, message: status }.to_json ]
    end
  end
  # @views: Format the erb responses
  def erb_response(file)
    headers['Content-Type'] = 'text/html'
    erb file
  end
  # @helper: not found error formatter
  def not_found_response
    json_response(code: 404, data: { error: "You seem lost. That route does not exist." })
  end
  # @api: 404 handler
  not_found do
    not_found_response
  end


  # Add your routes here
  get "/" do
    # { message: "Good luck with your project!" }.to_json
    json_response(message: "Good luck with your project!")
  end

  get "/all" do
    Todo.all.reverse.to_json
  end
  # get '/all' do
  #   todos = Todo.join(:users).where(users.email: params[:email]).select_all(:todos).all
  #   todos.to_json
  # end

  get '/all/:id' do
    task = Todo.find(params[:id])
    json_response(data: task)
  end
  
  patch '/patch/:id' do
    review = Todo.find(params[:id])
    review.update(
      name: params[:name],
      description: params[:description]
    )
    json_response(data: review)
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
    json_response(data: users)
  end
  delete '/delete/:id' do
    # find the review using the ID
    review = Todo.find(params[:id])
    # delete the review
    review.destroy
    # send a response with the deleted review as JSON
    json_response(data: review)
  end

  get '/credentials' do
    users = User.all
    json_response(data: users)
  end
end