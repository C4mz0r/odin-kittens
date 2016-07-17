class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end
  
  def show
    @kitten = Kitten.find(params[:id])
  end
  
  def new
    @kitten = Kitten.new
  end
  
  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to kittens_path(@kitten)      
    else
      redirect_to new_kittens_path
    end
  end
  
  def edit
    @kitten = Kitten.find(params[:id])
  end
  
  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update_attributes(kitten_params)
  end
  
  def delete
    
  end
  
    private
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
  
end
