require 'rails_helper'
describe User do
  before do
      @user = FactoryBot.build(:user)
  end

    describe 'ユーザー新規登録' do
      context "新規登録がうまくいく時" do
        it "nickname,email,password,password_confirmation,first_name,family_name,first_name_kana,family_name,birth_dayが存在すれば登録できること" do
          expect(@user).to be_valid
        end
      end


      context "新規登録がうまく行かない時" do
        it "nicknameが空だと登録できない" do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "emailが空だと登録できない" do
          @user.email = nil 
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "emailには@を含めなければ登録できない" do 
           @user.email = "tarou.tanaka.gamil.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it "重複したemailがすでに存在するばいい登録できない" do 
          @user.save 
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken") 
        end
        it "passwordが空だと保存できない" do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")  
        end
        it "passwrodに半角数字混合で入力しなければ登録できない" do 
          @user.password = "123456"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
        end
        it "passwordとpassword_confirmationが不一致だと保存できない" do
         @user.password = "a12345"
         @user.password_confirmation = "a123456"
         @user.valid?
         expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "first_nameが空だと保存できない" do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")  
        end
        it "first_nameが全角文字でなければ保存できない" do
          @user.first_name = "tanaka"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name Full-width characters")  
        end
        it "family_nameが空だと保存できない" do
          @user.family_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")  
        end
        it "family_nameが全角文字でなければ保存できない" do
          @user.family_name = "tarou"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name Full-width characters")  
        end
        it "first_name_kanaが空だと保存できない" do
          @user.first_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")  
        end
        it "first_name_kanaが空全角カナでなければ保存できない" do
          @user.first_name_kana = "太郎"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")  
        end                                             
        it "family_name_kanaが空だと保存できない" do
          @user.family_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana can't be blank")  
        end
        it "family_name_kanaが空全角カナでなければ保存できない" do
          @user.family_name_kana = "田中"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana Full-width katakana characters")  
        end  
        it "birth_dayが空だと保存できない" do
          @user.birth_day = nil 
          @user.valid? 
          expect(@user.errors.full_messages).to include("Birth day can't be blank")
        end
        
       
        
      end

    end
end
