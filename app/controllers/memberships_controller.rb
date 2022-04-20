class MembershipsController < ApplicationController
  def index
    memberships = Membership.all
    render json: memberships
  end

  def create
    membership = Membership.create!(gym_id: params[:gym_id], client_id: params[:client_id], charge: params[:charge])
    render json: membership, status: :created
  rescue ActiveRecord::RecordInvalid => invalid
      render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end
end
