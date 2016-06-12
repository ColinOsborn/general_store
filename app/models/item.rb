class Item < ActiveRecord::Base
  belongs_to :category
  validates :category, presence: true

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :image_path, presence: true
  # has_attached_file :image_path, styles: {
  # thumb: '100x100>',
  # square: '200x200#',
  # medium: '300x300>',
  # large: '600x600>'
  # }
  #  validates_attachment_content_type :image_path, :content_type => /\Aimage\/.*\Z/

  def self.search(search)
    query = "%#{search}%"
    self.where("title ILIKE ? or description ILIKE ?", query, query)
  end

  def self.featured_home_items(quantity)
    Item.order("RANDOM()").limit(quantity)
  end
end
