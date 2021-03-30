# frozen_string_literal: true

class ApplicationController < ActionController::API
  def hoge
    Time.now
  end
end
