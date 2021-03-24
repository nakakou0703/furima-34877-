require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context 'ユーザー登録ができる時' do
      it 'nickname,email,password,password_confirmation,last_name,first_name, last_name_kana,first_name_kane,birthdayが記入されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailは@を含まなければ登録できない' do
        @user.email = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordは英語のみでは登録できない' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordは数字のみでは登録できない" do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordとpassword_confirmationは一致していなければならない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は不正な値です')
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.last_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字は不正な値です')
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）を入力してください")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
      end
      it 'last_name_kanaは全角（カタカナ）での入力でないと登録できない' do
        @user.last_name_kana = "katakana"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）は不正な値です")
      end
      it 'first_name_kanaは全角（カタカナ）での入力でないと登録できない' do
        @user.first_name_kana = "katakana"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）は不正な値です")
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
