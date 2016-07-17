class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    
    respond_to do |format|
      format.html
      format.json { render :json => @kittens }
    end    
  end
  
  def show
    @kitten = Kitten.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json { render :json => @kitten }
    end
  end
  
  def new
    @kitten = Kitten.new
  end
  
  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:notice] = "Kitten was created"
      redirect_to kittens_path            
    else
      flash[:notice] = "Error creating kitten - try again"
      redirect_to new_kittens_path
    end
  end
  
  def edit
    @kitten = Kitten.find(params[:id])
  end
  
  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update_attributes(kitten_params)
      flash[:notice] = "Kitten was edited"
    else
      flash[:notice] = "Kitten was not updated"
    end
  end
  
  def destroy
    @kitten = Kitten.find(params[:id])
    if @kitten.destroy
      redirect_to kittens_path
      flash[:notice] = "Kitten was deleted"
    else
      flash[:notice] = "Kitten was not deleted"
    end
  end
  
    private
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
  
end
