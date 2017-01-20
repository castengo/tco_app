class StaticPagesController < ApplicationController
  before_action :start_edmund
  respond_to :html, :js

  attr_accessor :edmund

  def index
    @makes = Make.all
  end
  # @test = JSON.parse(edmund.tco_models('200000001').body)["models"]

  # response
  # "a3:Sedan"=>
  # {"id"=>"Audi_A3",
  #  "name"=>"A3 Sedan",
  #  "submodel"=>"Sedan",
  #  "nicesubmodel"=>"sedan",
  #  "model"=>"A3",
  #  "nicemodel"=>"a3",
  #  "link"=>"/audi/a3",
  #  "years"=>{"NEW"=>[2017], "NEW_USED"=>[2016], "USED"=>[2015]}},
  def models
    make_id = params[:make_id]
    models_json = @edmund.tco_models(make_id)
  end

  # https://api.edmunds.com/api/vehicle/v2/honda/civic?state=used&fmt=json&api_key={api key}
  def styles
  end

  private

  def start_edmund
    @edmund = Edmund.new
  end
end
