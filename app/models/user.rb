# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, length: { minimum: 2, maximum: 20 }, presence: true
  has_many :posts, dependent: :destroy
end
