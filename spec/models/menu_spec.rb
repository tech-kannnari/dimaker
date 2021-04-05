require 'rails_helper'

RSpec.describe Menu, type: :model do
  before do
    @menu = FactoryBot.build(:menu)
  end


  describe '新規レシピ登録' do
    context '新規レシピ登録できるとき' do
      it 'main_name,salad_name, soup_nameが存在すれば登録できる' do
        expect(@menu).to be_valid
      end
    end

    context '新規レシピ登録できないとき' do
      it 'main_nameが存在しない時登録できない' do
        @menu.main_name = ''
        @menu.valid?
        expect(@menu.errors.full_messages).to include("Main name can't be blank")
      end
      it 'salad_nameが存在しない時登録できない' do
        @menu.salad_name = ''
        @menu.valid?
        expect(@menu.errors.full_messages).to include("Salad name can't be blank")
      end
      it 'soup_nameが存在しない時登録できない' do
        @menu.soup_name = ''
        @menu.valid?
        expect(@menu.errors.full_messages).to include("Soup name can't be blank")
      end
    end
  end
end