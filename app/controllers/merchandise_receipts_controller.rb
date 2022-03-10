class MerchandiseReceiptsController < ApplicationController
  def index
    receipts = MerchandiseReceipt.all
    render json: { response: receipts, count: receipts.count }, status: :ok
  rescue StandardError => e
    Rails.logger.warn e.message
    render json: { message: e.message }, status: :bad_request
  end

  def show
    receipt = MerchandiseReceipt.find params[:id]
    render json: receipt, include: :merchandise_lots, status: :ok
  rescue StandardError => e
    Rails.logger.warn e.message
    render json: { message: e.message }, status: :bad_request
  end

  def create
    receipt = MerchandiseReceipt.new receipt_params
    response = if receipt.save
                 receipt
               else
                 receipt.errors.messages
               end
    render json: response, status: :ok
  rescue StandardError => e
    Rails.logger.warn e.message
    render json: { message: e.message }, status: :bad_request
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
