class MembersController < ApplicationController
  def index
    @members = Member.all
    render :index
  end

  def create
    @member = Member.create(
      name: params[:name],
      phone_number: params[:phone_number],
      position: params[:position],
    )
    render :show
  end
end
