class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  # display all recipes
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # Create trigger the new page
  get '/recipes/new' do
    erb :new
  end

  # Create post info into index page and redirect to single page
  post '/recipes' do
    recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{recipe.id}"
  end

  # display a single recipe 
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

   # Update
   get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
 end


   patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{@recipe.id}"
    #erb :show
   end


   delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect '/recipes'
   end
end
