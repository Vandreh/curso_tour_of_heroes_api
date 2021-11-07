require 'rails_helper'

RSpec.describe Hero, type: :model do
  let(:name) { 'wonder woman' }
  let(:token) { '1234567890' }
  subject { Hero.new(name: 'Zatanna', token: token) }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:token) }
    it { should validate_length_of(:token).is_at_least(10) }
    it { should validate_uniqueness_of(:name).scoped_to(:token).case_insensitive }
    # it 'Cria um hero válido' do
    #   hero = Hero.new(name: 'Xuxa', token: '1')
    #   expect(hero).to be_valid
    # end
    # it 'Não é valido sem o nome' do
    #   hero = Hero.new( token: '1')
    #   expect(hero).not_to be_valid
    # end
  end

  describe 'scopes' do
    it '.by_token' do
      expect(Hero.where(token: token).to_sql).to eq Hero.by_token(token).to_sql
    end
    it '.search' do
      expect(Hero.where('LOWER(name) LIKE ?', "%#{name.downcase}%").to_sql).to eq Hero.search(name).to_sql
    end
    it '.sorted_by_name' do
      expect(Hero.order(name: :desc).to_sql).to eq Hero.sorted_by_name.to_sql
    end
  end

end
