# Урок №2. Основы .NET, основы C#

## Полезные ссылки

[CLR, CLS, CTS](https://www.codeproject.com/articles/781096/what-is-il-code-clr-cts-cls-jit)

[JIT](https://www.telerik.com/blogs/understanding-net-just-in-time-compilation)

[CTS](https://docs.microsoft.com/en-us/dotnet/standard/base-types/common-type-system)

[CLR](https://docs.microsoft.com/ru-ru/dotnet/standard/clr)

[Значимые и ссылочные типы данных](http://www.albahari.com/valuevsreftypes.aspx)

[Циклы в C#](http://csharp.net-tutorials.com/basics/loops/)


### JIT (Just-in-time-compilation)

![JIT](/module-1/images/jit.png)

### CTS (Common Type System, Общая система типов)

![CTS](/module-1/images/cts.png)

Таблицов типов CTS

![Типы CTS](/module-1/images/cts-datatypes.png)

### CLR (Common Language Runtime, Общеязыковая исполняющая среда)

![CLR](/module-1/images/clr.png)

### .NET Framework

![.NET Framework](/module-1/images/dotnet.png)

## Типы данных в .NET Framework

![Типы данных в .NET Framework](/images/dotnet-datatypes.png)

**Value (значимый тип)** – вся переменная хранится в стеке

**Reference (ссылочный тип)** – только ссылка на переменную хранится в стеке, тело переменной хранится в куче

![Ссылочные типы в .NET](/module-1/images/reference-datatype.png)

### Основные отличия типов данных в .NET

**a) - value types**
**б) - reference types**

1 Размещение типов: 

	а) в стеке
	
	б) в управляемой куче
	
2 Представление переменной: 

	а) в виде локальной копии
	
	б) в виде ссылки, указывающей на занимаемое соответствующим экземпляром место в памяти.
	
3 Наследование:

	а) наследуются от System.ValueType
	
	б) наследуются от любых других негерметизированных типов (кроме System.ValueType)
	
4 Может быть базовым классом:

	а) Нет. Типы-значения всегда являются герметизированными
	
	б) Да, если тип не герметизирован
	
5 Передача данных:

	а) Передаются по значению(т.е. копия переменной)
	
	б) Передаются по ссылке (т.е. адрес переменной)
	
6 Можно ли определять конструкторы: 

	а) Да, но имеется зарезервированный конструктор по умолчанию
	
	б) Да
	
7 Когда прекращают существование:

	а) Когда выходят за рамки того контекста, в котором определялись.
	
	б) Когда объект подвергается сборке мусора.
	


### Структура типов данных

![Типы данных в .NET](/images/dotnet-types.png)

## Условия в C#

* **>**  - больше
* **>=**  - больше или равно
* **<** - меньше
* **<=** - меньше или равно
* **==** - равно
* **!= ** - не равно

### Условные операторы

#### if

![Структура условного оператора](/images/conditions.png)

if (**condition1**) 

{

    Условие 1 выполняется
	
}

else if (condition2) 

{

    Условие 1 не выполняется, но выполняется условие 2
	
}

else 

{

    Ни одно из условий не выполнилось
	
}


#### switch

switch (condition)

     case option1:
           
            break;
			
	case option2:
           
            break;
			
	default:
	
		break;

### Циклы в C#

#### while() {}

while (*condition*)

{

	// Выполняется пока условие верно
	
}

#### do {} (while)

do  

{

	// Выполняется пока условие верно
	
} 

while (condition)

**Выполнится хотя бы один раз!!!**

#### for ()

for (int i=0; i < *iterationCount*; i++) 

{

}


### Домашнее задание

Задача: Начав тренировки, лыжник в первый день пробежал 10 км. Через каждый следующий день (между тренировками один день интервала) он увеличивал пробeг на 10% от пробега предыдущего дня. Определить в какой день суммарный пробег за все дни превысит 100 км. 
	
**Подсказка – оператор ‘%’ – остаток от деления**

