# class ApplicationController < Sinatra::Base
  


#   # post '/register' do
#   #   "This is register part"
#   #   user_data = JSON.parse(request.body.read)
#   #   name = user_data['name']
#   #   email = user_data['email']
#   #   password = user_data['password']
#   #   phone_number = user_data['tel']
#   #   # password = user_data['password']

#   #   # Encrypt the password using bcrypt
#   #   password_digest = BCrypt::Password.create(password)

#   #   # Create a new User record in the database
#   #   user = User.create(
#   #     name: name,
#   #     email: email,
#   #     phone_number: phone_number,
#   #     password_digest: password_digest
#   #   )

#   #   # Return the user data as a JSON response
#   #   content_type :json
#   #   { id: user.id, name: user.name, email: user.email, phone_number: user.phone_number, password_digest: user.password_digest  }.to_json
#   # end

  

  
# end



class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/all" do
    Todo.all.to_json
  end

  # @api: Enable CORS Headers
  configure do
    enable :cross_origin
  end

  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end

  options "*" do
    response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
    response.headers["Access-Control-Allow-Origin"] = 'http://localhost:3000'
    # response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
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

  # @api: Format all common JSON error responses
  def error_response(code, e)
    json_response(code: code, data: { error: e.message })
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