require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe 'クレジットカードを使用しての購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buyer_address = FactoryBot.build(:buyer_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '商品購入ができる時' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@buyer_address).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'クレジットカード情報は必須であり、尚且つ正しいクレジットカードの情報で無いときは決済できない' do
        @buyer_address.token = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号は必須である' do
        @buyer_address.postal_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号はハイフンが必須である' do
        @buyer_address.postal_code = '0000000'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県は必須である' do
        @buyer_address.source_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Source can't be blank")
      end
      it '市区町村は必須である' do
        @buyer_address.municipality = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地は必須である' do
        @buyer_address.address = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Address can't be blank")
      end 
      it '電話番号は必須である' do
        @buyer_address.phone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は11桁以内' do
        @buyer_address.phone_number = '000000000000'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号は数値のみ' do
        @buyer_address.phone_number = 'aaaaaaaaaaa'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
