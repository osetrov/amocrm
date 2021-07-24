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

## Списки

### Добавление, обновление и удаление списков
#### Добавление
```ruby
items = [
  {
    name: "Товары"
  }
]
body = {
  add: items
}
response = AmocrmRails::Request.catalogs.create(body: body)
items.map!.with_index { |item, index| item.merge(response.body[:_embedded][:items][index]) }
```
#### Обновление
```
items.each do |item| 
  item[:name].insert(-1, ' updated')
  item.delete(:_links)
end

body = {
   update: items
}
response = AmocrmRails::Request.catalogs.create(body: body)
item_ids = response.body[:_embedded][:items].map{ |item| item[:id] }
```

#### Удаление
```
🤦🤦🤦
body = "{\"delete\": [{#{item_ids.join(',')}]}"
AmocrmRails::Request.catalogs.create(body: body)
```

### Перечень списков
```ruby
response = AmocrmRails::Request.catalogs.retrieve
p(response.body)
item_ids = response.body[:_embedded][:items].map{|item| item[:id]}
```

## Методы элементов списка

### Добавление, обновление и удаление элементов списка

#### Добавление элементов
```ruby
body = {
   add: [
      {
         catalog_id: item_ids.first,
         name: "Карандаш"
      }
   ]
}
response = AmocrmRails::Request.catalog_elements.create(body: body)
p(response.body)
catalog_element_ids = response.body[:_embedded][:items].map{|item| item[:id]}
```

#### Обновление элементов
```ruby
body = {
  update: [
      {
         catalog_id: item_ids.first,
         id: catalog_element_ids.first,
         name: "Ручка"
      }
   ]
}
response = AmocrmRails::Request.catalog_elements.create(body: body)
p(response.body)
```

#### Удаление элементов

```ruby
body = {
  delete: [catalog_element_ids.first]
}
response = AmocrmRails::Request.catalog_elements.create(body: body)
p(response.body)
```

### Перечень элементов списка

```ruby
params = {
  catalog_id: item_ids.first
}
response = AmocrmRails::Request.catalog_elements.retrieve(params: params)
p(response.body)
items = response.body[:_embedded][:items]
```

## Товары

### Включение функционала

```ruby
body = {
  enabled: true
}
response = AmocrmRails::Request.products_settings.create(body: body)
p(response.body)
catalog_product_id = response.body[:catalog_id]
```

### Статус активности функционала

```ruby
response = AmocrmRails::Request.products_settings.retrieve
p(response.body)
```