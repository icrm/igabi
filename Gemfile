source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'pg', '0.12.2'
gem 'bootstrap-sass', '2.0.3'
gem 'bcrypt-ruby', '3.0.1'
gem 'jquery-rails', '2.0.0'
gem 'tinymce-rails'
gem 'faker', '1.0.1'
gem 'will_paginate', '3.0.3'
gem 'bootstrap-will_paginate', '0.0.6'


group :development do 
  gem 'annotate', '~> 2.4.1.beta'
end

group :development, :test do
  gem 'rspec-rails', '2.9.0'
  # Automatiza a execucao dos testes executando os mesmos sempre que houver
  # uma alteracao nos arquivos monitorados pelo Guard
  gem 'guard-rspec', '0.5.5'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.4'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'
end

group :test do
  # Capybara usado para facilitar a leitura dos testes
  gem 'capybara', '1.1.2'
  gem 'rb-inotify', '0.8.8'
  gem 'libnotify', '0.5.9'
  # Usuando spork junto do Guard faz com que os testes sejam executados
  # mais rapidamente pois inicia o servidor de testes apenas uma vez
  gem 'guard-spork', '0.3.2'
  gem 'spork', '0.9.0'
  gem 'factory_girl_rails', '1.4.0'
end
