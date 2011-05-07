# autoload the various classes used in Sprockets
module Sprockets
  autoload :ArgumentError,       "sprockets/errors"
  autoload :AssetPathname,       "sprockets/asset_pathname"
  autoload :ConcatenatedAsset,   "sprockets/concatenated_asset"
  autoload :Concatenation,       "sprockets/concatenation"
  autoload :ContentTypeMismatch, "sprockets/errors"
  autoload :Context,             "sprockets/context"
  autoload :DirectiveProcessor,  "sprockets/directive_processor"
  autoload :Engines,             "sprockets/engines"
  autoload :Environment,         "sprockets/environment"
  autoload :EnvironmentIndex,    "sprockets/environment_index"
  autoload :Error,               "sprockets/errors"
  autoload :FileNotFound,        "sprockets/errors"
  autoload :StaticAsset,         "sprockets/static_asset"
end
