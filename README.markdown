# Amocrm для Rails

## Установка

добавьте в Gemfile:

    gem 'amocrm-rails'

и запустите `bundle install`.

Затем: `rails g amocrm_rails:install`

В файл `config/amocrm.yml` вставьте ваши данные.

Вы можете изменять `timeout`, `open_timeout`, `faraday_adapter`, `proxy`, `symbolize_keys`, `logger`, и `debug`:

```ruby
AmocrmRals::Request.timeout = 15
AmocrmRals::Request.open_timeout = 15
AmocrmRals::Request.symbolize_keys = true
AmocrmRals::Request.debug = false
```
в файле `config/initializers/amocrm.rb`

### СПИСКИ

#### Добавление, обновление и удаление списков
##### Добавление
```ruby
body = {
  add: [
    {
      name: "Товары"
    }
  ]
}
response = AmocrmRails::Request.catalogs.create(body: body)
p(response.body)
```

#### Перечень списков
```ruby
  response = AmocrmRails::Request.catalogs.retrieve
  p(response.body)
```