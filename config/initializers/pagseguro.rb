PagSeguro.configure do |config|
  config.token       = ENV.fetch('PAGSEGURO_TOKEN')
  config.email       = ENV.fetch('PAGSEGURO_EMAIL')
  config.encoding    = 'UTF-8' # ou ISO-8859-1. O padrão é UTF-8.
end
