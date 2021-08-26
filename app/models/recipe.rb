class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  include Searchable

end
