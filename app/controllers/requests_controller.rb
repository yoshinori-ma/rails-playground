class RequestsController < ApplicationController

  # GET /request/new
  def new
    @plan = Plan.find_by(uuid: params[:plan_uuid])
    # render json: @plan
  end

  # GET /request
  def show
    render json: @request
  end

  # POST /request
  def create
    @plan = Plan.find_by(uuid: params[:plan_uuid])
    # user = User.create(name: @plan.uuid)

    render :new

    # if user.save
    #   redirect_to 'https://www.how-ma.com'
    # else
    #   render :new
    # end
  end

  # PATCH/PUT /request
  def update
    if @request.update(request_params)
      render json: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /request
  def destroy
    @request.destroy
  end

  private

  # Only allow a list of trusted parameters through.
  def request_params
    params.fetch(:request, {})
  end
end
