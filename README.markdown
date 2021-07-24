# Amocrm для Rails

## Оглавление
0. [Установка](#install)
1. [Параметры аккаунта](#account)
2. [Сделки](#leads)
    1. [Список сделок](#leads_retrieve)
    2. [Получение сделки по ID](#lead_id_retrieve)
    3. [Добавление сделок](#leads_create)
    4. [Комплексное добавление сделок с контактом и компанией](#leads_complex)
    5. [Редактирование сделок](#leads_update)
    6. [Редактирование сделки](#lead_update)
3. [Неразобранное](#unsorted)
    1. [Список неразобранного](#unsorted_retrieve)
    2. [Получение неразобранного по UID](#unsorted_uid_retrieve)
    3. [Добавление неразобранного типа звонок](#unsorted_uid_sip)
    4. [Добавление неразобранного типа форма](#unsorted_uid_forms)
    5. [Принятие неразобранного](#unsorted_uid_accept)
    6. [Отклонение неразобранного](#unsorted_uid_decline)
    7. [Привязка неразобранного](#unsorted_uid_link)
    8. [Сводная информация о неразобранных сделках](#unsorted_summary)
    9. [Описание объектов metadata](#unsorted_meta)
4. [Воронки и этапы](#leads_pipelines)
    1. [Общая информация](#leads_pipelines_info)
    2. [Список воронок сделок](#leads_pipelines_list)
    3. [Получение воронки сделок по ID](#leads_pipelines_detail)
    4. [Добавление воронок](#leads_pipelines_add)
    5. [Редактирование воронки](#leads_pipelines_edit)
    6. [Удаление воронки](#leads_pipelines_delete)
    7. [Список статусов воронки сделок](#leads_pipelines_statuses_list)
    8. [Получение статуса воронки сделок по ID](#leads_pipelines_statuses_detail)
    9. [Добавление статусов в воронку](#leads_pipelines_statuses_add)
    10. [Редактирование статуса воронки](#leads_pipelines_statuses_edit)
    11. [Удаление статуса воронки](#leads_pipelines_statuses_delete)
    12. [Доступные цвета статусов](#leads_pipelines_statuses_colors)
5. [Фильтрация](#filters)
    1. [Фильтрация списка сделок](#filters_leads)
    2. [Фильтрация списка контактов](#filters_contacts)
    3. [Фильтрация списка компаний](#filters_companies)
    4. [Фильтрация списка покупателей](#filters_customers)
    5. [Типы фильтров](#filters_types)
6. [Контакты](#contacts)
    1. [Список контактов](#contacts_list)
    2. [Получение контакта по ID](#contacts_detail)
    3. [Добавление контактов](#contacts_add)
    4. [Редактирование контактов](#contacts_edit)
    5. [Редактирование контакта](#contact_edit)
    6. [Привязка чатов к контактам](#contacts_chat_connect)
    7. [Получение списка чатов контакта](#contacts_chat_list)

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

## <a name="account"></a> [Параметры аккаунта](https://www.amocrm.ru/developers/content/crm_platform/account-info)
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

### <a name="leads_pipelines_info"></a> [Общая информация](https://www.amocrm.ru/developers/content/crm_platform/leads_pipelines#common-info)
### <a name="leads_pipelines_list"></a> [Список воронок сделок](https://www.amocrm.ru/developers/content/crm_platform/leads_pipelines#pipelines-list)
```ruby
response = AmocrmRails::Request.leads.pipelines.retrieve
p(response.body)
pipelines = response.body[:_embedded][:pipelines]
pipeline_id = pipelines.first[:id]
```
### <a name="leads_pipelines_detail"></a> [Получение воронки сделок по ID](https://www.amocrm.ru/developers/content/crm_platform/leads_pipelines#pipeline-detail)
```ruby
response = AmocrmRails::Request.leads.pipelines(pipeline_id).retrieve
p(response.body)
```
### <a name="leads_pipelines_add"></a> [Добавление воронок](https://www.amocrm.ru/developers/content/crm_platform/leads_pipelines#pipelines-add)
```ruby
body = [
  {
    name: "Воронка доп продаж",
    is_main: false,
    is_unsorted_on: true,
    sort: 20,
    request_id: "123",
    _embedded: {
      statuses: [
        {
          id: 142,
          name: "Мое название для успешных сделок"
        },
        {
          name: "Первичный контакт",
          sort: 10,
          color: "#fffeb2"
        }
      ]
    }
  }
]
response = AmocrmRails::Request.leads.pipelines.create(body: body)
p(response.body)
pipelines = response.body[:_embedded][:pipelines]
pipeline_id = pipelines.first[:id]
```
### <a name="leads_pipelines_edit"></a> [Редактирование воронки](https://www.amocrm.ru/developers/content/crm_platform/leads_pipelines#pipeline-edit)
```ruby
body = {
        "name": "Новое название для воронки",
        "is_main": false,
        "is_unsorted_on": false,
        "sort": 100
}
response = AmocrmRails::Request.leads.pipelines(pipeline_id).update(body: body)
p(response.body)
```
### <a name="leads_pipelines_delete"></a> [Удаление воронки](https://www.amocrm.ru/developers/content/crm_platform/leads_pipelines#pipeline-delete)
```ruby
AmocrmRails::Request.leads.pipelines(pipeline_id).delete
```
### <a name="leads_pipelines_statuses_list"></a> [Список статусов воронки сделок](https://www.amocrm.ru/developers/content/crm_platform/leads_pipelines#statuses-list)
```ruby
response = AmocrmRails::Request.leads.pipelines(pipeline_id).statuses.retrieve
p(response.body)
statuses = response.body[:_embedded][:statuses]
status_id = statuses.first[:id]
```
### <a name="leads_pipelines_statuses_detail"></a> [Получение статуса воронки сделок по ID](https://www.amocrm.ru/developers/content/crm_platform/leads_pipelines#status-detail)
```ruby
response = AmocrmRails::Request.leads.pipelines(pipeline_id).statuses(status_id).retrieve
p(response.body)
```
### <a name="leads_pipelines_statuses_add"></a> [Добавление статусов в воронку](https://www.amocrm.ru/developers/content/crm_platform/leads_pipelines#statuses-add)
```ruby
body = [
        {
                "name": "Новый этап",
                "sort": 100,
                "color": "#fffeb2"
        },
        {
                "name": "Новый этап 2",
                "sort": 200,
                "color": "#fffeb2"
        }
]
response = AmocrmRails::Request.leads.pipelines(pipeline_id).statuses.create(body: body)
p(response.body)
statuses = response.body[:_embedded][:statuses]
status_id = statuses.first[:id]
```
### <a name="leads_pipelines_statuses_edit"></a> [Редактирование статуса воронки](https://www.amocrm.ru/developers/content/crm_platform/leads_pipelines#status-edit)
```ruby
body = {
        "name": "Новое название для статуса",
        "color": "#c1e0ff"
}
response = AmocrmRails::Request.leads.pipelines(pipeline_id).statuses(status_id).update(body: body)
p(response.body)
```
### <a name="leads_pipelines_statuses_delete"></a> [Удаление статуса воронки](https://www.amocrm.ru/developers/content/crm_platform/leads_pipelines#status-delete)
```ruby
AmocrmRails::Request.leads.pipelines(pipeline_id).statuses(status_id).delete
```
### <a name="leads_pipelines_statuses_colors"></a> [Доступные цвета статусов](https://www.amocrm.ru/developers/content/crm_platform/leads_pipelines#statuses-colors)

## <a name="filters"></a> [Фильтрация](https://www.amocrm.ru/developers/content/crm_platform/filters-api)
### <a name="filters_leads"></a> [Фильтрация списка сделок](https://www.amocrm.ru/developers/content/crm_platform/filters-api#leads-filter)
```ruby
params = {
  filter: { 
    id: lead_id
  }
}
response = AmocrmRails::Request.leads.retrieve(params: params)
p(response.body)
leads = response.body[:_embedded][:leads]
```
### <a name="filters_contacts"></a> [Фильтрация списка контактов](https://www.amocrm.ru/developers/content/crm_platform/filters-api#contacts-filter)
```ruby
params = {
  filter: { 
    name: "Павел Осетров"
  }
}
response = AmocrmRails::Request.contacts.retrieve(params: params)
p(response.body)
contacts = response.body[:_embedded][:contacts]
```
### <a name="filters_companies"></a> [Фильтрация списка компаний](https://www.amocrm.ru/developers/content/crm_platform/filters-api#companies-filter)
```ruby
params = {
  filter: { 
    name: "ОАО Коспромсервис"
  }
}
response = AmocrmRails::Request.companies.retrieve(params: params)
p(response.body)
companies = response.body[:_embedded][:companies]
```
### <a name="filters_customers"></a> [Фильтрация списка покупателей](https://www.amocrm.ru/developers/content/crm_platform/filters-api#customers-filter)
```ruby
params = {
  filter: { 
    name: "Павел Осетров"
  }
}
response = AmocrmRails::Request.customers.retrieve(params: params)
p(response.body)
customers = response.body[:_embedded][:customers]
```
### <a name="filters_types"></a> [Типы фильтров](https://www.amocrm.ru/developers/content/crm_platform/filters-api#filter-types)

## <a name="contacts"></a> [Контакты](https://www.amocrm.ru/developers/content/crm_platform/contacts-api)
### <a name="contacts_list"></a> [Список контактов](https://www.amocrm.ru/developers/content/crm_platform/contacts-api#contacts-list)
```ruby
params = {
  with: 'leads',
  page: 0,
  limit: 10
}
response = AmocrmRails::Request.contacts.retrieve(params: params)
p(response.body)
contacts = response.body[:_embedded][:contacts]
contact_id = contacts.first[:id]
```
### <a name="contacts_detail"></a> [Получение контакта по ID](https://www.amocrm.ru/developers/content/crm_platform/contacts-api#contact-detail)
```ruby
response = AmocrmRails::Request.contacts(contact_id).retrieve
p(response.body)
```
### <a name="contacts_add"></a> [Добавление контактов](https://www.amocrm.ru/developers/content/crm_platform/contacts-api#contacts-add)
```ruby
body = [
  {
    first_name: "Петр",
    last_name: "Смирнов"
  },
  {
    name: "Владимир Смирнов"
  }
]
response = AmocrmRails::Request.contacts.create(body: body)
p(response.body)
contacts = response.body[:_embedded][:contacts]
contact_id = contacts.first[:id]
```
### <a name="contacts_edit"></a> [Редактирование контактов](https://www.amocrm.ru/developers/content/crm_platform/contacts-api#contacts-edit)
```ruby
body = [
  {
    id: contact_id,
    first_name: "Иван",
    last_name: "Иванов"
  }
]
response = AmocrmRails::Request.contacts.update(body: body)
p(response.body)
contacts = response.body[:_embedded][:contacts]
contact_id = contacts.first[:id]
```
### <a name="contact_edit"></a> [Редактирование контакта](https://www.amocrm.ru/developers/content/crm_platform/contacts-api#contacts-edit)
```ruby
body = {
  first_name: "Иван",
  last_name: "Иванов"
}
response = AmocrmRails::Request.contacts(contact_id).update(body: body)
p(response.body)
```
### <a name="contacts_chat_connect"></a> [Привязка чатов к контактам](https://www.amocrm.ru/developers/content/crm_platform/contacts-api#contacts-chat-connect)
```ruby
body = [
  {
    contact_id: contact_id,
    chat_id: uid
  }
]
response = AmocrmRails::Request.contacts.chats.create(body: body)
p(response.body)
```
### <a name="contacts_chat_list"></a> [Получение списка чатов контакта](https://www.amocrm.ru/developers/content/crm_platform/contacts-api#contacts-chat-list)
```ruby
params = [
  {
    contact_id: contact_id
  }
]
response = AmocrmRails::Request.contacts.chats.retrieve(params: params)
p(response.body)
```

