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
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it "nameが空だと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "textが空だと登録できない" do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("詳細を入力してください")
      end
      it "categoryが--だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end
      it "conditionが--だと登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
      end
      it "chargeが--だと登録できない" do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
      end
      it "ship_dayが--だと登録できない" do
        @item.ship_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
      end
      it "sourceが--だと登録できない" do
        @item.source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は1以外の値にしてください")
      end
      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("値段を入力してください")
      end
      it "priceが¥299以下の場合は保存できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は一覧にありません")
      end
      it "priceが¥10000000以上の場合は保存できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は一覧にありません")
      end
      it "priceは全角文字では登録できない" do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は一覧にありません")
      end
      it "priceは半角英数混合では登録できない" do
        @item.price = 'aA11'
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は一覧にありません")
      end
      it "priceは半角英語だけでは登録できない" do
        @item.price = 'aaAA'
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は一覧にありません")
      end
      it 'userが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end

    end

  end
end
