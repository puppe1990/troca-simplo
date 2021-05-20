class OrderChangesController < ApplicationController
  before_action :set_order_change, only: %i[show edit update destroy]

  # GET /order_changes or /order_changes.json
  def index
    @order_changes = OrderChange.all
  end

  # GET /order_changes/1 or /order_changes/1.json
  def show; end

  # GET /order_changes/new
  def new
    @order_change = OrderChange.new
  end

  # GET /order_changes/1/edit
  def edit; end

  # POST /order_changes or /order_changes.json
  def create
    @order_change = OrderChange.new(order_change_params)

    respond_to do |format|
      if @order_change.save
        format.html { redirect_to @order_change, notice: 'Order change was successfully created.' }
        format.json { render :show, status: :created, location: @order_change }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_change.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_changes/1 or /order_changes/1.json
  def update
    respond_to do |format|
      if @order_change.update(order_change_params)
        format.html { redirect_to @order_change, notice: 'Order change was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_change }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_change.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_changes/1 or /order_changes/1.json
  def destroy
    @order_change.destroy
    respond_to do |format|
      format.html { redirect_to order_changes_url, notice: 'Order change was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order_change
    @order_change = OrderChange.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_change_params
    params.require(:order_change).permit(:status)
  end
end
