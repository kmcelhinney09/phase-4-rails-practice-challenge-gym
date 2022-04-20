class GymsController < ApplicationController
  def index
    gyms = Gym.all
    render json: gyms
  end

  def show
    gym = find_gym
    if gym
      render json: gym
    else
      gym_not_found
    end
  end

  def destroy
    gym = find_gym
    if gym
      gym.destroy
      head :no_content
    else
      gym_not_found
    end
  end

  def update
    gym = find_gym
    if gym
      gym.update(gym_params)
      render json: gym
    else
      gym_not_found
    end
  end


  private

  def gym_not_found
    render json: { error: "Gym not found" }, status: :not_found
  end

  def find_gym
    Gym.find_by(id: params[:id])
  end

  def gym_params
    params.permit(:name, :address)
  end
end
