require 'sprockets/compressor'
require 'rack/mime'
require 'tilt'

module Sprockets
  module Processing
    def mime_types(ext = nil)
      if ext.nil?
        Rack::Mime::MIME_TYPES.merge(@mime_types)
      else
        ext = normalize_extension(ext)
        @mime_types[ext] || Rack::Mime::MIME_TYPES[ext]
      end
    end

    def register_mime_type(mime_type, ext)
      expire_index!
      ext = normalize_extension(ext)
      @trail.extensions << ext
      @mime_types[ext] = mime_type
    end

    def formats(ext = nil)
      if ext
        @formats[normalize_extension(ext)].dup
      else
        deep_copy_hash(@formats)
      end
    end

    def format_extensions
      @formats.keys
    end

    def register_format(ext, klass)
      expire_index!
      ext = normalize_extension(ext)
      @trail.extensions << ext
      @formats[ext].push(klass)
    end

    def unregister_format(ext, klass)
      expire_index!
      @formats[normalize_extension(ext)].delete(klass)
    end

    def engines(ext = nil)
      if ext
        ext = normalize_extension(ext)
        @engines[ext] || Tilt[ext]
      else
        @engines.dup
      end
    end

    def engine_extensions
      @engines.keys
    end

    def register_engine(ext, klass)
      expire_index!
      ext = normalize_extension(ext)
      @trail.extensions << ext
      @engines[ext] = klass
    end

    def bundle_processors(mime_type = nil)
      if mime_type
        @bundle_processors[mime_type].dup
      else
        deep_copy_hash(@bundle_processors)
      end
    end

    def register_bundle_processor(mime_type, klass)
      expire_index!
      @bundle_processors[mime_type].push(klass)
    end

    def unregister_bundle_processor(mime_type, klass)
      expire_index!
      @bundle_processors[mime_type].delete(klass)
    end

    def css_compressor
      bundle_processors('text/css').detect { |klass|
        klass.respond_to?(:name) &&
          klass.name == 'Sprockets::Compressor'
      }
    end

    def css_compressor=(compressor)
      expire_index!

      if old_compressor = css_compressor
        unregister_bundle_processor 'text/css', old_compressor
      end

      if compressor
        klass = Class.new(Compressor) do
          @compressor = compressor
        end

        register_bundle_processor 'text/css', klass
      end
    end

    def js_compressor
      bundle_processors('application/javascript').detect { |klass|
        klass.respond_to?(:name) &&
          klass.name == 'Sprockets::Compressor'
      }
    end

    def js_compressor=(compressor)
      expire_index!

      if old_compressor = js_compressor
        unregister_bundle_processor 'application/javascript', old_compressor
      end

      if compressor
        klass = Class.new(Compressor) do
          @compressor = compressor
        end

        register_bundle_processor 'application/javascript', klass
      end
    end

    private
      def deep_copy_hash(hash)
        initial = Hash.new { |h, k| h[k] = [] }
        hash.inject(initial) { |h, (k, a)| h[k] = a.dup; h }
      end

      def normalize_extension(extension)
        extension = extension.to_s
        if extension[/^\./]
          extension
        else
          ".#{extension}"
        end
      end
  end
end
