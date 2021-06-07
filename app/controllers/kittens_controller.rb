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
      redirect_to root_url, notice: 'You have successfully added a new kitten.'
    else
      flash.now[:alert] = 'Wrong! Please try again. Are you on drugs?'
      render :new
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
      flash.now[:alert] = 'Nope. Try again, but this time don\'t mess up!'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    redirect_to root_url, notice: 'Kitten record deleted.'
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
