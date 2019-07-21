# Урок №27. Entity Framework. Начало.

## Полезные ссылки


[Entity Framework Tutorial](https://www.entityframeworktutorial.net/)

[Relationships, navigation properties and foreign keys](https://docs.microsoft.com/en-us/ef/ef6/fundamentals/relationships)

![EF Intro](/Module-4/images/ef-intro.png)

## Entity Framework, очень быстрое знакомство

![EF](/Module-4/images/ef-general.png)

**Основные способы генерации контекста

![EF](/Module-4/images/context-creation-ways.png)

- Database first - БД уже существует и мы работаем с ней
- Code first - на основании классов, описывающих предметную область
- Model first

Из чего состоит наш edmx (database first)? 

![EDMX](/Module-4/images/edmx-1.png)

- SSDL - описание хранилища данных
- CSDL - описание соотвествующих классов
- MSL - маппинг

![EDMX](/Module-4/images/edmx-2.png)

## Navigation Properties

Отношения (связи) внутри нашей БД переносятся в нашу модель. Модель является логической.

Наш проект Phonebook имеет следующую физическую модель данных.

![Phonebook, физическая модель данных](/Module-4/images/phonebook-physicalmodel.png)

Модель включает в себя отношения один-ко-многим и одну разбивающую сущность.

После генерации модели из базы данных мы можем увидеть следующую модель данных в контексте .NET-приложения.

![Phonebook, логическая модель данных](/Module-4/images/phonebook-logicalmodel.png)

Вернемся в студию и посмотрим MSL, описывающий наши связи.

Обратим еще раз внимание на нашу логическую модель. Связь между сущностями плавно транспонируется в Navigation Properties, 
ссылку на связанный объект (коллекцию объектов).

![Phonebook, логическая модель данных](/Module-4/images/phonebook-logicalmodel-navigationproperties.png)

Как работают Navigation Properties под капотом.

![Navigation properties, как это устроено](/Module-4/images/navigation-properties-how-does-it-work.png)

## Понятие контекста

Для кооперации с базой данных нам необходимо понятие контекста.

![Базовое понятие контекста](/Module-4/images/context-general.png)

Грубо говоря, контекст - это полная картинка. В контексте :-) .NET, мы используем контекст следующим образом

![Контекст в EF](/Module-4/images/ef-context.png)

### Основные функции контекста

![Основные функции контекста](/Module-4/images/context-tasks.png)

- Управление запросами
- Управление изменениями
- Уровень доступа к данным
- Управление отношениями внутри модели
- Кеширование
- Транзакции
- Материализация объектов

![Пример кода контекста](/Module-4/images/context-code-sample.png)

## Состояния модели внутри контекста

![Entity Framework API](/Module-4/images/entity-framework-api.png)

- Added **(INSERT)**
- Modified **(UPDATE)**
- Deleted **(DELETE)**
- Unchanged
- Detached

![Entity Framework API](/Module-4/images/model-states-queries.png)

## SaveChanges() - сохраняем наши изменения

![Сохранение изменений](/Module-4/images/save-changes.png)

![Пример кода с SaveChanges](/Module-4/images/save-changes-source.png)

## Домашнее задание

1. Возвращаемся к проекту **Phonebook**
2. Реализуем все CRUD-операции в новом репозитории, построенном с помощью EntityFramework, Dayabase First
