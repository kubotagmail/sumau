# frozen_string_literal: true

require 'rails_helper'
describe 'モデルのテスト' do
  it "姓、名を登録すると、姓名が取得できること" do
    customer = Customer.new(
            last_name:  "山田",
            first_name: "太郎"
            )
    expect(user.full_name).to eq "山田 太郎"
  end
end

