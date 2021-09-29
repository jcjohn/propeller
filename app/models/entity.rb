# frozen_string_literal: true

class Entity < ApplicationRecord
    self.inheritance_column = :_type_disabled
  has_and_belongs_to_many :sentences
end
