class AboutController < ApplicationController
  def index
    @about = Faker::Hipster.paragraph(4)
  end
end
