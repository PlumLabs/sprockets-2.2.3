require 'sprockets/engine_pathname'
require 'sprockets/utils'
require 'digest/md5'
require 'time'

module Sprockets
  class StaticAsset
    attr_reader :pathname, :mtime, :length, :digest

    def initialize(pathname)
      @pathname = EnginePathname.new(pathname)

      @mtime  = @pathname.mtime
      @length = @pathname.size

      if digest = Utils.path_fingerprint(@pathname)
        @digest = digest
      else
        @digest = Digest::MD5.hexdigest(pathname.read)
      end
    end

    def content_type
      pathname.content_type
    end

    def stale?
      if Utils.path_fingerprint(pathname)
        false
      else
        mtime < pathname.mtime
      end
    rescue Errno::ENOENT
      true
    end

    def each
      yield pathname.read
    end

    def to_path
      pathname.to_s
    end

    def to_s
      pathname.read
    end

    def eql?(other)
      other.class == self.class &&
        other.pathname == self.pathname &&
        other.mtime == self.mtime &&
        other.digest == self.digest
    end
    alias_method :==, :eql?
  end
end
