class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/recipes" do
    erb :index
  end  

  get "/recipes/new" do
    erb :new
  end

  post "/recipes" do
    Recipe.create(:name=> params[:name], :ingredients=> params[:ingredients], :cook_time=> params[:cook_time])
    binding.pry
    erb :index
  end

  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    binding.pry
    erb :edit
  end

  put "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    binding.pry
    erb :show
  end

end
