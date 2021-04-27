require 'rails_helper'

RSpec.describe RecipeHowtomake, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @recipe_howtomake = FactoryBot.build(:recipe_howtomake, user_id: @user.id)
    @recipe_howtomake.image = fixture_file_upload('public/images/test_image.jpg')
  end

  describe '#new' do
    context 'レシピが保存できる場合' do
      it 'nameとchach_copyとpointとupbringingとmanyとpriceとmaterial_nameとquantityとmaterial_priceとtextとimageが存在すれば保存できること' do
        expect(@recipe_howtomake).to be_valid
      end
    end

    context 'レシピが保存できない場合' do
      it 'nameが空だと保存できないこと' do
        @recipe_howtomake.name = nil
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Name can't be blank")
      end
      
      it 'chach_copyが空だと保存できないこと' do
        @recipe_howtomake.chach_copy = nil
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Chach copy can't be blank")
      end

      it 'pointが空だと保存できないこと' do
        @recipe_howtomake.point = nil
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Point can't be blank")
      end

      it 'upbringingが空だと保存できないこと' do
        @recipe_howtomake.upbringing = nil
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Upbringing can't be blank")
      end

      it 'manyが空だと保存できないこと' do
        @recipe_howtomake.many = nil
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Many can't be blank")
      end

      it 'manyが全角数字である場合は保存できないこと' do
        @recipe_howtomake.many = '１１１１'
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Many is invalid")
      end

      it 'manyが半角英数字混合である場合は保存できないこと' do
        @recipe_howtomake.many = '11aa'
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Many is invalid")
      end

      it 'manyが半角英語である場合は保存できないこと' do
        @recipe_howtomake.many = 'aaaa'
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Many is invalid")
      end

      it 'manyが漢数字では保存できないこと' do
        @recipe_howtomake.many = '一二三四'
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Many is invalid")
      end

      it 'priceが空だと保存できないこと' do
        @recipe_howtomake.price = nil
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが全角数字である場合は保存できないこと' do
        @recipe_howtomake.price = '１１１１'
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Price is invalid")
      end

      it 'price半角英数字混合である場合は保存できないこと' do
        @recipe_howtomake.price = '11aa'
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Price is invalid")
      end

      it 'priceが半角英語である場合は保存できないこと' do
        @recipe_howtomake.price = 'aaaa'
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Price is invalid")
      end

      it 'priceが漢数字では保存できないこと' do
        @recipe_howtomake.price = '一二三四'
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Price is invalid")
      end

      it 'material_nameが空だと保存できないこと' do
        @recipe_howtomake.material_name = nil
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Material name can't be blank")
      end

      it 'quantityが空だと保存できないこと' do
        @recipe_howtomake.quantity = nil
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Quantity can't be blank")
      end

      it 'material_priceが空だと保存できないこと' do
        @recipe_howtomake.material_price = nil
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Material price can't be blank")
      end

      it 'material_priceが全角数字である場合は保存できないこと' do
        @recipe_howtomake.material_price = '１１１１'
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Material price is invalid")
      end

      it 'material_priceが半角英数字混合である場合は保存できないこと' do
        @recipe_howtomake.material_price = '11aa'
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Material price is invalid")
      end

      it 'material_priceが半角英語である場合は保存できないこと' do
        @recipe_howtomake.material_price = 'aaaa'
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Material price is invalid")
      end

      it 'material_priceが漢数字では保存できないこと' do
        @recipe_howtomake.material_price = '一二三四'
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Material price is invalid")
      end

      it 'textが空だと保存できないこと' do
        @recipe_howtomake.text = nil
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Text can't be blank")
      end

      it 'userが紐づいていない場合は保存できないこと' do
        @recipe_howtomake = build(:recipe_howtomake, user_id: nil)
        @recipe_howtomake.valid?
        expect(@recipe_howtomake).not_to be_valid
      end

      it 'imageが空だと保存できないこと' do
        @recipe_howtomake.image = nil
        @recipe_howtomake.valid?
        expect(@recipe_howtomake.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end