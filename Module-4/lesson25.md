# Урок №23. ADO.NET

## Полезные ссылки

[ADO.NET от Microsoft](https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/ado-net-overview)

[Еще немного про ADO.NET](https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/)

[И еще немного...](https://msdn.microsoft.com/en-us/library/aa286484.aspx)

[Руководство по ADO.NET и работе с базами данных](https://metanit.com/sharp/adonet/)

[Connected vs Disconnected connection modes in ADO.NET](https://www.c-sharpcorner.com/UploadFile/8a67c0/connected-vs-disconnected-architecture-in-C-Sharp/)

## Основные понятия

![Как это устроено?](/Module-5/images/adonet-pipeline.png)

**ADO.NET** предоставляет собой технологию работы с данными, которая основана на платформе .NET Framework. 
Эта технология представляет нам набор классов, через которые мы можем отправлять запросы к базам данных, 
устанавливать подключения, получать ответ от базы данных и производить ряд других операций.

Систем управления базами данных может быть несколько и они могут быть различными.

Основной набор объектов, используемый в ADO.NET:

- Connection
- Command
- DataSet
- DataReader
- DataAdapter

## Connected/Disconnected modes

![Connected/Disconnected modes](/Module-5/images/connected-vs-disconnected-ds.png)

** Disconnected mode**

- Открыть соединение
- Получить данные 
- Закрыть соединение


** Connected mode ** 

- Открыть соединение
- Держать соединение открытым
- Закрыть соединение при вызове метода Close()


## ConnectionString (строка соединения)

Ваш пропуск для доступа к базе данных.

![Connection String](/Module-5/images/connection-string.png)

**Основные параметры**

- **Data Source**: название экземпляра SQL Servera, с которым будет идти взаимодействие
- **Initial Catalog**: хранит имя базы данных
- **Integrated Security**: задает режим аутентификации.
- **User ID**: логин пользователя
- **Password**: пароль пользователя


## Работа с данными

1. Создаем соединение
2. Создаем экземпляр SqlCommand
3. **Execute** или получение данных

![Работа с хранимой процедурой](/Module-5/images/sp_call.png)

**НЕ ЗАБЫВАЕМ**

- Указать тип комманды - StoredProcedure
- Передать набор параметров (при необходимости)

## Домашнее задание

1. Возвращаемся к проекту **Phonebook**
2. Необходимо реализовать получение всех данных по теблицам Group, Contact, Phone
3. Сделать отдельное представление "Телефоны", телефон должен включать в себя и контакт, и группу
