class AboutController < ApplicationController
  def show
    @about = Faker::Hipster.paragraph(4)
  end
end
