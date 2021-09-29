# frozen_string_literal: true

class SentencesController < ApplicationController
  before_action :set_sentence, only: %i[show edit update destroy]
  
  def index
    @sentences = Sentence.includes(:entities).all
  end

  def show
  end

  def edit
  end

  def new
    @sentence = Sentence.new
  end

  def create
    @sentence = Sentence.new(sentence_params)
    @sentence.save!
    redirect_to :index
  end

  def update
    @sentence.update!(sentence_params)
    redirect_to :show
  end

  def destroy
    @sentence.destroy!
    redirect_to :index
  end

  private

  def set_sentence
    @sentence = Sentence.find(params[:id])
  end

  def sentence_params
    params.require(:sentence).permit(:words, entities_attributes: [:text, :type, :_destroy])
  end
end
