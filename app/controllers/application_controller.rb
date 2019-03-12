class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
      # Interface (Forms)
    get '/recipes/new' do 
        erb :new
    end
    
    get '/recipes/:id/edit' do 
        @recipe = Recipe.find(params[:id])
        erb :edit
    end

    #read
    get '/recipes' do
        @recipes = Recipe.all
        erb :index
    end
    
    get '/recipes/:id' do
      @recipe = Recipe.find(params[:id]) 
      erb :show
    end

    #create
    post '/recipes' do 
      @recipe = Recipe.create(params)
      redirect "/recipes/#{@recipe.id}"
    end

    # Update
    patch '/recipes/:id' do 
        @recipe = Recipe.find(params[:id]) 
        @recipe.update(params)
        redirect "/recipes/#{@recipe.id}"
    end

    # Delete
    delete '/recipes/:id' do 
        @recipe = Recipe.find(params[:id]) 
        @recipe.delete
        redirect "/recipes"
    end    



end
