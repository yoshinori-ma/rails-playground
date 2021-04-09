# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'callback' do
    context 'after_commit' do
      let(:post) { described_class.new(user: User.new(name: 'user')) }

      it '作成時に after_commit, after_create_commit が呼ばれる' do
        allow(post).to receive(:log)
        post.save!
        expect(post).to have_received(:log).with(:after_commit)
        expect(post).to have_received(:log).with(:after_create_commit)
      end

      it '更新時に after_commit, after_update_commit が呼ばれる' do
        post.save!
        allow(post).to receive(:log)
        post.update!(title: 'title')
        expect(post).to have_received(:log).with(:after_commit)
        expect(post).to have_received(:log).with(:after_update_commit)
      end

      it '削除時に after_commit, after_destroy_commit が呼ばれる' do
        post.save!
        allow(post).to receive(:log)
        post.destroy!
        expect(post).to have_received(:log).with(:after_commit)
        expect(post).to have_received(:log).with(:after_destroy_commit)
      end
    end
  end
end
