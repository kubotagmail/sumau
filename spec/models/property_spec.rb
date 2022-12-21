# プロパティーモデルのテスト

require 'rails_helper'

RSpec.describe 'Propertyモデルのテスト', type: :model do



  describe 'アソシエーションのテスト' do

    context 'favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:favarites).macro).to eq :has_many
      end
    end

  end

end