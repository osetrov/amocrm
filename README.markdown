# Amocrm для Rails

## Оглавление
0. [Установка](#install)
1. [Параметры аккаунта](#account)
2. [Сделки](#leads)
    0. [Список сделок](#leads_retrieve)
    1. [Получение сделки по ID](#lead_id_retrieve)
    2. [Добавление сделок](#leads_create)
    3. [Комплексное добавление сделок с контактом и компанией](#leads_complex)
    4. [Редактирование сделок](#leads_update)
    5. [Редактирование сделки](#lead_update)
3. [Неразобранное](#unsorted)
    0. [Список неразобранного](#unsorted_retrieve)
    1. [Получение неразобранного по UID](#unsorted_uid_retrieve)
    2. [Добавление неразобранного типа звонок](#unsorted_uid_sip)
    3. [Добавление неразобранного типа форма](#unsorted_uid_forms)
    4. [Принятие неразобранного](#unsorted_uid_accept)
    5. [Отклонение неразобранного](#unsorted_uid_decline)
    6. [Привязка неразобранного](#unsorted_uid_link)
    7. [Сводная информация о неразобранных сделках](#unsorted_summary)
    8. [Описание объектов metadata](#unsorted_meta)
4. [Воронки и этапы](#leads_pipelines)

## <a name="install"></a> Установка

добавьте в Gemfile:

    gem 'amocrm-rails'

и запустите `bundle install`.

Затем: `rails g amocrm_rails:install`

В файл `config/amocrm.yml` вставьте ваши данные.

Вы можете изменять `timeout`, `open_timeout`, `faraday_adapter`, `proxy`, `symbolize_keys`, `logger`, и `debug`:

```ruby
AmocrmRails::Request.timeout = 60
AmocrmRails::Request.open_timeout = 60
AmocrmRails::Request.symbolize_keys = true
AmocrmRails::Request.debug = false
```
в файле `config/initializers/amocrm.rb`

## <a name="account"></a> Параметры аккаунта
```ruby
params = {
  with: 'amojo_id,amojo_rights,users_groups,task_types,version,entity_names,datetime_settings'
}
response = AmocrmRails::Request.account.retrieve(params: params)
p(response.body)
```

## <a name="leads"></a> Сделки
### <a name="leads_retrieve"></a> [Список сделок](https://www.amocrm.ru/developers/content/crm_platform/leads-api)

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
### <a name="lead_id_retrieve"></a> [Получение сделки по ID](https://www.amocrm.ru/developers/content/crm_platform/leads-api#lead-detail)

```ruby
params = {
  with: 'catalog_elements'
}
response = AmocrmRails::Request.leads(lead_id).retrieve(params: params)
p(response.body)
```
### <a name="leads_create"></a> [Добавление сделок](https://www.amocrm.ru/developers/content/crm_platform/leads-api#leads-add)

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
### <a name="leads_complex"></a> [Комплексное добавление сделок с контактом и компанией](https://www.amocrm.ru/developers/content/crm_platform/leads-api#leads-complex-add)

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
### <a name="leads_update"></a> [Редактирование сделок](https://www.amocrm.ru/developers/content/crm_platform/leads-api#leads-edit)
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
### <a name="lead_update"></a> [Редактирование сделки](https://www.amocrm.ru/developers/content/crm_platform/leads-api#leads-edit)

```ruby
body = {
  closed_at: 1589297221
}
response = AmocrmRails::Request.leads(666749).update(body: body)
p(response.body)
leads = response.body[:_embedded][:leads]
```

## <a name="unsorted"></a> Неразобранное
### <a name="unsorted_retrieve"></a> [Список неразобранного](https://www.amocrm.ru/developers/content/crm_platform/unsorted-api#unsorted-list)

```ruby
params = {
  page: 0,
  limit: 10
}
response = AmocrmRails::Request.leads.unsorted.retrieve(params: params)
p(response.body)
unsorted = response.body[:_embedded][:unsorted]
uid = unsorted.first[:uid]
```
### <a name="unsorted_uid_retrieve"></a> [Получение неразобранного по UID](https://www.amocrm.ru/developers/content/crm_platform/unsorted-api#unsorted-detail)

```ruby
response = AmocrmRails::Request.leads.unsorted(uid).retrieve
p(response.body)
```
### <a name="unsorted_uid_sip"></a> [Добавление неразобранного типа звонок](https://www.amocrm.ru/developers/content/crm_platform/unsorted-api#unsorted-add-sip)

```ruby
body = [
  {
    source_name: "ОАО Коспромсервис",
    source_uid: "a1fee7c0fc436088e64ba2e8822ba2b3",
    created_at: 1510261200,
    _embedded: {
      leads: [
        {
          name: "Тех обслуживание",
          price: 5000
        }
      ],
      contacts: [
        {
          name: "Контакт для примера"
        }
      ],
      companies: [
        {
          name: "ОАО Коспромсервис"
        }
      ]
    },
    metadata: {
      is_call_event_needed: true,
      uniq: "a1fe231cc88e64ba2e8822ba2b3ewrw",
      duration: 54,
      service_code: "CkAvbEwPam6sad",
      link: "https://example.com",
      phone: 79998888888,
      called_at: 1510261200,
      from: "onlinePBX"
    }
  }
]
response = AmocrmRails::Request.leads.unsorted.sip.create(body: body)
p(response.body)
```
### <a name="unsorted_uid_forms"></a> [Добавление неразобранного типа форма](https://www.amocrm.ru/developers/content/crm_platform/unsorted-api#unsorted-add-form)

```ruby
body = [
  {
    source_name: "ОАО Коспромсервис",
    source_uid: "a1fee7c0fc436088e64ba2e8822ba2b3",
    created_at: 1590830520,
    _embedded: {
      leads: [
        {
          name: "Тех обслуживание",
          visitor_uid: "5692210d-58d0-468c-acb2-dce7f93eef87",
          price: 5000,
          _embedded: {
            tags: [
              {
                name: "Тег для примера"
              }
            ]
          }
        }
      ],
      contacts: [
        {
          name: 234,
          first_name: "123213",
          last_name: 234,
          custom_fields_values: [
            {
              field_code: "PHONE",
              values: [
                {
                  value: "+7912321323"
                }
              ]
            }
          ]
        }
      ],
      companies: [
        {
          name: "ОАО Коспромсервис"
        }
      ]
    },
    metadata: {
      ip: "123.222.2.22",
      form_id: "a1fee7c0fc436088e64ba2e8822ba2b3ewrw",
      form_sent_at: 1590830520,
      form_name: "Форма заявки для полёта в космос",
      form_page: "https://example.com",
      referer: "https://www.google.com/search?&q=elon+musk"
    }
  }
]
response = AmocrmRails::Request.leads.unsorted.forms.create(body: body)
p(response.body)
uid = response.body[:_embedded][:unsorted].first[:uid]
```
### <a name="unsorted_uid_accept"></a> [Принятие неразобранного](https://www.amocrm.ru/developers/content/crm_platform/unsorted-api#unsorted-accept)

```ruby
body = {
  status_id: 41504311
}
response = AmocrmRails::Request.leads.unsorted(uid).accept.create(body: body)
p(response.body)
```
### <a name="unsorted_uid_decline"></a> [Отклонение неразобранного](https://www.amocrm.ru/developers/content/crm_platform/unsorted-api#unsorted-decline)

```ruby
response = AmocrmRails::Request.leads.unsorted(uid).decline.delete
p(response.body)
```
### <a name="unsorted_uid_link"></a> [Привязка неразобранного](https://www.amocrm.ru/developers/content/crm_platform/unsorted-api#unsorted-link)

```ruby
body = {
  link: {
    entity_id: lead_id,
    entity_type: "leads"
  }
}
response = AmocrmRails::Request.leads.unsorted(uid).link.create(body: body)
p(response.body)
```
### <a name="unsorted_summary"></a> [Сводная информация о неразобранных сделках](https://www.amocrm.ru/developers/content/crm_platform/unsorted-api#unsorted-summary)

```ruby
response = AmocrmRails::Request.leads.unsorted.summary.retrieve
p(response.body)
```
### <a name="unsorted_meta"></a> [Описание объектов metadata](https://www.amocrm.ru/developers/content/crm_platform/unsorted-api#metadata-description)

## <a name="leads_pipelines"></a> Воронки и этапы