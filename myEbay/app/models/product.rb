class Product < ActiveRecord::Base
    searchkick
    belongs_to :user
    belongs_to :category

    has_many :reviews
    attr_accessor :image

    after_save :save_product_image, if: :image

    def save_product_image
        filename = image.original_filename
        folder = "public/assets/images/products/#{id}"

        FileUtils::mkdir_p folder
        f = File.open File.join(folder, filename), "wb"
        f.write image.read()
        f.close

        self.image = nil
        update image_filename: filename
    end
end
