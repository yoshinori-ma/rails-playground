# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    describe 'name' do
      subject { described_class.new }

      let!(:user) { described_class.new }

      context 'presence' do
        it { is_expected.to validate_presence_of(:name) }
      end

      context 'length' do
        it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(20) }
      end

      context 'length validator' do
        context 'for a short name' do
          before do
            user.name = 'a'
          end

          it 'is invalid' do
            expect(user).not_to be_valid
          end
        end
      end
    end
  end
end
