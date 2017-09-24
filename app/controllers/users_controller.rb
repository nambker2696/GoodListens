class UsersController < ApplicationController
  before_action :find_user, only: %i(show)

  attr_reader :user

  def show
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
  end
end