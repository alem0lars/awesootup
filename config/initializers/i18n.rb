TRANSLATION_STORE = Redis.new

# Use the Redis backend for i18n, falling back to yaml files
# Values in yaml files now represent the default values
I18n.backend = I18n::Backend::Chain.new(
  I18n::Backend::KeyValue.new(TRANSLATION_STORE), # Max priority
  I18n.backend                                    # Fallback
)
