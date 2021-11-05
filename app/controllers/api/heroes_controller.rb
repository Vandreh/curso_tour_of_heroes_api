class Api::HeroesController < ApplicationController
  include Authenticable

  # before_action :authenticate_with_token, except: %i[index show]
  before_action :authenticate_with_token
  before_action :set_hero, only: %i[show update destroy]

  # GET /heroes
  def index
    @heroes = Hero.by_token(@token).search(params[:term]).sorted_by_name

    # puts "====> #{params}"
    # p "====> TOKEN: #{@token}"
    # logger.debug "====> TOKEN: #{@token}"
    # logger.info "====> TOKEN: #{@token}"

    render json: @heroes
  end

  # GET /heroes/1
  def show
    render json: @hero
  end

  # POST /heroes
  def create
    @hero = Hero.new(hero_params.to_h.merge!({ token: @token }))

    # byebug comandos no terminal, "help", "help list", "list=", "@hero", @token, @hero.persisted? (comando para saber se ja esta gravado no banco), "continue", "next", "@hero.errors", "@hero.errors.messages", "list-", "list=", "continue", "next", "@hero", "@hero.persisted?"

    if @hero.save
      render json: @hero, status: :created, location: api_hero_url(@hero)
    else
      render json: @hero.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /heroes/1
  def update
    if @hero.update(hero_params)
      render json: @hero
    else
      render json: @hero.errors, status: :unprocessable_entity
    end
  end

  # DELETE /heroes/1
  def destroy
    @hero.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_hero
    @hero = Hero.by_token(@token).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def hero_params
    params.require(:hero).permit(:name)
  end
end
