# Урок №16. Коллекции

## Полезные ссылки

[Необобщенные коллекции](https://metanit.com/sharp/tutorial/4.2.php)

[IEnumerable](https://msdn.microsoft.com/ru-ru/library/system.collections.ienumerable(v=vs.110).aspx)

[IEnumerable<T>](https://msdn.microsoft.com/ru-ru/library/9eekhta0(v=vs.110).aspx)

[Интерфейсы IEnumerable & IEnumerator](https://metanit.com/sharp/tutorial/4.11.php)

[IEnumerator](https://msdn.microsoft.com/ru-ru/library/system.collections.ienumerator(v=vs.110).aspx)

[Итераторы и оператор yield](https://metanit.com/sharp/tutorial/4.12.php)

[ArrayList](https://msdn.microsoft.com/ru-ru/library/system.collections.arraylist(v=vs.110).aspx)


## IEnumerable (перечисляемое)

### Коллекции

![Коллекции](/Module-3/images/collections.png)

### Пример перечисления из коробки

for (int i = 0; i< 100;i++)
{
 …
}

foreach (var m in obj)
{
…
}

### Собственное перечисление

class Parking : IEnumerable
{
      private Car[] cars = new Car[];

      …

     public IEnumerator GetEnumerator()
     {
           return cars.GetEnumerator();
     }
}

### Зубчатые массивы

![Jagged arrays](/Module-3/images/jagged-arrays.png)

int[][] jaggedArray = new int[3][];
jaggedArray[0] = new int[2];
jaggedArray[0][0] = 1;
jaggedArray[0][1] = 2;

jaggedArray[1] = new int[1];
jaggedArray[1][0] = 3;

## +/- массивов

* Постоянный размер
* Строгая типизация
 
object[] array = new object[5]();
* Boxing & Unboxing

## Универсальная коллекция

**Строго типизирована!	**

Использование универсальных коллекций является рекомендуемой практикой, поскольку 	
при этом сразу же обеспечивается безопасность типов без необходимости наследования 	
от базового типа коллекции и реализации элементов определенного типа. Типы 	универсальных коллекций 
обычно работают лучше, чем соответствующие типы неуниверсальных коллекций 
(и лучше, чем типы, являющиеся производными от базовых 	типов неуниверсальных коллекций), если элементами 
коллекции являются типы значений, поскольку при использовании универсальных коллекций упаковывать элементы 
не требуется.

## Неуниверсальные коллекции

* ArrayList
* HashTable
* SortedList
* Stack
* Queue

## Словари данных

![Dictionaries](/Module-3/images/dictionaries.png)

* Пара ключ-значение
* Каждый ключ уникален
* DictionaryEntry
* HashTable

## LIFO (stack)

![Stack](/Module-3/images/stack.png)

## FIFO (queue)

![Queue](/Module-3/images/queue.png)

## YIELD

Возвращает значение не выходя из метода

![Yield](/Module-3/images/yield.png)

## Домашнее задание

1. Теория
2. Сделать класс автомобиль ( Car), параметры опциональны. Сделать класс Cars, реализующий IEnumerable.
3. Заполнить коллекцию, делать вызовы как через foreach, так и при помощи yield