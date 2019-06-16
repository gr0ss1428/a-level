# Урок №24. Model-View-Controller

## Полезные ссылки

[MVC Pattern](​https://dotnet.microsoft.com/apps/aspnet/mvc)

[Руководство по ASP.NET MVC 5](https://metanit.com/sharp/mvc5/)

[ASP.NET MVC, уроки](https://habr.com/ru/post/175999/)

## MVC 

Концепция паттерна MVC (model - view - controller) предполагает разделение приложения на три компонента:

**Контроллер** (controller) представляет класс, обеспечивающий связь между пользователем и системой, представлением и хранилищем данных. Он получает вводимые пользователем данные и обрабатывает их. И в зависимости от результатов обработки отправляет пользователю определенный вывод, например, в виде представления.

**Представление (view)** - это собственно визуальная часть или пользовательский интерфейс приложения. Как правило, html-страница, которую пользователь видит, зайдя на сайт.

**Модель (model)** представляет класс, описывающий логику используемых данных.

![MVC](/Module-4/images/mvc-pattern.png)

Паттерн реализует концепцию разделение ответственности, в связи с чем легче построить работу 
над отдельными компонентами.

## Практика

Создаем MVC проект, Phonebook. Он умеет работать с группами контактов и контактами.

Детально смотрим на создание контроллеров, моделей, представлений.

## Жизненный цикл в MVC

![Жизненный цикл MVC страницы](/Module-4/images/mvc-pipeline-simple.png)

Тоже самое более глубоко

## Routing или маршрутизация

![Маршрутизация](/Module-4/images/mvc-routing.png)

**RouteConfig.cs**

![Маршрутизация](/Module-4/images/mvc-routing-definition.png)

## Partial Views

Action может также возвращать частичные представления. Их отличительной особенностью является то, 
что их можно встраивать в другие обычные представления. Частичные представления могут использоваться также 
как и обычные, однако наиболее удобной областью их использования является рендеринг результатов AJAX-запроса.

![Частичные представления](/Module-4/images/partial-views.png)

## Что мы можем вернуть из Action?

* ViewResult - View(), Рендерит View как веб-страницу

* PartialViewResult - PartialView(), Рендерит View как PartialView

* RedirectResult - Redirect(), редирект

* RedirectToRouteResult - RedirectToRoute(), Редирект на другой action метод

* ContentResult - Content(), Возвращает определенный пользователем тип

* JsonResult - Json(), JSON

* JavaScriptResult - JavaScript(), JavaScript

* FileResult - File()

* EmptyResult - none

## Атрибуты валидации

* Required

* StringLength

* Range

* RegularExpression

* CreditCard

* CustomValidation

* EmailAddress

* FileExtension

* MaxLength

* MinLength

* Phone

## Результаты валидации

@Html.ValidationSummary

@Html.ValidationMessageFor

## Домашнее задание

1. **Теория**

2. Реализовать костяк  MVC приложения для  Phonebook. Костяк в себя включает:

- Частичные представления для повторяющегося фунционала

- Валидацию ввода