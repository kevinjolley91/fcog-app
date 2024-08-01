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

  def update
    @member = Member.find_by(id: params[:id])
    @member.update(
      name: params[:name] || @member.name,
      phone_number: params[:phone_number] || @member.phone_number,
      position: params[:position] || @member.position,
    )
    render :show
  end  
end
