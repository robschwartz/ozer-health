# config/initializers/recaptcha.rb
Recaptcha.configure do |config|
  config.site_key  = '6Lf3YpsUAAAAAKuZdk2T4T5_8rdOwcZp-obht-lm'
  config.secret_key = '6Lf3YpsUAAAAAGQYHyruHLd3QKRU7xfshNUqZKo6'
  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
end