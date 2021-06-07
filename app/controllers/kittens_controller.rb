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
      redirect_to root_url
    else
      render new, notice: 'this request was not successful'
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update(kitten_params)

    if @kitten.save
      redirect_to @kitten, notice: 'You have successfully updated this kitten\'s info.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = kitten.find(params[:id])
    @kitten.destroy
    redirect_to root_url, notice: 'Kitten record deleted.'
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
