# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string(255)      not null
#  name            :string(255)      not null
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = create(:user)
  end

  describe 'バリデーションが効くかを確認' do
    context '問題ない場合' do
      it 'nameとemailにあれば問題ない' do
        expect(@user).to be_valid
      end
    end

    context '問題がある場合' do
      it 'nameが51文字ではじかれる' do
        @user.name = 'a' * 51
        expect(@user).not_to be_valid
      end
      it 'emailが256文字ではじかれる' do
        @user.email = 'a' * 256
        expect(@user).not_to be_valid
      end
      it 'emailが255文字以内だがフォーマットがおかしいのではじかれる' do
        @user.email = 'samplesample@com'
        expect(@user).not_to be_valid
      end
    end
  end
end
