# Amocrm для Rails

## Оглавление
0. [Установка](#install)
   1. [Упрощенная авторизация](#easy_auth)
   2. [Авторизация через перенаправления пользователя (требуется gem Devise)](#devise_auth)
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
7. [Компании](#companies)
    1. [Список компаний](#companies_list)
    2. [Получение компании по ID](#companies_detail)
    3. [Добавление компаний](#companies_add)
    4. [Редактирование компаний](#companies_edit)
    5. [Редактирование компании](#company_edit)
8. [Списки](#catalogs)
    1. [Доступные списки](#catalogs_list)
    2. [Получение списка по ID](#catalogs_detail)
    3. [Добавление списков](#catalogs_add)
    4. [Редактирование списков](#catalogs_edit)
    5. [Редактирование списка](#catalog_edit)
    6. [Доступные элементы списка](#catalog_elements_list)
    7. [Получение элемента списка по ID](#catalog_elements_list_detail)
    8. [Добавление элементов списков](#catalog_elements_add)
    9. [Редактирование элементов списков](#catalog_elements_edit)
    10. [Редактирование элемента списка](#catalog_element_edit)
9. [Связи сущностей](#links)
    1. [Список связанных сущностей](#links_list)
    2. [Привязка сущностей](#links_link)
    3. [Отвязка сущностей](#links_link)
    4. [Массовый список связанных сущностей](#mass_links_list)
    5. [Массовая привязка сущностей](#mass_links_link)
    6. [Массовая отвязка сущностей](#mass_links_unlink)
10. [Задачи](#tasks)
    1. [Список задач](#tasks_list)
    2. [Получение задачи по ID](#tasks_detail)
    3. [Добавление задач](#tasks_add)
    4. [Редактирование задач](#tasks_edit)
    5. [Редактирование задачи](#task_edit)
    6. [Выполнение задачи](#task_complete)
11. [Поля и группы полей](#custom_fields)
    1. [Список полей сущности](#custom_fields_list)
    2. [Получение поля сущности по его ID](#custom_fields_detail)
    3. [Создание дополнительных полей сущности](#custom_fields_add)
    4. [Редактирование дополнительных полей сущности](#custom_fields_edit)
    5. [Удаление дополнительного поля](#custom_fields_delete)
    6. [Список групп полей сущности](#custom_fields_groups_list)
    7. [Получение группы полей сущности по ID группы](#custom_fields_groups_detail)
    8. [Создание групп полей](#custom_fields_groups_add)
    9. [Редактирование группы полей](#custom_fields_groups_edit)
    10. [Удаление группы дополнительных полей](#custom_fields_groups_delete)
    11. [Доступные типы полей](#custom_fields_types)
    12. [Примеры заполнения разных типов полей через API](#custom_fields_examples)
12. [Теги](#tags)
    1. [Список полей сущности](#tags_list)
    2. [Добавление тегов для конкретного типа сущности](#tags_add)
    3. [Добавление тегов к сущности](#add_tags_to_entity)
    4. [Удаление тегов у сущности](#delete_tags_from_entity)
13. [События и примечания](#events_and_notes)
    1. [Список событий](#events_list)
    2. [Значения для фильтра по значению до/после](#events_filter_params)
    3. [Типы событий](#events_types)
    4. [Общая информация о примечаниях](#notes_common_info)
    5. [Типы примечаний](#notes_types)
    6. [Список примечаний по типу сущности](#notes_list)
    7. [Список примечаний по конкретной сущности, по ID сущности](#notes_entity_list)
    8. [Получение примечания по ID](#note_detail)
    9. [Добавление примечаний](#notes_add)
14. [Покупатели](#customers)
    1. [Включение покупателей и смена их режима](#customers_mode)
    2. [Список покупателей](#customers_list)
    3. [Получение покупателя по ID](#customers_detail)
    4. [Добавление покупателей](#customers_add)
    5. [Редактирование покупателей](#customers_edit)
    6. [Редактирование покупателя](#customer_edit)
    7. [Список транзакций](#transactions_list)
    8. [Получение транзакции по ID](#transactions_detail)
    9. [Добавление транзакций к покупателю](#transactions_add)
    10. [Удаление транзакции](#transaction_delete)
    11. [Списание/начисление бонусных баллов покупателю](#customer_bonus_points_update)
15. [Статусы и сегменты покупателей](#customers_statuses)
    1. [Список статусов покупателей](#customers_statuses_list)
    2. [Получение статуса покупателей по ID](#customers_statuses_detail)
    3. [Добавление статусов в воронку](#customers_statuses_add)
    4. [Редактирование статуса покупателей](#customers_statuses_edit)
    5. [Удаление статуса покупателей](#customer_status_delete)
    6. [Список сегментов покупателей](#segments_list)
    7. [Получение сегмента покупателей по ID](#segments_detail)
    8. [Добавление сегмента покупателей](#segments_add)
    9. [Редактирование сегмента покупателей](#segments_edit)
    10. [Удаление сегмента покупателей](#segment_delete)
    11. [Доступные цвета статусов](#customers_statuses_colors)
    12. [Доступные цвета сегментов](#customers_statuses_colors)
16. [Пользователи](#users)
    1. [Список пользователей](#users_list)
    2. [Получение пользователя по ID](#users_detail)
    3. [Добавление пользователей](#users_add)
    4. [Список ролей пользователей](#roles_list)
    5. [Получение роли по ID](#roles_detail)
    6. [Добавление ролей](#roles_add)
    7. [Редактирование роли](#roles_edit)    
    8. [Удаление роли](#roles_delete)
    9. [Общие обозначения прав пользователей](#users_common_rights)   
    10. [Зависимости прав пользователей](#users_rights_dependence)
17. [Товары](#products)
18. [Вебхуки](#webhooks)
    1. [Список установленных вебхуков в аккаунте](#webhooks_list)
    2. [Подписка на вебхук](#webhooks_subscribe)
    3. [Отписка от событий](#webhooks_delete)
    4. [Возможные событий](#webhooks_available_actions)
19. [Виджеты](#widgets)
    1. [Список виджетов](#widgets_list)
    2. [Информация о виджете по его коду](#widgets_detail)
    3. [Установка виджета в аккаунт](#widgets_install)
    4. [Удаление установки виджета](#widgets_uninstall)    
    5. [Подтверждение выполнения блока виджета в Salesbot](#widgets_continue)   
20. [Добавление звонков](#calls)
21. [Salebot](#salesbot)
22. [Короткие ссылки](#short_links)

## <a name="install"></a> Установка

добавьте в Gemfile:

    gem 'amocrm-rails'

и запустите `bundle install`.

Для упрощенной авторизации: 

`rails g amocrm_rails:install`

Для авторизации через перенаправление пользователя (требуется [gem devise](https://github.com/heartcombo/devise)):

`rails g amocrm_rails:install --with=devise`

### Получение CLIENT_ID, CLIENT_SECRET и CODE

#### <a name="easy_auth"></a> Упрощенная авторизация

1. Переходим на страницу интеграций https://yourdomain.amocrm.ru/settings/widgets/ и нажимаем "+ СОЗДАТЬ ИНТЕГРАЦИЮ"
![alt Страница виджетов](https://storage.deppa.ru/uploads/widgets.png)
2. Заполняем поля, в первое поле вводим https://yourdomain.com/amocrm и нажимаем "Сохранить"
![alt Создание интеграции](https://storage.deppa.ru/uploads/widget_add.png)
3. Переходим на таб "Ключи и доступы". Код авторизации работает 20 минут.
![alt Создание интеграции](https://storage.deppa.ru/uploads/widget_keys.png)

В файл `config/amocrm.yml` вставляем данные.

#### <a name="devise_auth"></a> Авторизация через перенаправления пользователя (требуется [gem Devise](https://github.com/heartcombo/devise))

Выполняем все шаги как при [упрощенной авторизации](#easy_auth)

Ссылка на получение кода:
```rhtml
<%= link_to "Установить интеграцию",
          amocrm_oauth_url(state: current_user.try(:id)),
          class: 'btn btn-primary' %>
```
Пример доступен по адресу:
`
https://yourdomain/amocrm/link
`

![alt Страница с кнопкой](https://storage.deppa.ru/uploads/amo_link.png)

Нажимаем на кнопку, логинимся в амо и даём права приложению

![alt Авторизация в amo](https://storage.deppa.ru/uploads/amo_form.png)

После вы будуте перенаправлены на страницу https://yourdomain.com/amocrm

![alt Страница с кнопкой](https://storage.deppa.ru/uploads/amo_code_and_account.png)

Если вы увидили код и информацию об аккаунте - всё в порядке, копировать код нет необходимости, страницу можно закрыть.

Если вы не используете [gem Devise](https://github.com/heartcombo/devise), то вам необходимо реализовать в
application_controller.rb методы `current_user` для получения текущего пользователя, `user_signed_in?` для проверки
авторизован ли посетитель на вашем сайте и `new_user_session_path` для получения пути к странице авторизции.

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
    source_name: "ООО Деппа",
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
          name: "ООО Деппа"
        }
      ]
    },
    metadata: {
      is_call_event_needed: true,
      uniq: "a1fe231cc88e64ba2e8822ba2b3ewrw",
      duration: 54,
      service_code: "CkAvbEwPam6sad",
      link: "https://deppa.ru",
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
    source_name: "ООО Деппа",
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
          name: "ООО Деппа"
        }
      ]
    },
    metadata: {
      ip: "123.222.2.22",
      form_id: "a1fee7c0fc436088e64ba2e8822ba2b3ewrw",
      form_sent_at: 1590830520,
      form_name: "Форма заявки для полёта в космос",
      form_page: "https://deppa.ru",
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
    name: "Новый этап",
    sort: 100,
    color: "#fffeb2"
  },
  {
    name: "Новый этап 2",
    sort: 200,
    color: "#fffeb2"
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
  name: "Новое название для статуса",
  color: "#c1e0ff"
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
    name: "ООО Деппа"
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
## <a name="companies"></a> [Компании](https://www.amocrm.ru/developers/content/crm_platform/companies-api)
### <a name="companies_list"></a> [Список компаний](https://www.amocrm.ru/developers/content/crm_platform/companies-api#companies-list)
```ruby
params = {
  with: 'leads',
  page: 0,
  limit: 10
}
response = AmocrmRails::Request.companies.retrieve(params: params)
p(response.body)
companies = response.body[:_embedded][:companies]
company_id = companies.first[:id]
```
### <a name="companies_detail"></a> [Получение компании по ID](https://www.amocrm.ru/developers/content/crm_platform/companies-api#company-detail)
```ruby
response = AmocrmRails::Request.companies(company_id).retrieve
p(response.body)
```
### <a name="companies_add"></a> [Добавление компаний](https://www.amocrm.ru/developers/content/crm_platform/companies-api#companies-add)
```ruby
body = [
  { 
    name: "ООО Деппа"
  }
]
response = AmocrmRails::Request.companies.create(body: body)
p(response.body)
companies = response.body[:_embedded][:companies]
company_id = companies.first[:id]
```
### <a name="companies_edit"></a> [Редактирование компаний](https://www.amocrm.ru/developers/content/crm_platform/companies-api#companies-edit)
```ruby
body = [
  { 
    id: company_id,     
    name: "ООО ДЕППА"
  }
]
response = AmocrmRails::Request.companies.update(body: body)
p(response.body)
companies = response.body[:_embedded][:companies]
company_id = companies.first[:id]
```
### <a name="company_edit"></a> [Редактирование компании](https://www.amocrm.ru/developers/content/crm_platform/companies-api#companies-edit)
```ruby
body = {
  name: "ООО ДЕППА"
}
response = AmocrmRails::Request.companies(company_id).update(body: body)
p(response.body)
company_id = response.body[:id]
```
## <a name="catalogs"></a> [Списки](https://www.amocrm.ru/developers/content/crm_platform/catalogs-api)
### <a name="catalogs_list"></a> [Доступные списки](https://www.amocrm.ru/developers/content/crm_platform/catalogs-api#lists-list)
```ruby
params = {
  page: 0,
  limit: 10
}
response = AmocrmRails::Request.catalogs.retrieve(params: params)
p(response.body)
catalogs = response.body[:_embedded][:catalogs]
catalog_id = catalogs.first[:id]
```
### <a name="catalogs_detail"></a> [Получение списка по ID](https://www.amocrm.ru/developers/content/crm_platform/catalogs-api#list-detail)
```ruby
response = AmocrmRails::Request.catalogs(catalog_id).retrieve
p(response.body)
```
### <a name="catalogs_add"></a> [Добавление списков](https://www.amocrm.ru/developers/content/crm_platform/catalogs-api#lists-add)
```ruby
body = [
  {
    name: "Тестовый список",
    can_add_elements: true,
    can_link_multiple: false
  }
]
response = AmocrmRails::Request.catalogs.create(body: body)
p(response.body)
catalogs = response.body[:_embedded][:catalogs]
catalog_id = catalogs.first[:id]
```
### <a name="catalogs_edit"></a> [Редактирование списков](https://www.amocrm.ru/developers/content/crm_platform/catalogs-api#lists-edit)
```ruby
body = [
  { 
    id: catalog_id,     
    name: "Новое имя списка"
  }
]
response = AmocrmRails::Request.catalogs.update(body: body)
p(response.body)
catalogs = response.body[:_embedded][:catalogs]
catalog_id = catalogs.first[:id]
```
### <a name="catalog_edit"></a> [Редактирование списка](https://www.amocrm.ru/developers/content/crm_platform/catalogs-api#lists-edit)
```ruby
body = {
  name: "Новое имя списка"
}
response = AmocrmRails::Request.catalogs(catalog_id).update(body: body)
p(response.body)
catalog_id = response.body[:id]
```
### <a name="catalog_elements_list"></a> [Доступные элементы списка](https://www.amocrm.ru/developers/content/crm_platform/catalogs-api#list-elements-list)
```ruby
params = { 
  with: 'invoice_link',      
  page: 0,
  limit: 10
}
response = AmocrmRails::Request.catalogs(catalog_id).elements.retrieve(params: params)
p(response.body)
elements = response.body[:_embedded][:elements]
element_id = elements.first[:id]
```
### <a name="catalog_elements_list_detail"></a> [Получение элемента списка по ID](https://www.amocrm.ru/developers/content/crm_platform/catalogs-api#list-elements-detail)
```ruby
params = { 
  with: 'invoice_link'
}
response = AmocrmRails::Request.catalogs(catalog_id).elements(element_id).retrieve(params: params)
p(response.body)
element_id = response.body[:id]
```
### <a name="catalog_elements_add"></a> [Добавление элементов списков](https://www.amocrm.ru/developers/content/crm_platform/catalogs-api#list-elements-add)
```ruby
body = [
  {
    name: "Новый элемент списка"
  }
]
response = AmocrmRails::Request.catalogs(catalog_id).elements.create(body: body)
p(response.body)
elements = response.body[:_embedded][:elements]
element_id = elements.first[:id]
```
### <a name="catalog_elements_edit"></a> [Редактирование элементов списков](https://www.amocrm.ru/developers/content/crm_platform/catalogs-api#list-elements-edit)
```ruby
body = [
  { 
    id: element_id,
    name: "Новое имя элемента"
  }
]
response = AmocrmRails::Request.catalogs(catalog_id).elements.update(body: body)
p(response.body)
elements = response.body[:_embedded][:elements]
element_id = elements.first[:id]
```
### <a name="catalog_element_edit"></a> [Редактирование элемента списка](https://www.amocrm.ru/developers/content/crm_platform/catalogs-api#list-elements-edit)
```ruby
body = { 
  name: "Новое имя элемента"
}
response = AmocrmRails::Request.catalogs(catalog_id).elements(element_id).update(body: body)
p(response.body)
element_id = response.body[:id]
```
## <a name="links"></a> [Связи сущностей](https://www.amocrm.ru/developers/content/crm_platform/entity-links-api)
### <a name="links_list"></a> [Список связанных сущностей](https://www.amocrm.ru/developers/content/crm_platform/entity-links-api#links-list)
```ruby
response = AmocrmRails::Request.leads(lead_id).links.retrieve
links = response.body[:_embedded][:links]
```
```ruby
response = AmocrmRails::Request.contacts(contact_id).links.retrieve
links = response.body[:_embedded][:links]
```
```ruby
response = AmocrmRails::Request.companies(company_id).links.retrieve
links = response.body[:_embedded][:links]
```
```ruby
response = AmocrmRails::Request.customers(customer_id).links.retrieve
links = response.body[:_embedded][:links]
```
### <a name="links_link"></a> [Привязка сущностей](https://www.amocrm.ru/developers/content/crm_platform/entity-links-api#links-link)
```ruby
body = [
 {
   to_entity_id: 10,
   to_entity_type: "catalog_elements",
   metadata: {
     quantity: 1,
     catalog_id: 1026
  }
 },
 {
   to_entity_id: 457282,
   to_entity_type: "contacts",
   metadata: {
     is_main: true,
  }
 }
]
```
```ruby
response = AmocrmRails::Request.leads(lead_id).link.create(body: body)
links = response.body[:_embedded][:links]
```
```ruby
response = AmocrmRails::Request.contacts(contact_id).link.create(body: body)
links = response.body[:_embedded][:links]
```
```ruby
response = AmocrmRails::Request.companies(company_id).link.create(body: body)
links = response.body[:_embedded][:links]
```
```ruby
response = AmocrmRails::Request.customers(customer_id).link.create(body: body)
links = response.body[:_embedded][:links]
```
### <a name="links_unlink"></a> [Отвязка сущностей](https://www.amocrm.ru/developers/content/crm_platform/entity-links-api#links-unlink)
```ruby
body = [
  {
    to_entity_id: 10,
    to_entity_type: "catalog_elements",
    metadata: {
      catalog_id: 1026
    }
  },
  {
    to_entity_id: 457282,
    to_entity_type: "contacts",
  }
]
```
```ruby
response = AmocrmRails::Request.leads(lead_id).unlink.create(body: body)
links = response.body[:_embedded][:links]
```
```ruby
response = AmocrmRails::Request.contacts(contact_id).unlink.create(body: body)
links = response.body[:_embedded][:links]
```
```ruby
response = AmocrmRails::Request.companies(company_id).unlink.create(body: body)
links = response.body[:_embedded][:links]
```
```ruby
response = AmocrmRails::Request.customers(customer_id).unlink.create(body: body)
links = response.body[:_embedded][:links]
```
### <a name="mass_links_list"></a> [Массовый список связанных сущностей](https://www.amocrm.ru/developers/content/crm_platform/entity-links-api#mass-links-list)
```ruby
response = AmocrmRails::Request.leads.links.retrieve
links = response.body[:_embedded][:links]
```
```ruby
response = AmocrmRails::Request.contacts.links.retrieve
links = response.body[:_embedded][:links]
```
```ruby
response = AmocrmRails::Request.companies.links.retrieve
links = response.body[:_embedded][:links]
```
```ruby
response = AmocrmRails::Request.customers.links.retrieve
links = response.body[:_embedded][:links]
```
### <a name="mass_links_link"></a> [Массовая привязка сущностей](https://www.amocrm.ru/developers/content/crm_platform/entity-links-api#mass-links-link)
```ruby
body = [
  {
    entity_id: 14158851,
    to_entity_id: 10,
    to_entity_type: "catalog_elements",
    metadata: {
      quantity: 1,
      catalog_id: 1026
    }
  },
  {
    entity_id: 14158852,
    to_entity_id: 457282,
    to_entity_type: "contacts",
    metadata: {
      is_main: true,
    }
  }
]
```
```ruby
response = AmocrmRails::Request.leads.link.create(body: body)
links = response.body[:_embedded][:links]
```
```ruby
response = AmocrmRails::Request.contacts.link.create(body: body)
links = response.body[:_embedded][:links]
```
```ruby
response = AmocrmRails::Request.companies.link.create(body: body)
links = response.body[:_embedded][:links]
```
```ruby
response = AmocrmRails::Request.customers.link.create(body: body)
links = response.body[:_embedded][:links]
```
### <a name="mass_links_unlink"></a> [Массовая отвязка сущностей](https://www.amocrm.ru/developers/content/crm_platform/entity-links-api#mass-links-unlink)
```ruby
body = [
  {
    to_entity_id: 10,
    to_entity_type: "catalog_elements",
    metadata: {
      catalog_id: 1026
    }
  },
  {
    to_entity_id: 457282,
    to_entity_type: "contacts",
  }
]
```
```ruby
response = AmocrmRails::Request.leads.unlink.create(body: body)
links = response.body[:_embedded][:links]
```
```ruby
response = AmocrmRails::Request.contacts.unlink.create(body: body)
links = response.body[:_embedded][:links]
```
```ruby
response = AmocrmRails::Request.companies.unlink.create(body: body)
links = response.body[:_embedded][:links]
```
```ruby
response = AmocrmRails::Request.customers.unlink.create(body: body)
links = response.body[:_embedded][:links]
```
## <a name="tasks"></a> [Задачи](https://www.amocrm.ru/developers/content/crm_platform/tasks-api)
### <a name="tasks_list"></a> [Список задач](https://www.amocrm.ru/developers/content/crm_platform/tasks-api#tasks-list)
```ruby
params = {
        page: 0,
        limit: 10
}
response = AmocrmRails::Request.tasks.retrieve(params: params)
p(response.body)
tasks = response.body[:_embedded][:tasks]
task_id = tasks.first[:id]
```
### <a name="tasks_detail"></a> [Получение задачи по ID](https://www.amocrm.ru/developers/content/crm_platform/tasks-api#task-detail)
```ruby
response = AmocrmRails::Request.tasks(task_id).retrieve
p(response.body)
task_id = response.body[:id]
```
### <a name="tasks_add"></a> [Добавление задач](https://www.amocrm.ru/developers/content/crm_platform/tasks-api#tasks-add)
```ruby
body = [
 {
   task_type_id: 1,
   text: "Встретиться с клиентом Иван Иванов",
   complete_till: 1588885140
 }
]
response = AmocrmRails::Request.tasks.create(body: body)
p(response.body)
tasks = response.body[:_embedded][:tasks]
```
### <a name="tasks_edit"></a> [Редактирование задач](https://www.amocrm.ru/developers/content/crm_platform/tasks-api#tasks-edit)
```ruby
body = [
    {
      id: task_id,
      task_type_id: 2,
      text: "Новое название для задачи",
      complete_till: 1588885140
    }
]
response = AmocrmRails::Request.tasks.update(body: body)
p(response.body)
tasks = response.body[:_embedded][:tasks]
```
### <a name="task_edit"></a> [Редактирование задачи](https://www.amocrm.ru/developers/content/crm_platform/tasks-api#tasks-edit)
```ruby
body = {
  task_type_id: 2,
  text: "Новое название для задачи",
  complete_till: 1588885140
}
response = AmocrmRails::Request.tasks(task_id).update(body: body)
task = response.body
```
### <a name="task_complete"></a> [Выполнение задачи](https://www.amocrm.ru/developers/content/crm_platform/tasks-api#tasks-complete)
```ruby
body = {
  is_completed: true,
  result: {
    text: "Удалось связаться с клиентом"
  }
}
response = AmocrmRails::Request.tasks(task_id).update(body: body)
task = response.body
```
## <a name="custom_fields"></a> [Поля и группы полей](https://www.amocrm.ru/developers/content/crm_platform/custom-fields)
### <a name="custom_fields_list"></a> [Список полей сущности](https://www.amocrm.ru/developers/content/crm_platform/custom-fields#custom-fields-list)
```ruby
response = AmocrmRails::Request.leads.custom_fields.retrieve
```
```ruby
response = AmocrmRails::Request.contacts.custom_fields.retrieve
```
```ruby
response = AmocrmRails::Request.companies.custom_fields.retrieve
```
```ruby
response = AmocrmRails::Request.customers.custom_fields.retrieve
```
```ruby
response = AmocrmRails::Request.customers.segments.custom_fields.retrieve
```
```ruby
response = AmocrmRails::Request.catalogs(catalog_id).custom_fields.retrieve
```
```ruby
custom_fields = response.body[:_embedded][:custom_fields]
```
### <a name="custom_fields_detail"></a> [Получение поля сущности по его ID](https://www.amocrm.ru/developers/content/crm_platform/custom-fields#custom-field-detail)
```ruby
response = AmocrmRails::Request.leads.custom_fields(id).retrieve
```
```ruby
response = AmocrmRails::Request.contacts.custom_fields(id).retrieve
```
```ruby
response = AmocrmRails::Request.companies.custom_fields(id).retrieve
```
```ruby
response = AmocrmRails::Request.customers.custom_fields(id).retrieve
```
```ruby
response = AmocrmRails::Request.customers.segments.custom_fields(id).retrieve
```
```ruby
response = AmocrmRails::Request.catalogs(catalog_id).custom_fields(id).retrieve
```
```ruby
custom_fields = response.body
```
### <a name="custom_fields_add"></a> [Создание дополнительных полей сущности](https://www.amocrm.ru/developers/content/crm_platform/custom-fields#custom-fields-add)
```ruby
body = [
 {
   name: "multi select",
   type: "multiselect",
   sort: 510,
   required_statuses: [
   {
     pipeline_id: 16056,
     status_id: 20540473
   }
  ],
   enums: [
   {
     value: "Значение 1",
     sort: 1
   },
   {
     value: "Значение 2",
     sort: 2
   }
  ]
 }
]
```
```ruby
response = AmocrmRails::Request.leads.custom_fields.create(body: body)
```
```ruby
response = AmocrmRails::Request.contacts.custom_fields.create(body: body)
```
```ruby
response = AmocrmRails::Request.companies.custom_fields.create(body: body)
```
```ruby
response = AmocrmRails::Request.customers.custom_fields.create(body: body)
```
```ruby
response = AmocrmRails::Request.customers.segments.custom_fields.create(body: body)
```
```ruby
response = AmocrmRails::Request.catalogs(catalog_id).custom_fields.create(body: body)
```
```ruby
custom_fields = response.body[:_embedded][:custom_fields]
```
### <a name="custom_fields_edit"></a> [Редактирование дополнительных полей сущности](https://www.amocrm.ru/developers/content/crm_platform/custom-fields#custom-fields-edit)
```ruby
custom_field_id = 1278898087
body_items = [{
        "id": custom_field_id,
        "name": "Новое имя для дополнительного поля",
        "sort": 560,
        "is_visible": false,
        "is_required": true
}]
body_item = {
        "name": "Новое имя для дополнительного поля",
        "sort": 560,
        "is_visible": false,
        "is_required": true
}
```
```ruby
AmocrmRails::Request.leads.custom_fields.update(body: body_items)
AmocrmRails::Request.leads.custom_fields(custom_field_id).update(body: body_item)
```
```ruby
AmocrmRails::Request.contacts.custom_fields.update(body: body_items)
AmocrmRails::Request.contacts.custom_fields(custom_field_id).update(body: body_item)
```
```ruby
AmocrmRails::Request.companies.custom_fields.update(body: body_items)
AmocrmRails::Request.companies.custom_fields(custom_field_id).update(body: body_item)
```
```ruby
AmocrmRails::Request.customers.custom_fields.update(body: body_items)
AmocrmRails::Request.customers.custom_fields(custom_field_id).update(body: body_item)
```
```ruby
AmocrmRails::Request.customers.segments.custom_fields.update(body: body_items)
AmocrmRails::Request.customers.segments.custom_fields(custom_field_id).update(body: body_item)
```
```ruby
AmocrmRails::Request.catalogs(catalog_id).custom_fields.update(body: body_items)
AmocrmRails::Request.catalogs(catalog_id).custom_fields(custom_field_id).update(body: body_item)
```
### <a name="custom_fields_delete"></a> [Удаление дополнительного поля](https://www.amocrm.ru/developers/content/crm_platform/custom-fields#custom-field-delete)

```ruby
AmocrmRails::Request.leads.custom_fields(custom_field_id).delete
```
```ruby
AmocrmRails::Request.contacts.custom_fields(custom_field_id).delete
```
```ruby
AmocrmRails::Request.companies.custom_fields(custom_field_id).delete
```
```ruby
AmocrmRails::Request.customers.custom_fields(custom_field_id).delete
```
```ruby
AmocrmRails::Request.customers.segments.custom_fields(custom_field_id).delete
```
```ruby
AmocrmRails::Request.catalogs(catalog_id).custom_fields(custom_field_id).delete
```
### <a name="custom_fields_groups_list"></a> [Список групп полей сущности](https://www.amocrm.ru/developers/content/crm_platform/custom-fields#custom-fields-groups-list)
```ruby
response = AmocrmRails::Request.leads.custom_fields.groups.retrieve
```
```ruby
response = AmocrmRails::Request.contacts.custom_fields.groups.retrieve
```
```ruby
response = AmocrmRails::Request.companies.custom_fields.groups.retrieve
```
```ruby
response = AmocrmRails::Request.customers.custom_fields.groups.retrieve
```
```ruby
custom_field_groups = response[:_embedded][:custom_field_groups]
group_id = custom_field_groups.first[:id]
```
### <a name="custom_fields_groups_detail"></a> [Получение группы полей сущности по ID группы](https://www.amocrm.ru/developers/content/crm_platform/custom-fields#custom-fields-group-detail)
```ruby
response = AmocrmRails::Request.leads.custom_fields.groups(group_id).retrieve
```
```ruby
response = AmocrmRails::Request.contacts.custom_fields.groups(group_id).retrieve
```
```ruby
response = AmocrmRails::Request.companies.custom_fields.groups(group_id).retrieve
```
```ruby
response = AmocrmRails::Request.customers.custom_fields.groups(group_id).retrieve
```
```ruby
group_id = response[:id]
```
### <a name="custom_fields_groups_add"></a> [Создание групп полей](https://www.amocrm.ru/developers/content/crm_platform/custom-fields#custom-fields-groups-add)

```ruby
body = [
  {
    name: "group 1",
    sort: 4
  },
  {
    name: "group 2",
    sort: 5
  }
]
```
```ruby
response = AmocrmRails::Request.leads.custom_fields.groups.create(body: body)
```
```ruby
response = AmocrmRails::Request.contacts.custom_fields.groups.create(body: body)
```
```ruby
response = AmocrmRails::Request.companies.custom_fields.groups.create(body: body)
```
```ruby
response = AmocrmRails::Request.customers.custom_fields.groups.create(body: body)
```
```ruby
custom_field_groups = response.body[:_embedded][:custom_field_groups]
custom_field_group_id = custom_field_groups.first[:id]
```
### <a name="custom_fields_groups_edit"></a> [Редактирование группы полей](https://www.amocrm.ru/developers/content/crm_platform/custom-fields#custom-fields-group-edit)

```ruby
body = {
  sort: 6,
  fields: [
    14563,
    12575
  ]
}
```
```ruby
response = AmocrmRails::Request.leads.custom_fields.groups(custom_field_group_id).update(body: body)
```
```ruby
response = AmocrmRails::Request.contacts.custom_fields.groups(custom_field_group_id).update(body: body)
```
```ruby
response = AmocrmRails::Request.companies.custom_fields.groups(custom_field_group_id).update(body: body)
```
```ruby
response = AmocrmRails::Request.customers.custom_fields.groups(custom_field_group_id).update(body: body)
```
```ruby
custom_field_groups = response.body[:_embedded][:custom_field_groups]
custom_field_group_id = custom_field_groups.first[:id]
```
### <a name="custom_fields_groups_delete"></a> [Удаление группы дополнительных полей](https://www.amocrm.ru/developers/content/crm_platform/custom-fields#custom-fields-group-delete)

```ruby
AmocrmRails::Request.leads.custom_fields.groups(custom_field_group_id).delete
```
```ruby
AmocrmRails::Request.contacts.custom_fields.groups(custom_field_group_id).delete
```
```ruby
AmocrmRails::Request.companies.custom_fields.groups(custom_field_group_id).delete
```
```ruby
AmocrmRails::Request.customers.custom_fields.groups(custom_field_group_id).delete
```
### <a name="custom_fields_types"></a> [Доступные типы полей](https://www.amocrm.ru/developers/content/crm_platform/custom-fields#cf-types)
### <a name="custom_fields_examples"></a> [Примеры заполнения разных типов полей через API](https://www.amocrm.ru/developers/content/crm_platform/custom-fields#cf-fill-examples)

## <a name="tags"></a> [Теги](https://www.amocrm.ru/developers/content/crm_platform/tags-api)
### <a name="tags_list"></a> [Список тегов для сущности](https://www.amocrm.ru/developers/content/crm_platform/tags-api#tags-list)
```ruby
params = {
  page: 0,
  limit: 10
}
```
```ruby
response = AmocrmRails::Request.leads.tags.retrieve(params: params)
```
```ruby
response = AmocrmRails::Request.contacts.tags.retrieve(params: params)
```
```ruby
response = AmocrmRails::Request.companies.tags.retrieve(params: params)
```
```ruby
response = AmocrmRails::Request.customers.tags.retrieve(params: params)
```
```ruby
tags = response.body[:_embedded][:tags]
tag_id = tags.first[:id]
```
### <a name="tags_add"></a> [Добавление тегов для конкретного типа сущности](https://www.amocrm.ru/developers/content/crm_platform/tags-api#tags-add)
```ruby
body = [
  {
    "name": "Tag 1"
  },
  {
    "name": "Tag 2",
    "request_id": "my_request_id"
  },
  {
    "name": "Tag 3"
  }
]
```
```ruby
response = AmocrmRails::Request.leads.tags.create(body: body)
```
```ruby
response = AmocrmRails::Request.contacts.tags.create(body: body)
```
```ruby
response = AmocrmRails::Request.companies.tags.create(body: body)
```
```ruby
response = AmocrmRails::Request.customers.tags.create(body: body)
```
```ruby
tags = response.body[:_embedded][:tags]
tag_id = tags.first[:id]
```
### <a name="add_tags_to_entity"></a> [Добавление тегов к сущности](https://www.amocrm.ru/developers/content/crm_platform/tags-api#add-tags-to-entity)
```ruby
body_item = {
  _embedded: {
    tags: [
      {
        id: tag_id
      }
    ]
  }
}
body = [
  {
    id: object_id,
    _embedded: {
      tags: [
        {
          id: tag_id
        }
      ]
    }
  }
]
```
```ruby
AmocrmRails::Request.leads.update(body: body)
AmocrmRails::Request.leads(lead_id).update(body: body_item)
```
```ruby
AmocrmRails::Request.contacts.update(body: body)
AmocrmRails::Request.contacts(contact_id).update(body: body_item)
```
```ruby
AmocrmRails::Request.companies.update(body: body)
AmocrmRails::Request.contacts(company_id).update(body: body_item)
```
```ruby
AmocrmRails::Request.customers.update(body: body)
AmocrmRails::Request.contacts(customer_id).update(body: body_item)
```
### <a name="delete_tags_from_entity"></a> [Удаление тегов у сущности](https://www.amocrm.ru/developers/content/crm_platform/tags-api#delete-tags-from-entity)

```ruby
body_item = {
  _embedded: {
    tags: nil
  }
}
body = [
  {
    id: object_id,
    _embedded: {
      tags: nil
    }
  }
]
```
```ruby
AmocrmRails::Request.leads.update(body: body)
AmocrmRails::Request.leads(lead_id).update(body: body_item)
```
```ruby
AmocrmRails::Request.contacts.update(body: body)
AmocrmRails::Request.contacts(contact_id).update(body: body_item)
```
```ruby
AmocrmRails::Request.companies.update(body: body)
AmocrmRails::Request.contacts(company_id).update(body: body_item)
```
```ruby
AmocrmRails::Request.customers.update(body: body)
AmocrmRails::Request.contacts(customer_id).update(body: body_item)
```
## <a name="events_and_notes"></a> [События и примечания](https://www.amocrm.ru/developers/content/crm_platform/events-and-notes)
### <a name="events_list"></a> [Список событий](https://www.amocrm.ru/developers/content/crm_platform/events-and-notes#events-list)

```ruby
params = {
  with: 'contact_name',
  page: 0,
  limit: 10
}
```
```ruby
response = AmocrmRails::Request.events.retrieve(params: params)
events = response.body[:_embedded][:events]
event_id = events.first[:id]
```
### <a name="events_detail"></a> [Получение события по ID](https://www.amocrm.ru/developers/content/crm_platform/events-and-notes#events-detail)

```ruby
params = {
  with: 'contact_name'
}
```
```ruby
response = AmocrmRails::Request.events(event_id).retrieve(params: params)
event = response.body
```
### <a name="events_filter_params"></a> [Значения для фильтра по значению до/после](https://www.amocrm.ru/developers/content/crm_platform/events-and-notes#events-filter-params)

```ruby
filter = {
  filter: {
    value_after: [
      customers_statuses: [
        {
          status_id: 135751,
        },
        {
          status_id: 135754,
        }
      ]
    ]
  }
}
```
```ruby
filter = {
  filter: {
    value_after: [
      value: '155',
    ],
    type: 'sale_field_changed',
    entity: 'lead'
  }
}
```
### <a name="events_types"></a> [Типы событий](https://www.amocrm.ru/developers/content/crm_platform/events-and-notes#events-types)

```ruby
params = {
  language_code: 'en'
}
```
```ruby
response = AmocrmRails::Request.events.types.retrieve(params: params)
events_types = response.body[:_embedded][:events_types]
```

### <a name="notes_common_info"></a> [Общая информация о примечаниях](https://www.amocrm.ru/developers/content/crm_platform/events-and-notes#notes-common-info)
### <a name="notes_types"></a> [Типы примечаний](https://www.amocrm.ru/developers/content/crm_platform/events-and-notes#notes-types)
### <a name="notes_list"></a> [Список примечаний по типу сущности](https://www.amocrm.ru/developers/content/crm_platform/events-and-notes#notes-list)
```ruby
params = {
  page: 0,
  limit: 10
}
```
```ruby
response = AmocrmRails::Request.leads.notes.retrieve(params: params)
```
```ruby
response = AmocrmRails::Request.contacts.notes.retrieve(params: params)
```
```ruby
response = AmocrmRails::Request.companies.notes.retrieve(params: params)
```
```ruby
response = AmocrmRails::Request.customers.notes.retrieve(params: params)
```
```ruby
notes = response.body[:_embedded][:notes]
note_id = notes.first[:id]
```

### <a name="notes_entity_list"></a> [Список примечаний по конкретной сущности, по ID сущности](https://www.amocrm.ru/developers/content/crm_platform/events-and-notes#notes-entity-list)
```ruby
params = {
  page: 0,
  limit: 10
}
```
```ruby
response = AmocrmRails::Request.leads(lead_id).notes.retrieve(params: params)
```
```ruby
response = AmocrmRails::Request.contacts(contact_id).notes.retrieve(params: params)
```
```ruby
response = AmocrmRails::Request.companies(company_id).notes.retrieve(params: params)
```
```ruby
response = AmocrmRails::Request.customers(customer_id).notes.retrieve(params: params)
```
```ruby
notes = response.body[:_embedded][:notes]
note_id = notes.first[:id]
```

### <a name="note_detail"></a> [Получение примечания по ID](https://www.amocrm.ru/developers/content/crm_platform/events-and-notes#note-detail)
```ruby
response = AmocrmRails::Request.leads(lead_id).notes(note_id).retrieve
```
```ruby
response = AmocrmRails::Request.contacts(contact_id).notes(note_id).retrieve
```
```ruby
response = AmocrmRails::Request.companies(company_id).notes(note_id).retrieve
```
```ruby
response = AmocrmRails::Request.customers(customer_id).notes(note_id).retrieve
```
```ruby
note = response.body
```

### <a name="notes_add"></a> [Добавление примечаний](https://www.amocrm.ru/developers/content/crm_platform/events-and-notes#notes-add)

```ruby
body = [
  {
    entity_id: 167353,
    note_type: "call_in",
    params: {
      uniq: "8f52d38a-5fb3-406d-93a3-a4832dc28f8b",
      duration: 60,
      source: "onlinePBX",
      link: "https://deppa.ru",
      phone: "+79999999999"
    }
  },
  {
    entity_id: 167353,
    note_type: "call_out",
    params: {
      uniq: "8f52d38a-5fb3-406d-93a3-a4832dc28f8b",
      duration: 60,
      source: "onlinePBX",
      link: "https://deppa.ru",
      phone: "+79999999999"
    }
  },
  {
    entity_id: 167353,
    note_type: "geolocation",
    params: {
      text: "Примечание с геолокацией",
      address: "ул. Пушкина, дом Колотушкина, квартира Вольнова",
      longitude: "53.714816",
      latitude: "91.423146"
    }
  }
]
body_item = {
  entity_id: 167353,
  note_type: "call_in",
  params: {
    uniq: "8f52d38a-5fb3-406d-93a3-a4832dc28f8b",
    duration: 60,
    source: "onlinePBX",
    link: "https://deppa.ru",
    phone: "+79999999999"
  }
}
```

```ruby
AmocrmRails::Request.leads.notes.create(body: body)
AmocrmRails::Request.leads(lead_id).notes.create(body: body_item)
```
```ruby
AmocrmRails::Request.contacts.notes.create(body: body)
AmocrmRails::Request.contacts(contact_id).notes.create(body: body_item)
```
```ruby
AmocrmRails::Request.companies.notes.create(body: body)
AmocrmRails::Request.companies(company_id).notes.create(body: body_item)
```
```ruby
AmocrmRails::Request.customers.notes.create(body: body)
AmocrmRails::Request.customers(customer_id).notes.create(body: body_item)
```
```ruby
notes = response.body[:_embedded][:notes]
note_id = notes.first[:id]
```

### <a name="notes_edit"></a> [Редактирование примечаний](https://www.amocrm.ru/developers/content/crm_platform/events-and-notes#notes-edit)

```ruby
body = [
  {
    entity_id: 167353,
    note_type: "call_in",
    params: {
      uniq: "8f52d38a-5fb3-406d-93a3-a4832dc28f8b",
      duration: 60,
      source: "onlinePBX",
      link: "https://deppa.ru",
      phone: "+79999999999"
    }
  },
  {
    entity_id: 167353,
    note_type: "call_out",
    params: {
      uniq: "8f52d38a-5fb3-406d-93a3-a4832dc28f8b",
      duration: 60,
      source: "onlinePBX",
      link: "https://deppa.ru",
      phone: "+79999999999"
    }
  },
  {
    entity_id: 167353,
    note_type: "geolocation",
    params: {
      text: "Примечание с геолокацией",
      address: "ул. Пушкина, дом Колотушкина, квартира Вольнова",
      longitude: "53.714816",
      latitude: "91.423146"
    }
  }
]
body_item = {
  entity_id: 167353,
  note_type: "call_in",
  params: {
    uniq: "8f52d38a-5fb3-406d-93a3-a4832dc28f8b",
    duration: 60,
    source: "onlinePBX",
    link: "https://deppa.ru",
    phone: "+79999999999"
  }
}
```

```ruby
AmocrmRails::Request.leads.notes.update(body: body)
AmocrmRails::Request.leads(lead_id).notes.update(body: body_item)
```
```ruby
AmocrmRails::Request.contacts.notes.update(body: body)
AmocrmRails::Request.contacts(contact_id).notes.update(body: body_item)
```
```ruby
AmocrmRails::Request.companies.notes.update(body: body)
AmocrmRails::Request.companies(company_id).notes.update(body: body_item)
```
```ruby
AmocrmRails::Request.customers.notes.update(body: body)
AmocrmRails::Request.customers(customer_id).notes.update(body: body_item)
```
```ruby
notes = response.body[:_embedded][:notes]
note_id = notes.first[:id]
```

## <a name="customers"></a> [Покупатели](https://www.amocrm.ru/developers/content/crm_platform/customers-api)
### <a name="customers_mode"></a> [Включение покупателей и смена их режима](https://www.amocrm.ru/developers/content/crm_platform/customers-api#customers-mode)
```ruby
body = {
  mode: "segments",
  is_enabled: true
}
response = AmocrmRails::Request.customers.mode.update(body: body)
p(response.body)
```
### <a name="customers_list"></a> [Список покупателей](https://www.amocrm.ru/developers/content/crm_platform/customers-api#customers-list)
```ruby
params = {
  with: 'contacts',
  page: 0,
  limit: 10
}
response = AmocrmRails::Request.customers.retrieve(params: params)
customers = response.body[:_embedded][:customers]
customer_id = customers.first[:id]
```
### <a name="customers_detail"></a> [Получение покупателя по ID](https://www.amocrm.ru/developers/content/crm_platform/customers-api#customer-detail)
```ruby
params = {
  with: 'contacts'
}
response = AmocrmRails::Request.customers(customer_id).retrieve(params: params)
customer = response.body
```
### <a name="customers_add"></a> [Добавление покупателей](https://www.amocrm.ru/developers/content/crm_platform/customers-api#customers-add)
```ruby
body = [
    {
      name: "Покупатель для примера 1",
      created_by: 0
    },
    {
      name: "Покупатель для примера 2",
      _embedded: {
        tags: [
                {
                    "name": "Важный покупатель"
                }
            ]
        }
    }
]
response = AmocrmRails::Request.customers.create(body: body)
customers = response.body[:_embedded][:customers]
customer_id = customers.first[:id]
```
### <a name="customers_edit"></a> [Редактирование покупателей](https://www.amocrm.ru/developers/content/crm_platform/customers-api#customers-edit)
```ruby
body = [
  {
    id: customer_id,
    name: "Новое название покупателя",
    _embedded: {
      tags: [
        {
          name: "Тег 125"
        }
      ]
    }
  }
]
response = AmocrmRails::Request.customers.update(body: body)
customers = response.body[:_embedded][:customers]
customer_id = customers.first[:id]
```
### <a name="customer_edit"></a> [Редактирование покупателя](https://www.amocrm.ru/developers/content/crm_platform/customers-api#customers-edit)
```ruby
body = {
  name: "Новое название покупателя",
  _embedded: {
    tags: [
      {
        name: "Тег 125"
      }
    ]
  }
}
response = AmocrmRails::Request.customers(customer_id).update(body: body)
customer = response.body
```
### <a name="transactions_list"></a> [Список транзакций](https://www.amocrm.ru/developers/content/crm_platform/customers-api#transactions-list)
```ruby
params = {
  page: 0,
  limit: 10
}
response = AmocrmRails::Request.customers.transactions.retrieve(params: params)
response = AmocrmRails::Request.customers(customer_id).transactions.retrieve(params: params)

transactions = response.body[:_embedded][:transactions]
transaction_id = transactions.first[:id]
```
### <a name="transactions_detail"></a> [Получение транзакции по ID](https://www.amocrm.ru/developers/content/crm_platform/customers-api#transaction-detail)
```ruby
response = AmocrmRails::Request.customers.transactions(transaction_id).retrieve
response = AmocrmRails::Request.customers(customer_id).transactions(transaction_id).retrieve

transaction = response.body
```
### <a name="transactions_add"></a> [Добавление транзакций к покупателю](https://www.amocrm.ru/developers/content/crm_platform/customers-api#transactions-add)
```ruby
body = [
  {
    price: 123,
    created_by: 0,
    comment: "Комментарий",
    _embedded: {
      catalog_elements: [
        {
          id: 1677,
          metadata: {
            catalog_id: 1079,
            quantity: 10
          }
        }
      ]
    }
  }
]
response = AmocrmRails::Request.customers(customer_id).transactions.create(body: body)
p(response.body)
transactions = response.body[:_embedded][:transactions]
transaction_id = transactions.first[:id]
```
### <a name="transaction_delete"></a> [Удаление транзакции](https://www.amocrm.ru/developers/content/crm_platform/customers-api#transaction-delete)

```ruby
response = AmocrmRails::Request.customers.transactions(transaction_id).delete
p(response.body)
```
### <a name="customer_bonus_points_update"></a> [Списание/начисление бонусных баллов покупателю](https://www.amocrm.ru/developers/content/crm_platform/customers-api#customer–bonus-points-update)
```ruby
body = {
  earn: 500
}
response = AmocrmRails::Request.customers(customer_id).bonus_points.create(body: body)
p(response.body)
```
## <a name="customers_statuses"></a> [Статусы и сегменты покупателей](https://www.amocrm.ru/developers/content/crm_platform/customers-statuses-api)
### <a name="customers_statuses_list"></a> [Список статусов покупателей](https://www.amocrm.ru/developers/content/crm_platform/customers-statuses-api#customers-statuses-list)
```ruby
response = AmocrmRails::Request.customers.statuses.retrieve
statuses = response.body[:_embedded][:statuses]
status_id = statuses.first[:id]
```
### <a name="customers_statuses_detail"></a> [Получение статуса покупателей по ID](https://www.amocrm.ru/developers/content/crm_platform/customers-statuses-api#customer-status-detail)
```ruby
response = AmocrmRails::Request.customers.statuses(status_id).retrieve
status = response.body
```
### <a name="customers_statuses_add"></a> [Добавление статусов в воронку](https://www.amocrm.ru/developers/content/crm_platform/customers-statuses-api#customers-statuses-add)
```ruby
body = [
  {
    name: "Новый статус",
    sort: 100,
    color: "#fffeb2"
  },
  {
    name: "Новый статус 2",
    sort: 200,
    color: "#fffeb2"
  }
]
response = AmocrmRails::Request.customers.statuses.create(body: body)
p(response.body)
statuses = response.body[:_embedded][:statuses]
status_id = statuses.first[:id]
```
### <a name="customers_statuses_edit"></a> [Редактирование статуса покупателей](https://www.amocrm.ru/developers/content/crm_platform/customers-statuses-api#customers-status-edit)
```ruby
body = {
  name: "Новое название для статуса",
  color: "#c1e0ff"
}
response = AmocrmRails::Request.customers.statuses(status_id).update(body: body)
customer = response.body
```
### <a name="customer_status_delete"></a> [Удаление статуса покупателей](https://www.amocrm.ru/developers/content/crm_platform/customers-statuses-api#customer-status-delete)
```ruby
AmocrmRails::Request.customers.statuses(status_id).delete
```
### <a name="segments_list"></a> [Список сегментов покупателей](https://www.amocrm.ru/developers/content/crm_platform/customers-statuses-api#segments-list)
```ruby
response = AmocrmRails::Request.customers.segments
segments = response.body[:_embedded][:segments]
segment_id = segments.first[:id]
```
### <a name="segments_detail"></a> [Получение сегмента покупателей по ID](https://www.amocrm.ru/developers/content/crm_platform/customers-statuses-api#segment-detail)
```ruby
response = AmocrmRails::Request.customers.segments(segment_id).retrieve
segment = response.body
```
### <a name="segments_add"></a> [Добавление сегмента покупателей](https://www.amocrm.ru/developers/content/crm_platform/customers-statuses-api#segment-add)
```ruby
body = {
  name: "Сегмент для примера",
  color: "ae003f"
}
response = AmocrmRails::Request.customers.segments.create(body: body)
p(response.body)
segment = response.body
segment_id = segment[:id]
```
### <a name="segments_edit"></a> [Редактирование сегмента покупателей](https://www.amocrm.ru/developers/content/crm_platform/customers-statuses-api#segment-edit)
```ruby
body = {
  name: "Новое имя для сегмента",
  color: "ae003f"
}
response = AmocrmRails::Request.customers.segments(segment_id).update(body: body)
segment = response.body
```
### <a name="segment_delete"></a> [Удаление сегмента покупателей](https://www.amocrm.ru/developers/content/crm_platform/customers-statuses-api#segment-delete)
```ruby
AmocrmRails::Request.customers.segments(segment_id).delete
```
### <a name="customers_statuses_colors"></a> [Доступные цвета статусов](https://www.amocrm.ru/developers/content/crm_platform/customers-statuses-api#customers-statuses-colors)
### <a name="customers_statuses_colors"></a> [Доступные цвета сегментов](https://www.amocrm.ru/developers/content/crm_platform/customers-statuses-api#segments-colors)

## <a name="users"></a> [Пользователи](https://www.amocrm.ru/developers/content/crm_platform/users-api)
### <a name="users_list"></a> [Список пользователей](https://www.amocrm.ru/developers/content/crm_platform/users-api#users-list)
```ruby
params = {
  with: 'group',
  page: 0,
  limit: 10
}
response = AmocrmRails::Request.users.retrieve
users = response.body[:_embedded][:users]
user_id = users.first[:id]
```
### <a name="users_detail"></a> [Получение пользователя по ID](https://www.amocrm.ru/developers/content/crm_platform/users-api#user-detail)
```ruby
params = {
  with: 'group'
}
response = AmocrmRails::Request.users(user_id).retrieve(params: params)
user = response.body
user_id = user[:id]
```
### <a name="users_add"></a> [Добавление пользователей](https://www.amocrm.ru/developers/content/crm_platform/users-api#users-add)
```ruby
body = [
  {
    name: "Павел Осетров",
    email: 'pavel.osetrov@me.com'
  }
]
response = AmocrmRails::Request.users.create(body: body)
p(response.body)
users = response.body[:_embedded][:users]
user_id = users.first[:id]
```
### <a name="roles_list"></a> [Список ролей пользователей](https://www.amocrm.ru/developers/content/crm_platform/users-api#roles-list)
```ruby
params = {
  with: 'users',
  page: 0,
  limit: 10
}
response = AmocrmRails::Request.roles.retrieve
roles = response.body[:_embedded][:roles]
role_id = roles.first[:id]
```
### <a name="roles_detail"></a> [Получение роли по ID](https://www.amocrm.ru/developers/content/crm_platform/users-api#role-detail)
```ruby
params = {
  with: 'users'
}
response = AmocrmRails::Request.roles(role_id).retrieve(params: params)
role = response.body
role_id = user[:id]
```
### <a name="roles_add"></a> [Добавление ролей](https://www.amocrm.ru/developers/content/crm_platform/users-api#roles-add)
```ruby
body = [
  {
    name: "role 3",
    rights: {
      leads: {
        add: "A",
        edit: "G",
        view: "G",
        delete: "G",
        export: "G"
      },
      tasks: {
        edit: "A",
        delete: "A"
      },
      contacts: {
        add: "A",
        edit: "A",
        view: "A",
        delete: "A",
        export: "A"
      },
      companies: {
        add: "A",
        edit: "A",
        view: "A",
        delete: "A",
        export: "A"
      },
      mail_access: true,
      status_rights: [
        {
          entity_type: "leads",
          pipeline_id: 16056,
          status_id: 20542166,
          rights: {
            edit: "A",
            view: "A",
            delete: "A",
            export: "A"
          }
        }
      ],
      catalog_access: true
    }
  }
]
response = AmocrmRails::Request.roles.create(body: body)
p(response.body)
roles = response.body[:_embedded][:roles]
role_id = roles.first[:id]
```
### <a name="roles_edit"></a> [Редактирование роли](https://www.amocrm.ru/developers/content/crm_platform/users-api#role-edit)
```ruby
body = {
  name: "role 3 modified",
  rights: {
    contacts: {
      add: "A",
      edit: "D",
      view: "D",
      delete: "D",
      export: "D"
    },
    status_rights: nil
  }
}
response = AmocrmRails::Request.roles(role_id).update(body: body)
role = response.body
```

### <a name="roles_delete"></a> [Удаление роли](https://www.amocrm.ru/developers/content/crm_platform/users-api#role-delete)
```ruby
AmocrmRails::Request.roles(role_id).delete
```
### <a name="users_common_rights"></a> [Общие обозначения прав пользователей](https://www.amocrm.ru/developers/content/crm_platform/users-api#common-rights)
### <a name="users_rights_dependence"></a> [Зависимости прав пользователей](https://www.amocrm.ru/developers/content/crm_platform/users-api#rights-dependence)

## <a name="products"></a> [Товары](https://www.amocrm.ru/developers/content/crm_platform/products-api)
```ruby
body = [
      {
        name: "Автомобильный держатель Mage Safe Qi для iPhone, магнитный",
        description: "",
        :custom_fields_values=>[
          {
            :field_id=>82661,
            :field_name=>"Артикул", 
            :field_code=>"SKU",
            :field_type=>"text",
            :values=>[{:value=>"55185"}]
          },
          {
            :field_id=>82661,
            :field_name=>"Группа",
            :field_code=>"GROUP",
            :field_type=>"category",
            :values=>[{:value=>"Автомобильные держатели", :enum_id=>category_id}]
          },
          {
            :field_id=>82665,
            :field_name=>"Цена",
            :field_code=>"PRICE",
            :field_type=>"price",
            :values=>[{:value=>3390}]
          }
        ]
      }
    ]
    response = AmocrmRails::Request.catalogs(catalog_id).elements.create(body: body)
    elements = response.body[:_embedded][:elements]
    element_id = elements.first[:id]
```
## <a name="webhooks"></a> [Вебхуки](https://www.amocrm.ru/developers/content/crm_platform/webhooks-api)
### <a name="webhooks_list"></a> [Список установленных вебхуков в аккаунте](https://www.amocrm.ru/developers/content/crm_platform/webhooks-api#webhooks-list)
```ruby
response = AmocrmRails::Request.webhooks.retrieve
webhooks = response.body[:_embedded][:webhooks]
webhook_id = webhooks.first[:id]
```
### <a name="webhooks_subscribe"></a> [Подписка на вебхук](https://www.amocrm.ru/developers/content/crm_platform/webhooks-api#webhook-subscribe)
```ruby
body = {
  destination: "https://deppa.ru",
  settings: [
    "add_lead"
  ],
  sort: 10
}
response = AmocrmRails::Request.webhooks.create(body: body)
p(response.body)
webhook = response.body
webhook_id = webhook[:id]
```
### <a name="webhooks_delete"></a> [Отписка от событий](https://www.amocrm.ru/developers/content/crm_platform/webhooks-api#webhooks-delete)
```ruby
AmocrmRails::Request.webhooks(webhook_id).delete
```
### <a name="webhooks_available_actions"></a> [Возможные событий](https://www.amocrm.ru/developers/content/crm_platform/webhooks-api#webhooks-available-actions)

## <a name="widgets"></a> [Виджеты](https://www.amocrm.ru/developers/content/crm_platform/widgets-api)
### <a name="widgets_list"></a> [Список виджетов](https://www.amocrm.ru/developers/content/crm_platform/widgets-api#widgets-list)
```ruby
params = {
  page: 0,
  limit: 10
}
response = AmocrmRails::Request.widgets.retrieve
widgets = response.body[:_embedded][:widgets]
widget_code = widgets.first[:code]
```
### <a name="widgets_detail"></a> [Информация о виджете по его коду](https://www.amocrm.ru/developers/content/crm_platform/widgets-api#widget-detail)
```ruby
response = AmocrmRails::Request.widgets(widget_code).retrieve
widget = response.body
```
### <a name="widgets_install"></a> [Установка виджета в аккаунт](https://www.amocrm.ru/developers/content/crm_platform/widgets-api#widget-install)
```ruby
body = {
  login: "example",
  password: "eXaMp1E",
  script_path: "https://deppa.ru/"
}
response = AmocrmRails::Request.widgets.create(body: body)
p(response.body)
widget = response.body
```
### <a name="widgets_uninstall"></a> [Удаление установки виджета](https://www.amocrm.ru/developers/content/crm_platform/widgets-api#widget-uninstall)
```ruby
AmocrmRails::Request.widgets(widget_code).delete
```
### <a name="widgets_continue"></a> [Подтверждение выполнения блока виджета в Salesbot](https://www.amocrm.ru/developers/content/crm_platform/widgets-api#widget-continue)
```ruby
body = {
  data: {
    status: "success"
  },
  execute_handlers: [
    {
      handler: "show",
      params: {
        type: "text",
        value: "Здесь текст"
      }
    },
    {
      handler: "show",
      params: {
        type: "buttons",
        value: "Нажми на кнопку",
        buttons: [
          "1ая кнопка",
          "2ая кнопка",
          "3ая кнопка",
          "4ая кнопка"
        ]
      }
    },
    {
      handler: "show",
      params: {
        type: "buttons_url",
        value: "Кнопки со ссылками",
        buttons: [
          "https://amocrm.ru",
          "https://deppa.ru"
        ]
      }
    },
    {
      handler: "goto",
      params: {
        type: "question|answer|finish",
        step: 5
      }
    }
  ]
}
AmocrmRails::Request.salesbot(bot_id).continue(continue_id).create(body: body)
AmocrmRails::Request.marketingbot(bot_id).continue(continue_id).create(body: body)
```
## <a name="calls"></a> [Добавление звонков](https://www.amocrm.ru/developers/content/crm_platform/calls-api)
```ruby
body = [
  {
    duration: 10,
    source: "example_integration",
    phone: "123123",
    link: "https://deppa.ru/audio.mp3",
    direction: "inbound",
    call_result: "Успешный разговор",
    call_status: 4
  }
]
response = AmocrmRails::Request.calls.create(body: body)
p(response.body)
calls = response.body[:_embedded][:calls]
```
## <a name="salesbot"></a> [Salebot](https://www.amocrm.ru/developers/content/api/salesbot-api)
```ruby
body = [
  {
    bot_id: 565,
    entity_id: 76687686,
    entity_type: 1
  }
]
response = AmocrmRails::Request.salesbot.run.create(body: body)
p(response.body)
```
## <a name="short_links"></a> [Короткие ссылки](https://www.amocrm.ru/developers/content/crm_platform/short_links)
```ruby
body = [
  {
    url:"https://deppa.ru",
    metadata:{
      entity_type:"contacts",
      entity_id:11070881
    }
  }
]
response = AmocrmRails::Request.short_links.create(body: body)
p(response.body)
short_links = response.body[:_embedded][:short_links]
```