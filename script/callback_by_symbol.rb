# frozen_string_literal: true

ActiveRecord::Migration[6.1].new
                            .create_table :cats, &:timestamps

class Cat < ApplicationRecord
  after_create_commit :log_cat_saved_to_db
  after_update_commit :log_cat_saved_to_db

  private

  def log_cat_saved_to_db
    puts 'Cat was saved to database'
  end
end

puts 'create start'
# 何も出力されない
cat = Cat.create
puts 'create end'

puts 'update start'
# catを更新する
cat.save
puts 'update end'

ActiveRecord::Migration[6.1].new.drop_table :cats
