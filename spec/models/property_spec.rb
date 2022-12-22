# プロパティーモデルのテスト

require 'rails_helper'

RSpec.describe 'Propertyモデルのテスト', type: :model do



  describe 'アソシエーションのテスト' do

    context 'favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Property.reflect_on_association(:favarites).macro).to eq :has_many
      end
    end

    context 'floor_planモデルとの関係' do
      it 'N:1となっている' do
        expect(Property.reflect_on_association(:floor_plan).macro).to eq :belongs_to
      end
    end

  end

end