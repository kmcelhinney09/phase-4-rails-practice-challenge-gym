class ClientsController < ApplicationController
  def index
    clients = Client.all
    render json: clients
  end

  def show
    client = find_client
    if client
      render json: client, methods: [:total_memberships]
    else
      client_not_found
    end
  end

  def update
    client = find_client
    if client
      client.update(client_params)
      render json: client
    else
      client_not_found
    end
  end

  private

  def find_client
    Client.find_by(id: params[:id])
  end

  def client_not_found
    render json: { error: "Client not found" }, status: :not_found
  end

  def client_params
    params.permit(:name, :age)
  end

end
