require 'sprockets/asset'
require 'sprockets/errors'
require 'fileutils'
require 'set'
require 'zlib'

module Sprockets
  # `BundledAsset`s are used for files that need to be processed and
  # concatenated with other assets. Use for `.js` and `.css` files.
  class BundledAsset < Asset
    attr_reader :source

    def initialize(environment, logical_path, pathname)
      super(environment, logical_path, pathname)

      @self_asset = environment.find_asset(pathname, :bundle => false)

      @source = ""

      # Explode Asset into parts and gather the dependency bodies
      to_a.each { |dependency| @source << dependency.to_s }

      # Run bundle processors on concatenated source
      context = environment.context_class.new(environment, logical_path, pathname)
      @source = context.evaluate(pathname, :data => @source,
                  :processors => environment.bundle_processors(content_type))

      @mtime  = to_a.map(&:mtime).max
      @length = Rack::Utils.bytesize(source)
      @digest = environment.digest.update(source).hexdigest
    end

    # Initialize `BundledAsset` from serialized `Hash`.
    def init_with(environment, coder)
      super

      @self_asset = environment.find_asset(pathname, :bundle => false)

      if @self_asset.digest != coder['self_digest']
        @self_asset = nil
      end

      @source = coder['source']
    end

    # Serialize custom attributes in `BundledAsset`.
    def encode_with(coder)
      super

      coder['source'] = source
      coder['self_digest'] = @self_asset.digest
    end

    def required_assets
      @self_asset.required_assets
    end

    # Get asset's own processed contents. Excludes any of its required
    # dependencies but does run any processors or engines on the
    # original file.
    def body
      @self_asset.source
    end

    # Return an `Array` of `Asset` files that are declared dependencies.
    def dependencies
      to_a.reject { |a| a.eql?(@self_asset) }
    end

    # Expand asset into an `Array` of parts.
    alias_method :to_a, :required_assets

    # Checks if Asset is stale by comparing the actual mtime and
    # digest to the inmemory model.
    def fresh?(environment)
      @self_asset && @self_asset.fresh?(environment)
    end
  end
end
