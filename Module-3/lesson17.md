# Урок №15. Генерики

## Полезные ссылки

[Обобщения](https://metanit.com/sharp/tutorial/3.12.php)

[Ограничения генериков](https://metanit.com/sharp/tutorial/3.38.php)

[Наследование генериков](https://metanit.com/sharp/tutorial/3.39.php)

[Генерики](https://docs.microsoft.com/ru-ru/dotnet/standard/generics/collections)

[Generics, Introduction](https://www.geeksforgeeks.org/c-sharp-generics-introduction/)

![Generics](/Module-3/images/generics.png)

## Проблемы нетипизированных классов

* Boxing/unboxing

* Небезопасность приведения типов

## Обобщение, Generic

![Generics](/Module-3/images/generics-c.png)

Универсальные шаблоны – они же generics.

### Ковариантность

var asteroid = new Asteroid();
 
ICollidable collidable = asteroid;

Ковариантность - совместимость назначения (assignment compatibility).

### Значения по умолчанию

T _field = default(T);

* Ссылочные типы – null
* Значимые – 0

### Статика

Статические поля создаются для каждого конкретного типа

### Обобщенные методы

public double GetSumm<T> (T val)
{
}

public T GetSumm<T> (int a, int b)
{
}

### Обобщенные интерфейсы

public interface IBook<T>

### Ограничения генериков

public class Book<T> : IBook<T> where T : Book_obj

* where
* class
* struct
* new()

### Наследование генериков

* Одинаковая типизация
* Строгая типизация предка

### Универсальные коллекции

Строго типизированы во время компиляции

* ArrayList => List<T>

* HashTable => Dictionary<T, U>

* Stack => Stack<T>

* Queue => Queue<T>

### Строго универсальные коллекции

* SortedDictionary<TKey, TValue>
	IComparer<TKey>
	https://professorweb.ru/my/csharp/charp_theory/level12/12_11.php
* LinkedList<T>
	https://professorweb.ru/my/csharp/charp_theory/level12/12_8.php


## Домашнее задание

1. Теория
2. Сделать обобщенной кастомную коллекцию из предыдущего занятия
3. Сделать программку управления банковскими счетами. Счет характеризуется номером и остатком. 
Номер может быть как числом, так и строкой.