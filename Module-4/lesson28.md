# Урок №28. Entity Framework. Code First.

## Полезные ссылки


[Fluent API Configurations in EF 6](http://www.entityframeworktutorial.net/code-first/fluent-api-in-code-first.aspx)

[How to Use Code First Approach With Fluent API in ASP.NET MVC Application](https://www.c-sharpcorner.com/UploadFile/cd7c2e/how-to-use-code-first-approach-with-fluent-api-in-Asp-Net-mv/)

[Стратегии наследования в Entity Framework](http://www.entityframeworktutorial.net/code-first/inheritance-strategy-in-code-first.aspx)

[Table-per-Hierarchy](https://weblogs.asp.net/manavi/inheritance-mapping-strategies-with-entity-framework-code-first-ctp5-part-1-table-per-hierarchy-tph)

[Table-per-Type](https://weblogs.asp.net/manavi/inheritance-mapping-strategies-with-entity-framework-code-first-ctp5-part-2-table-per-type-tpt)

[Table-per-Concrete-Type](https://weblogs.asp.net/manavi/inheritance-mapping-strategies-with-entity-framework-code-first-ctp5-part-3-table-per-concrete-type-tpc-and-choosing-strategy-guidelines)

![Маст рид, маст рид](/Module-5/images/julia-lerman.png)

## Entity Framework, основные подходы

Базовые критерии выбора подхода:

- Наличие/отсутствие уже готовой базы данных
- Требования к оптимальности структуры базы данных
- Что меняется первым - база данных или модели?

![EF approaches](/Module-5/images/ef-approaches.png)

- Database first - БД уже существует и мы работаем с ней
- Code first - на основании классов, описывающих предметную область

### Partial классы как способ расширения автогенеренных моделей

 Что делать, если нам необходимы некоторые изменения в автогенеренных моделях? Каждый раз Т4 сгенерирует их заново.

![Partial classes](/Module-5/images/partial-classes.png)

- Генерализация (общий признак)
- Упрощение обработки
- Добавление некоторого поведения

## Code First

![Code First](/Module-5/images/code-first-approach.png)

Мы начинаем со структуры классов.

![Code First Context Example](/Module-5/images/code-first-context-example.png)

Он не содержит ранее рассмотренных SSD/CSDL/MSL. 

**Как же происходит маппинг?**

### Fluent API

**Базовый набор команд**

| Конфигурация | Метод | Применение |
| ------------- |:------------------:| -----:|
| Model-wide Configurations | HasDefaultSchema() | Определяет схему по умолчанию |
| Model-wide Configurations | ComplexType() | Конфигурирует класс как Complex Type |
| Entity Configurations | HasIndex() | Определяет индекс для свойства |
| Entity Configurations | HasKey() | Задает первичный ключ для сущности |
| Entity Configurations | HasOptional() | Определяет часть Many в One-to-Many или Many-to-Many отношениях |
| Entity Configurations | HasRequired() | Определяет ненуллабл внешний ключ |
| Entity Configurations | Ignore() | Определяет что свойство не будет маппиться на столбец БД |
| Entity Configurations | Map() | Определяет имя таблицы для сущности |
| Entity Configurations | MapToStoredProcedures() | Маппинг на хранимые процедуры |
| Entity Configurations | ToTable() | Определяет имя таблицы для сущности |
| Property Configurations | HasColumnAnnotation() | Аннотация столбца |
| Property Configurations | IsRequired() | Обязательное поле при сохранении |
| Property Configurations | IsConcurrencyToken() | Поле будет использовать как оптимистичный concurrency token |
| Property Configurations | IsOptional() | Nuulable столбец в БД |
| Property Configurations | HasParameterName() | Параметр для хранимой процедуры |
| Property Configurations | HasDatabaseGeneratedOption()  | Значение по умолчанию |
| Property Configurations | HasColumnOrder() | Порядок столбца |
| Property Configurations | HasColumnType() | Тип данных |
| Property Configurations | HasColumnName() | Имя столбца |

![Пример контекста в Code First](/Module-5/images/code-first-context-example2.png)

## Миграции

Изменения модели влияют на структуру базы данных.

**Нежелательно менять структуру базы данных.**

![Migrations](/Module-5/images/migrations-scheme.png)

**Nuget Package Manager Console**

- Enable-Migrations
- Add-Migration <name>

## Стратегии наследования
Entity Framework предлагает несколько базовых стратегий реализации наследования в рамках структуры БД.
Полного соотвествия между поведением иерархии объектов и структурой таблиц - **НЕТ**!

### Table-per-Hierarchy

![TPH](/Module-5/images/table-per-hierarchy.png)

- Одна таблица для всей иерархии
- Сомнительная нормализация
- Столбец **Discriminator**

### Table-per-Type

![TPT](/Module-5/images/table-per-type.png)

- Структура таблиц соотвествует иерархии классов
- Нормализована
- Запросы с большим количеством JOIN

### Table-per-Type

![TPT](/Module-5/images/table-per-type.png)

- Структура таблиц соотвествует иерархии классов
- Нормализована
- Запросы с большим количеством JOIN
- класс-предок представлен в структуре, использует связь один-к-одному

### Table-per-ConcreteType

![TPT](/Module-5/images/table-per-concrete-type.png)

- Нет абстрактных классов
- Только фактические классы
- Нормализована
- Запросы с большим количеством JOIN

## Домашнее задание

1. Возвращаемся к проекту **Phonebook**
2. Сделать частичную реализацию для моделей домена
3. Перенести все генеренные поля в частичные классы в новом проекте
4. Реализовать уровень доступа к данным при помощи Code First
5. Добавить маркер логического удаления и применить миграцию

