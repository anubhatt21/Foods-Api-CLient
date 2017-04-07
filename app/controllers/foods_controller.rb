class FoodsController < ApplicationController

  def index
    @foods = Unirest.get("http://localhost:3000/api/v1/foods").body
    render "index.html.erb"
  end

  def show
    @food = Unirest.get("http://localhost:3000/api/v1/foods", parameters: {id: params["id"]}).body
    render "show.html.erb"
  end

  def new
    render "new.html.erb" 
  end

  def create
    @food = Unirest.post("http://localhost:3000/api/v1/foods", 
      parameters: {
      name: params["form_name"],
      origin: params["form_origin"]
      }
      ).body
    redirect_to "/foods/#{@food["id"]}"
  end

  def edit 
    @food = Unirest.get("http://localhost:3000/api/v1/foods/#{params[:id]}").body
    render "edit.html.erb"
  end

  def update
    @food = Unirest.patch("http://localhost:3000/api/v1/foods/#{params[:id]}",
      parameters: {
      name: params["form_name"],
      origin: params["form_origin"]
      }
      ).body
    redirect_to "/foods/#{@food["id"]}"
  end

  def destroy
    @food = Unirest.delete("http://localhost:3000/api/v1/foods/#{params[:id]}").body
    redirect_to "/foods"
  end

end
