class Post < ApplicationRecord
  has_one_attached :image
  validates :image, presence: true

  def image_check
    descriptions = GoogleCloudVision.new(image).request
    parse_result(descriptions)
  end

  def parse_result(descriptions)
    {
      descriptions: descriptions
    }
  end
end
