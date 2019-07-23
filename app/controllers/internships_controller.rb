class InternshipsController < ApplicationController
  def index
    @internships = Internship.all
  end
  
  def home
    @internships = Internship.all
  end 

  def show
  end
end
