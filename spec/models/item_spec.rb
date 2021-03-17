require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報登録' do

    context '商品情報登録ができる時' do
      it "image,name,text,category_id,condition_id,charge_id,source_id,ship_day_id,priceが記入されていれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品情報登録ができない時' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "textが空だと登録できない" do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "categoryが--だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "conditionが--だと登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "chargeが--だと登録できない" do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge must be other than 1")
      end
      it "ship_dayが--だと登録できない" do
        @item.ship_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day must be other than 1")
      end
      it "sourceが--だと登録できない" do
        @item.source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Source must be other than 1")
      end
      it "priceが空と登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not included in the list")
      end
      it "priceが¥299以下の場合は保存できない" do
        @item.price = '298'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが¥10000000以上の場合は保存できない" do
        @item.price = '10000001'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceは半角数字以外は登録できない" do
        @item.price = 'あア亜aA'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'userが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

    end

  end
end
