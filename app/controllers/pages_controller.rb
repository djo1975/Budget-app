class PagesController < ApplicationController
  include Devise::Controllers::Helpers

  def splash
    render 'splash'
  end
end
