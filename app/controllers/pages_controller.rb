class PagesController < ApplicationController
  skip_before_action :require_student

  def about
  end
end
