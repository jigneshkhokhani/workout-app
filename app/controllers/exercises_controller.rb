class ExercisesController < ApplicationController
  def index
    @exercises = current_user.exercises
  end

  def new
    @exercise = current_user.exercises.build
  end

  def create
    @exercise = current_user.exercises.new(exercise_params)

    if @exercise.save
      flash[:notice] = 'Exercise has been created'
      # redirect_to user_exercise_path(current_user, @exercise)
      redirect_to [current_user, @exercise] # we can also redirect like this
    else
      flash.now[:alert] = 'Exercise has not been created'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @exercise = current_user.exercises.find(params[:id])
  end

  private

  def exercise_params
    params.require(:exercise).permit(:duration_in_min, :workout, :workout_date, :user_id)
  end
end