require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    it '正しく入力ができていれば登録できる' do
      expect(@user).to be_valid
    end

    it 'メールアドレスが空だと登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it '既に登録されたemailがないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end

    it 'メールアドレスは@を含む必要があること' do
      @user.email = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it 'パスワードが空だと登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'パスワードは6文字以上が必要であること' do
      @user.password = 'aaaaa'
      @user.password_confirmation = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end

    it 'passwordは半角英数字混合での入力が必須であること' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは半角英数字混合で入力してください')
    end

    it 'パスワード（確認）が空だと登録できない' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'passwordとpassword_confirmationの値が一致が必須であること' do
      @user.password = 'abc123'
      @user.password_confirmation = '123abc'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'ニックネームが空だと登録できない' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it '電話番号が空だと登録できない' do
      @user.phone = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("電話番号を入力してください")
    end

    it '電話番号は半角数字のみでないと登録できない' do
      @user.phone = "０９０１２３４５６７８"
      @user.valid?
      expect(@user.errors.full_messages).to include("電話番号を半角数字のみ(10文字から11文字)で入力してください")
    end

    it '電話番号は10文字もしくは11文字でないと登録できない' do
      @user.phone = "090123456789"
      @user.valid?
      expect(@user.errors.full_messages).to include("電話番号を半角数字のみ(10文字から11文字)で入力してください")
    end

    it 'お名前（全角）が空だと登録できない' do
      @user.full_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前を入力してください", "お名前を全角で入力してください")
    end

    it 'お名前（全角）が全角の入力でないと登録できない' do
      @user.full_name = "ﾔﾏﾀﾞﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前を全角で入力してください")
    end

    it 'お名前（全角カナ）が空だと登録できない' do
      @user.full_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前（カナ）を入力してください", "お名前（カナ）を全角（カナ）で入力してください")
    end

    it 'お名前（全角カナ）が全角の入力でないと登録できない' do
      @user.full_name_kana = "ﾔﾏﾀﾞﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前（カナ）を全角（カナ）で入力してください")
    end

    it '生年月日が選択されていないと登録できない' do
      @user.birth_day = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end

    it '性別が選択されていないと登録できない' do
      @user.sex = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("性別を入力してください")
    end

    it '好きなチームが選択されてないと登録できない' do
      @user.team_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("好きなチームを選択してください")
    end
  end
end
