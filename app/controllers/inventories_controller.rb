class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:update, :show, :destroy]
  
  def index
    inventories = Inventory.all
    render json: { response: inventories, count: inventories.count }, status: :ok
  rescue StandardError => e
    Rails.logger.warn e.message
    render json: { message: 'Error on get inventories' }, status: :bad_request
  end

  def show
    render json: @inventory, status: :ok
  rescue StandardError => e
    Rails.logger.warn e.message
    render json: { message: 'Error on get inventory' }, status: :bad_request
  end
  
  def create
    inventory = Inventory.new inventory_params
    response = if inventory.save
                 inventory
               else
                 inventory.errors.messages
               end
    render json: response, status: :ok
  rescue StandardError => e
    Rails.logger.warn e.message
    render json: { message: 'Error on create inventory' }, status: :bad_request
  end

  def update
    @inventory.update!(inventory_params)
    render json: @inventory, status: :ok
  rescue StandardError => e
    Rails.logger.warn e.message
    render json: { message: 'Error on update inventory' }, status: :bad_request
  end
  
  def destroy
    @inventory.destroy
    render json: { message: 'Inventory deleted' }, status: :ok
  rescue StandardError => e
    Rails.logger.warn e.message
    render json: { message: 'Error on delete inventory' }, status: :bad_request
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name)
  end

  def set_inventory
    @inventory = Inventory.find params[:id]
  end
  
end
