class PizzasController < ApplicationController

    get '/pizzas' do
      authenticate
      @user = current_user
      @pizzas = Pizza.all
      erb :"recipes/pizzas"
    end
  
    get '/pizzas/new' do
      authenticate
      @pizza = Pizza.new
      erb :"/recipes/new_pizza"
    end
  
    post '/pizzas' do
      @pizzas = Pizza.create(name: params[:name], description: params[:description], ingredients: params[:ingredients], user: current_user)
        
      if @pizza.errors.any?
        erb :"/recipes/new_pizza"
      else
        erb :"recipes/show_pizza"
      end
    end
  
    get '/pizzas/:id' do  
      @failed = false
      authenticate
      @pizza = Pizza.find_by_id(params[:id])
      redirect '/pizzas' if @pizza.nil?
      erb :"recipes/show_pizza"
    end
  
    get '/pizzas/:id/edit' do
      @pizza = Pizza.find_by(id: params[:id])
      authenticate
  
      if logged_in? && @pizza.user_id == current_user.id
        erb :"recipes/edit_pizza"
      else
        @failed = true
        erb :"recipes/show_pizza"
      end
    end
  
    patch '/pizzas/:id' do
      @pizza = Pizza.find_by(id: params[:id])
      # not_found if !@item
      @pizza.update(name: params[:name], description: params[:description], ingredients: params[:ingredients], user: current_user)
              
      if @pizza.errors.any?
        erb :"/recipes/edit_pizza"
      else
        erb :"recipes/show_pizza"
      end
    end
  
    delete '/pizzas/:id' do
     @pizza = Pizza.find_by(id: params[:id])
      pizza.delete if pizza.user_id == current_user.id
      
      redirect '/pizzas'
    end
  
    post '/pizzas/search' do
      @user = current_user
      @word = params[:search]
      @pizzas = Pizza.where("name LIKE ?", "%#{params[:search]}%")
      @search = true
      erb :'recipes/pizzas'
    end
  
  end