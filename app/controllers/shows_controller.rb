# frozen_string_literal: true

class ShowsController < ApplicationController
  before_action :fetch_show, only: %i[remove_to_favorite add_to_favorite]
  def index
    @shows = Show.includes(:channel).all
  end

  def favorites
    @shows = current_user.favorite_shows
  end

  def search
    @shows = Show.includes(:channel).where('name ilike ?', "%#{params[:keyword]}%")
    render 'index'
  end

  def add_to_favorite
    current_user.favorite_shows.push(@show) unless current_user.favorite_shows.where(id: @show.id).exists?
    redirect_to favorites_shows_path
  end

  def remove_to_favorite
    current_user.favorite_shows.delete(@show) if current_user.favorite_shows.where(id: @show.id).exists?
    redirect_to favorites_shows_path
  end

  private

  def fetch_show
    @show = Show.find_by(id: params[:id])
  end
end
