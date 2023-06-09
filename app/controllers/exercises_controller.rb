class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]

  def index
    @exercises = current_user.exercises
    @friends = current_user.friends
    set_current_room
    @message = Message.new
    @messages = current_room.messages if current_room
    @followers = Friendship.where(friend_id: current_user.id)
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
  end

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      flash[:notice] = 'Exercise has been updated'
      # redirect_to user_exercise_path(current_user, @exercise)
      redirect_to [current_user, @exercise] # we can also redirect like this
    else
      flash.now[:alert] = 'Exercise has not been updated'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @exercise.destroy
    flash[:notice] = 'Exercise has been deleted'
    redirect_to user_exercises_path(current_user)
  end

  private

  def exercise_params
    params.require(:exercise).permit(:duration_in_min, :workout, :workout_date, :user_id)
  end

  def set_exercise
    @exercise = current_user.exercises.find(params[:id])
  end

  def set_current_room
    @room = if params[:roomId]
              Room.find(params[:roomId])
            else
              current_user.room
            end
    session[:current_room] = @room.id if @room
  end
end