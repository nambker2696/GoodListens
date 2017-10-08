class UsersController < ApplicationController
  before_action :find_user, only: %i(show)

  attr_reader :user, :reviews, :bookmarks

  def show
    active_rela = current_user.active_relationships
    @relationship_build = active_rela.build
    @relationship_destroy = active_rela.find_by followed_id: @user.id
    @reviews = user.reviews
    @bookmarks = user.bookmarks
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
  end
end
