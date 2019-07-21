# Урок №24. Многоуровневая архитектура, паттерн для уровня доступа к данным. Знакомство с ORM

## Полезные ссылки


[Несколько уровней внутри приложения](https://www.codeproject.com/Articles/36847/Three-Layer-Architecture-in-C-NET-2)

[Паттерн Репозиторий](https://metanit.com/sharp/articles/mvc/11.php)

[Паттерн Репозиторий](https://habr.com/ru/post/248505/)

[Что такое Dapper](https://dapper-tutorial.net/dapper)

[CRUD при помощи Dapper](https://habr.com/ru/sandbox/71430/)

[Битва производительности](https://exceptionnotfound.net/dapper-vs-entity-framework-vs-ado-net-performance-benchmarking/)

## Многоуровневое приложение

![Многоуровневое приложение](/Module-5/images/3-tiers.png)

Основная идея разделения уровней - сделать приложение более гибким, избежать повторений кода, добавить возможность повторного использования модулей.

Каждый уровень имеет набор интерфейсов (как в прямом, так и переносном смысле), при соблюдении сигнатуры, внутреннее содержимое может меняться.

Уровень презентации (MVC, Web API, Console) не знает ничего про уровень работы с данными.

## Паттерн Репозиторий

![Паттерн Repository](/Module-5/images/repository.png)

Позволяет абстрагироваться от конкретных подключений к источникам данных, с которыми работает программа, и является промежуточным звеном 
между классами, непосредственно взаимодействующими с данными, и остальной программой.

![Repository implementation](/Module-5/images/repository-implementation.png)

Возможная реализация для CRUD-процедур.

## ORM (object-relationship mapper)

![Пример на ADO.NET](/Module-5/images/adonet-sample.png)

Что с ним не так? Как вы думаете?

- много повторяющегося кода (инициализация команд, механизм чтения данных)
- странный механизм маппинга результатов запроса на соотвествующий класс

![ORM](/Module-5/images/orm.png)

![Маппинг в ORM](/Module-5/images/orm-mapping.png)


## Dapper

Причем тут Stackoverflow?

![Stackoverflow](/Module-5/images/so.png)

Как это выглядит?

![Dapper ORM](/Module-5/images/dapper-orm.png)

Как же в итоге изменился наш код?

![Dapper code](/Module-5/images/dapper-code.png)

- И еще асинхронность из коробки!!!

## Entity Framework, очень быстрое знакомство

![EF](/Module-5/images/ef-general.png)

**Основные способы генерации контекста

![EF](/Module-5/images/context-creation-ways.png)

- Database first - БД уже существует и мы работаем с ней
- Code first - на основании классов, описывающих предметную область
- Model first

Из чего состоит наш edmx (database first)? 

![EDMX](/Module-5/images/edmx-1.png)

- SSDL - описание хранилища данных
- CSDL - описание соотвествующих классов
- MSL - маппинг

![EDMX](/Module-5/images/edmx-2.png)

## Домашнее задание

1. Возвращаемся к проекту **Phonebook**
2. Производим рефакторинг по примеру как мы делали в классе. Выделяем три уровня, Persistance Layer, Business Layer, View Layer для таких сущностей, как контакты и телефоны
3. Создаем соотвествующие репозитории для всех CRUD-операций, как на ADO.NET так и на Dapper. Репозитории должны быть взаимозаменяемые
