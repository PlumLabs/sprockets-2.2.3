# autoload the various classes used in Sprockets
module Sprockets
  autoload :ArgumentError,       "sprockets/errors"
  autoload :AssetPathname,       "sprockets/asset_pathname"
  autoload :Compressor,          "sprockets/compressor"
  autoload :ConcatenatedAsset,   "sprockets/concatenated_asset"
  autoload :Concatenation,       "sprockets/concatenation"
  autoload :ContentTypeMismatch, "sprockets/errors"
  autoload :Context,             "sprockets/context"
  autoload :DirectiveProcessor,  "sprockets/directive_processor"
  autoload :Environment,         "sprockets/environment"
  autoload :EnvironmentIndex,    "sprockets/environment_index"
  autoload :Error,               "sprockets/errors"
  autoload :FileNotFound,        "sprockets/errors"
  autoload :Processing,          "sprockets/processing"
  autoload :StaticAsset,         "sprockets/static_asset"
  autoload :StaticCompilation,   "sprockets/static_compilation"
end
