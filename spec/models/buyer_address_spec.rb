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
      it 'building_nameが空でも保存できる' do
        @buyer_address.building_name = ''
        expect(@buyer_address).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'クレジットカード情報は必須であり、尚且つ正しいクレジットカードの情報で無いときは決済できない' do
        @buyer_address.token = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it '郵便番号は必須である' do
        @buyer_address.postal_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号はハイフンが必須である' do
        @buyer_address.postal_code = '0000000'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '都道府県は必須である' do
        @buyer_address.source_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it '市区町村は必須である' do
        @buyer_address.municipality = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地は必須である' do
        @buyer_address.address = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("番地を入力してください")
      end 
      it '電話番号は必須である' do
        @buyer_address.phone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号は11桁以内' do
        @buyer_address.phone_number = '000000000000'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号は数値のみ' do
        @buyer_address.phone_number = 'aaaaaaaaaaa'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'user_idは必須である' do
        @buyer_address.user_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idは必須である' do
        @buyer_address.item_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
