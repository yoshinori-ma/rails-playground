# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, length: { minimum: 2, maximum: 20 }, presence: true
  has_many :posts, dependent: :destroy

  # シンボルで渡した場合、オーバーライドする
  # after_create_commit が実行されない
  # after_create_commit :log_user_saved_to_db
  # after_update_commit :log_user_saved_to_db

  # ブロックで渡した場合、両方実行される
  after_create_commit { log_user_saved_to_db }
  after_update_commit { log_user_saved_to_db }

  private

  def log_user_saved_to_db
    puts 'User was saved to database'
  end
end
