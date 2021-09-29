# frozen_string_literal: true

class Sentence < ApplicationRecord
  has_and_belongs_to_many :entities

  accepts_nested_attributes_for :entities, reject_if: :all_blank, allow_destroy: true
end
