class MerchandiseReceiptsController < ApplicationController
  def index
    receipts = MerchandiseReceipt.all
    render json: { response: receipts, count: receipts.count }, status: :ok
  rescue StandardError => e
    Rails.logger.warn e.message
    render json: { message: 'Error on get receipts' }, status: :bad_request
  end

  def show
    receipt = MerchandiseReceipt.find params[:id]
    render json: receipt, status: :ok
  rescue StandardError => e
    Rails.logger.warn e.message
    render json: { message: 'Error on get receipt' }, status: :bad_request
  end

  def create
    receipt = MerchandiseReceipt.create receipt_params
    render json: receipt, status: :ok
  rescue StandardError => e
    Rails.logger.warn e.message
    render json: { message: 'Error on create merchandise receipt' }, status: :bad_request
  end

  private

  def receipt_params
    params.require(:merchandise_receipt).permit(
      :receipt_date, :unit, merchandise_lots_attributes: [
        :name, :height, :unit, :inventory_id
      ]
    )
  end
  
end
