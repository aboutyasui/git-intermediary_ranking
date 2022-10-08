class Admin::ClientsController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_params, only: [:show,:edit, :update]

  def index
    @clients = Client.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end

  def update
    if @client.update(client_params)
      flash[:notice] ="You have updated user successfully."
      redirect_to admin_client_path(@client.id)
    else
      render :edit and return
      #and return = renderの複数使用によるエラーを回避するためのコマンドみたいなもの
    end
  end

  private

  def client_params
    params.require(:client).permit(:email, :name, :client_info, :telephone_number, :work, :is_deleted)
  end

  def find_params
    @client = Client.find(params[:id])
  end

end
