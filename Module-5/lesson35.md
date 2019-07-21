# Урок №35. Web API, IIS

## Полезные ссылки

[IIS Setup](https://manage.accuwebhosting.com/knowledgebase/2886/How-to-configure-IIS-to-access-website-using-IP-address.html)

[Маршрутизация в Web API](https://metanit.com/sharp/aspnet_webapi/3.1.php)

[Attribute Routing in ASP.NET Web API 2](https://docs.microsoft.com/en-us/aspnet/web-api/overview/web-api-routing-and-actions/attribute-routing-in-web-api-2)

[Список кодов состояния HTTP](https://ru.wikipedia.org/wiki/%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA_%D0%BA%D0%BE%D0%B4%D0%BE%D0%B2_%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D1%8F_HTTP)

[Фильтры](https://metanit.com/sharp/aspnet_webapi/4.1.php)

[Authentication filters](https://docs.microsoft.com/en-us/aspnet/web-api/overview/security/authentication-filters)

## Запуск сайта на IIS

![HTTP request](/Module-4/images/http-requeest-under-the-hood.png)

Наш веб-сервер - IIS.

IIS — проприетарный набор серверов для нескольких служб Интернета от компании Microsoft. 
IIS распространяется с Windows NT. Основным компонентом IIS является веб-сервер, который позволяет размещать 
в Интернете сайты. IIS поддерживает протоколы HTTP, HTTPS, FTP, POP3, SMTP, NNTP.

![IIS Request](/Module-4/images/iis-request-processing.png)

### Установка IIS

![Установка IIS](/Module-4/images/iis-setup.png)

### Настройка сайта

## Практика

Деплоим на IIS - Phonebook & Phonebook.API. Для обоих вариантов используем именнованный инстанс.

## Коды ответов HTTP

* **200** - OK
* **400** - Bad Request
* **401** - нет доступа
* **404** - не найден
* **500** - внутренняя ошибка сервера

## Форматирование результата

![Formatters](/Module-4/images/web-api-formatters.png)

* **FormUrlEncodedFormatter** – возвращает объект, который парсит данные формы в процессе привязки модели
* **JsonFormatter** – сериализует данные в JSON
* **XmlFormatter** – сериализует данные в XML

## Routing (маршрутизация)

### Как это работает?

1. Если данные маршрута содержат ключ "action", то метод действия будет искаться по значению этого ключа. 
В отличии от ASP.NET MVC, в основном маршруты Web API не используют имена методов действия в маршрутизации.
Собираются все методы действия, у которых имя совпадает со значением ключа «action» Каждый метод действия может поддерживать один или 
несколько типов HTTP-запросов (GET, POST, PUT и т.д.) Исключаются те методы действия, для которых не подходит 
HTTP-запрос.

![Routing](/Module-4/images/routing-1.png)

![Routing](/Module-4/images/routing-2.png)

2. Если данные маршрута не содержат ключ "action", тогда метод действия будет найден по HTTP-запросу.
3. Для выбранных действий в обоих шагах, производится проверка на соответствие параметров. Исключаются все действия, которые не соответствуют всем параметрам в данных маршрута.
4. Исключаются методы действия, которые имеют атрибут "NonAction". 
Если методов осталось больше одного, выдается ошибка HTTP 500. (Внутренняя ошибка HttpResponseException)
Если методов не осталось совсем, то возвращается ошибка HTTP 404.

![HttpRoutingDispatcher](/Module-4/images/http-routing-dispatcher.png)

Роутинг в Web API реализован классом HttpRoute.

* **RouteTemplate** – шаблон URL

* **Defaults** – словарь из набора параметров и их значений (Dictionary<string, object>)

* **Constraints** – ограничения маршрута (Dictionary<string, object>)

* **DataTokens**

* **Handlers** – обработчик маршрута

### Управление маршрутами

Используемый шаблон

«api/{controller}/{id}»

Может соответствовать

“api/products” или “api/products/5”

![Routing](/Module-4/images/routing-default.png)

Используемый шаблон

«api/{controller}/{action}»

Может соответствовать

“api/products/getproduct”

![Routing](/Module-4/images/routing-custom.png)

В маршруте могут быть заданы дефолтные параметры

![Routing](/Module-4/images/routing-default-params.png)

**[NonAction]** – метод больше не сопоставляется с подходящим маршрутом

### Ограничения маршрутов

* **AlphaRouteConstraint** – сегмент состоит только из алфавитных символов

* **BoolRouteConstraint**

* **DateTimeRouteConstraint**

* **DecimalRouteConstraint**

* **DoubleRouteConstraint**

* **FloatRouteConstraint**

* **IntRouteConstraint**

* **LongRouteConstraint**

* **HttpMethodConstraint** – ограничение по методу HTTP-запроса

* **MaxLengthConstraint**

* **MinLengthConstraint**

* **RangeRouteConstraint**

* **RegexRouteConstraint** – сегмент должен соответствовать регулярному выражению

![Routing Restrictions](/Module-4/images/route-restrictions.png)

### Применение кастомного роутинга

![Routing Attributes](/Module-4/images/routing-through-attributes.png)

## Action Filters

Иногда нам необходимо добавить некоторую логику до или после выполнения метода action.

![Action Filters](/Module-4/images/filters-general.png)

### Типы Action Filters

![Action Filters](/Module-4/images/action-filters-types-1.png)
![Action Filters](/Module-4/images/action-filters-types-2.png)

### AllowMultiple property

![AllowMultiple](/Module-4/images/aloow-multiple-property.png)

### Жизненный цикл  Action Filters

![Action Filters](/Module-4/images/action-filters-pipeline.png)

### Authentication Filters

![Authentication Filters](/Module-4/images/iauthentication-filter.png)

Метод **AuthenticateAsync** вызывается до обработки запроса аутентификации пользователя.

Метод **ChallengeAsync** вызывается во время обработки ответа Клиенту.

### Authorization Filters

![Authorization Filters](/Module-4/images/authorization-filter.png)

Цель фильтров авторизации – определение роли в системе аутентифицированного пользователя.

![Authorization Filters](/Module-4/images/iauthorization-filter.png)

### Фильтры действий

![Action Filters](/Module-4/images/iactionfilter.png)

**actionContext** содержит информацию о методе контроллера,а также информацию о  запросе.

![Action Filters](/Module-4/images/actionfilterattribute.png)

**OnActionExecutingAsync** – до выполнения action
**OnActionExecutedAsync** – после выполнения action

### Фильтры исключения

![Exception Filters](/Module-4/images/exception-filter.png)

### Глобальные фильтры

Области видимости фильтра:

* Метод (action)
* Контроллер
* Все приложение (глобальный фильтр)

![Global Filters](/Module-4/images/global-filters.png)

### Переопределение фильтров

Отключает действие фильтра для определенного метода.

Встроенные реализации фильтров переопределения.

* **OverrideAuthentication** – отключает аутентификацию

* **OverrideAuthorization** – отключает авторизацию

* **OverrideAction** – отключает фильтры методов

* **OverrideException** – отключает фильтры исключений

## Домашнее задание

1. **Теория**
2. Работа с атрибутами в C#

3. Расширить созданный на уроке Phonebook API

* Сделать guard-валидацию входных параметров, в случае ошибки возвращать 400-код и некоторое сообщение
* Реализовать кастомное исключение на проверку формата телефона (+38-067-000-00-00)
* Повесить глобальный фильтр исключения при неправильном формате телефона
* Отключить его для метода Update (PUT)