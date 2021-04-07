require 'rails_helper'

RSpec.describe Dinner, type: :model do
  before do
    @dinner = FactoryBot.build(:dinner)
  end

  describe '新規recordの登録' do
    context '新規recordの登録ができるとき' do
      it 'image,impression,cookdayが存在すれば登録できる' do
        expect(@dinner).to be_valid
      end
    end
    context '新規recordの登録ができないとき' do
      it 'imageが存在しない時登録できない' do
        @dinner.image = nil
        @dinner.valid?
        expect(@dinner.errors.full_messages).to include("Image can't be blank")
      end
      it 'impressionが存在しない時登録できない' do
        @dinner.impression = nil
        @dinner.valid?
        expect(@dinner.errors.full_messages).to include("Impression can't be blank")
      end
      it 'cookdayが存在しない時登録できない' do
          @dinner.cookday = nil
          @dinner.valid?
          expect(@dinner.errors.full_messages).to include("Cookday can't be blank")
      end
    end
  end
end
