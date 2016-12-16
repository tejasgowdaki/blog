class Article < ActiveRecord::Base

	acts_as_paranoid

	belongs_to :user
	has_many :comments#, dependent: :destroy

	has_many :article_categories
	has_many :categories, through: :article_categories

	validates_presence_of :title
	validates_presence_of :body

end
