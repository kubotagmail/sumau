# カスタマーモデルのテスト
# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Customerモデルのテスト', type: :model do

  describe '新規会員登録のテスト' do

    context '姓名' do
      it "姓、名を登録すると、姓名が取得できること" do
        customer = Customer.new(
          last_name: "山田",
          first_name: "太郎"
          )
        expect(customer.last_name + customer.first_name).to eq "山田太郎"
      end
    end

    context 'フリガナ(姓)、フリガナ(名)' do
      it 'フリガナ(姓)、フリガナ(名)を登録するとフリガナ(姓)、フリガナ(名)が取得できること' do
        customer = Customer.new(
          last_name_kana: "ヤマダ",
          first_name_kana: "タロウ"
          )
        expect(customer.last_name_kana + customer.first_name_kana).to eq "ヤマダタロウ"
      end
    end

    context '郵便番号' do
      it '郵便番号を登録すると、郵便番号が取得できること' do
        customer = Customer.new(
          postal_code: "1234567"
          )
        expect(customer.postal_code).to eq "1234567"
      end
    end

    context '住所' do
      it '住所を登録すると、住所が取得できること' do
        customer = Customer.new(
          address: '東京都新宿区新宿1丁目1-11テストマンション1501号室'
          )
        expect(customer.address).to eq '東京都新宿区新宿1丁目1-11テストマンション1501号室'
      end
    end

    context '電話番号' do
      it '電話番号を登録すると、電話番号が取得できること' do
        customer = Customer.new(
          telephone_number: '09012345678'
          )
        expect(customer.telephone_number).to eq '09012345678'
      end
    end
  end

  describe 'バリデーションのテスト' do
    subject { customer.valid? }

    let!(:other_customer) { create(:customer) }
    let(:customer) { build(:customer) }

    context 'last_nameカラム' do
      it '姓が空欄でないこと' do
        customer.last_name = ''
        #customer.valid?
        #expect(customer.errors[:last_name].join).to include("文字以上")
        is_expected.to eq  false
      end
      it '姓が1文字以上であること: 0文字は×' do
        customer.last_name = Faker::Lorem.characters(number: 0)
        is_expected.to eq false
      end
      it '姓が1文字以上であること: 1文字は◯' do
        customer.last_name = Faker::Lorem.characters(number: 1)
        is_expected.to eq true
      end
    end

    context 'first_nameカラム' do
      it '名が空欄でないこと' do
        customer.first_name = ''
        is_expected.to eq false
      end
      it '名が1文字以上であること: 0文字は×' do
        customer.first_name = Faker::Lorem.characters(number: 0)
        is_expected.to eq false
      end
      it '名が1文字以上であること: 1文字は○' do
        customer.first_name = Faker::Lorem.characters(number: 1)
        is_expected.to eq true
      end
    end

    context 'postal_codeカラム' do
      it '郵便番号が空欄でないこと' do
        customer.postal_code = ''
        is_expected.to eq false
      end
      it '郵便番号が半角数字であること: 全角数字は×' do
        customer.postal_code = '１２３４５６７'
        is_expected.to eq false
      end
      it '郵便番号が半角数字であること: 半角英字は×' do
        customer.postal_code = 'abcdefg'
        is_expected.to eq false
      end
      it '郵便番号が半角数字であること: 半角数字は○' do
        customer.postal_code = '0123456789'
        is_expected.to eq true
      end
    end

  end

  describe 'アソシエーションのテスト' do

    context 'propertyモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:properties).macro).to eq :has_many
      end
    end
    context 'favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end

  end


end


