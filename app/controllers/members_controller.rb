class MembersController < ApplicationController
  def index
    @members = Member.all
    render :index
  end

  def show
    @member = Member.find_by(id: params[:id])
    render :show
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

  def destroy
    @member = Member.find_by(id: params[:id])
    @member.destroy
    render json: { message: "Member removed successfully."}
  end
end
