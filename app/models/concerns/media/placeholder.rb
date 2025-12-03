module Media
  module Placeholder
    extend ActiveSupport::Concern
    included do
      def overlay_color
        '#002743'
      end

      def blend_mode
        'multiply'
      end

      def blend_opacity
        '0.5'
      end

      def src
        image_src.prepend('/')
      end

      # def icon
      #   '♥️'
      # end

      def image_src
        has_image? ? image_path : placeholder_path
      end

      def has_image?
        # true
        puts " File.exist? #{image_file_path} => #{File.exist? image_file_path}"
        File.exist? image_file_path
      end

      def placeholder_path
        'images/fpo/placeholder.jpg'
      end

      def image_path
        "images/#{directory_path}/#{image_filename}#{image_suffix}.jpg"
      end

      def directory_path
        self.class.to_s.tableize
      end

      def image_filename
        permalink
      end

      def image_suffix
        # toplevel_page? ? '-bw' : ''
      end

      def toplevel_page?
        respond_to?(:level) ? level < 2 : false
      end

      def image_file_path
        "#{Rails.root}/public/#{image_path}"
      end
    end
  end
end
