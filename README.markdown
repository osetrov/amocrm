# Amocrm для Rails

## Установка

добавьте в Gemfile:

    gem 'amocrm'

и запустите `bundle install`.

Затем: `rails g amocrm:install`

В файл `config/amocrm.yml` вставьте ваши данные.

Вы можете изменять `timeout`, `open_timeout`, `faraday_adapter`, `proxy`, `symbolize_keys`, `logger`, и `debug`:

```ruby
Amocrm::Request.timeout = 15
Amocrm::Request.open_timeout = 15
Amocrm::Request.symbolize_keys = true
Amocrm::Request.debug = false
```
в файле `config/initializers/amocrm.rb`

### СПИСКИ
#### Перечень списков
```ruby
  response = Amocrm::Request.catalogs.retrieve
  p(response.body)
```