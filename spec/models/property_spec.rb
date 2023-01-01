# プロパティーモデルのテスト
require 'rails_helper'

RSpec.describe 'Propertyモデルのテスト', type: :model do

  describe '新規物件情報登録のテスト' do

    context '住所' do
      it '住所を登録すると、住所が取得できること' do
        property = Property.new(
          location: '東京都新宿区新宿1丁目'
          )
        expect(property.location).to eq '東京都新宿区新宿1丁目'
      end
    end
  end

  context '建物名' do
    it '建物名を登録すると建物名が取得できること' do
      property = Property.new(
        name: 'テスト'
        )
      expect(property.name).to eq 'テスト'
    end
  end

  context '価格' do
    it '価格を登録すると価格が取得できること' do
      property = Property.new(
        price: '1234'
        )
        expect(property.price).to eq '1234'
    end
  end

  context '物件メモ' do
    it '物件メモを登録すると物件メモが取得できること' do
      property = Property.new(
        descripion: 'テスト'
        )
        expect(property.description).to eq 'テスト'
    end
  end


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

    context 'property_typeモデルとの関係' do
      it 'N:1となっている' do
        expect(Property.reflect_on_association(:property_type).macro).to eq :belongs_to
      end
    end

    context 'customerモデルとの関係' do
      it 'N:1となっている' do
        expect(Property.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end

  end

end