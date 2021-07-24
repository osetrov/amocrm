# Amocrm для Rails

## Установка

добавьте в Gemfile:

    gem 'amocrm-rails'

и запустите `bundle install`.

Затем: `rails g amocrm_rails:install`

В файл `config/amocrm.yml` вставьте ваши данные.

Вы можете изменять `timeout`, `open_timeout`, `faraday_adapter`, `proxy`, `symbolize_keys`, `logger`, и `debug`:

```ruby
AmocrmRails::Request.timeout = 15
AmocrmRails::Request.open_timeout = 15
AmocrmRails::Request.symbolize_keys = true
AmocrmRails::Request.debug = false
```
в файле `config/initializers/amocrm.rb`

## Параметры аккаунта
```ruby
params = {
  with: 'amojo_id,amojo_rights,users_groups,task_types,version,entity_names,datetime_settings'
}
response = AmocrmRails::Request.account.retrieve(params: params)
p(response.body)
```

## Сделки
### [Список сделок](https://www.amocrm.ru/developers/content/crm_platform/leads-api)

```ruby
params = {
  with: 'catalog_elements',
  page: 0,
  limit: 10
}
response = AmocrmRails::Request.leads.retrieve(params: params)
p(response.body)
leads = response.body[:_embedded][:leads]
lead_id = leads.first[:id]
```
### [Получение сделки по ID](https://www.amocrm.ru/developers/content/crm_platform/leads-api#lead-detail)

```ruby
params = {
  with: 'catalog_elements'
}
response = AmocrmRails::Request.leads(lead_id).retrieve(params: params)
p(response.body)
```
### [Добавление сделок](https://www.amocrm.ru/developers/content/crm_platform/leads-api#leads-add)

```ruby
body = [
    {
        "name": "Сделка для примера 1",
        "created_by": 0,
        "price": 20000
    },
    {
        "name": "Сделка для примера 2",
        "price": 10000
    }
]
response = AmocrmRails::Request.leads.create(body: body)
p(response.body)
leads = response.body[:_embedded][:leads]
```

### [Комплексное добавление сделок с контактом и компанией](https://www.amocrm.ru/developers/content/crm_platform/leads-api#leads-complex-add)

```ruby
body = [
  {
    name: "Название сделки",
    price: 3422,
    created_at: 1608905348
  },
  {
    name: "Название сделки",
    price: 3422
  }
]
response = AmocrmRails::Request.leads.complex.create(body: body)
p(response.body)
```

### [Редактирование сделок](https://www.amocrm.ru/developers/content/crm_platform/leads-api#leads-edit)
```ruby
body = [
    {
      id: 666749,
      closed_at: 1589297221
    },
    {
      id: 666753,
      price: 50000
    }
]
response = AmocrmRails::Request.leads.update(body: body)
p(response.body)
leads = response.body[:_embedded][:leads]
```

### [Редактирование сделки](https://www.amocrm.ru/developers/content/crm_platform/leads-api#leads-edit)

```ruby
body = {
  closed_at: 1589297221
}
response = AmocrmRails::Request.leads(666749).update(body: body)
p(response.body)
leads = response.body[:_embedded][:leads]
```
