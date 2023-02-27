class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/all" do
    Todo.all.to_json
  end

  get '/all/:id' do
    task = Todo.find(params[:id])
    task.to_json
  end
end
