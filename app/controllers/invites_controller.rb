class InvitesController < ApplicationController
  def create
    render json: true, status: 200
  end
end