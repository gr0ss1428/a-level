# Урок №6. Еще немного про C#

## Полезные ссылки

[Properties](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/properties)

[ref Vs out](http://www.c-sharpcorner.com/UploadFile/ff2f08/ref-vs-out-keywords-in-C-Sharp/)

[Структуры](https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/classes-and-structs/structs)

[Enums](https://metanit.com/sharp/tutorial/2.12.php)

[Массивы](https://professorweb.ru/my/csharp/charp_theory/level4/4_1.php)

[Debugging](https://www.dotnetperls.com/debugging)

[Debugging](http://csharp.net-tutorials.com/debugging/introduction/)

[Debugging in Visual Studio](https://msdn.microsoft.com/ru-ru/library/sc65sadd.aspx)

[Managing Exceptions with the Debugger](https://msdn.microsoft.com/ru-ru/library/x85tt0dd.aspx)

## ref vs out

* Сколько параметров может возвращать функция?
* Еще одна переменная должна быть изменена.
* «Магия» с классами

![ref-vs-out](/Module-1/images/ref-vs-out.png)

## Enums

* Набор именованных констант
* Состояния приложения
* Switch instead of if.. else if

![enums](/Module-1/images/enums.png)

## Массивы

![Массивы](/Module-1/images/array.png)

**Свойства массива**

* Постоянный размер
* Строгая типизация

int[] array = new int[5] { 11, 22, 33, 44, 55 }; 

int[] array = new int[5];

array[0] = 0;
array[1] = 1;
array[2] = 2;
array[3] = 3;
array[4] = 4;

### Размерность массива

array[5] = 5;

![Переполнение массива](/Module-1/images/array-overflow.png)

![Размер массива](/Module-1/images/array-const-length.png)

### Многомерные массивы

int[, ,] array = new int[4, 2, 5];

## Отладка (debugging)

![Debugging](/Module-1/images/debugging.png)

В процессе работы программы значения переменных изменяются.

Как увидеть?

Пример. А если условие???

![Запустить отладку](/Module-1/images/f5.png)

### Точки останова (breakpoints)

![Breakpoint](/Module-1/images/breakpoint.png)

![Breakpoint with condition](/Module-1/images/breakpoint-with-condition.png)

![Условие](/Module-1/images/condition.png)

## Домашнее задание

- Debugging
- Зубчатые массивы

- В программу вводится одномерный массив целых чисел. Вводится с клавиатуры – в начале размер, 
потом по очереди элементы. При вводе необходимо отметить какой элемент вводится. Ввод должен быть 
проверен на корректность, массив хранится в отдельном классе, метод которого вычисляет среднее арифметическое 
положительных элементов, значение которых больше К (также с клавиатуры) и 
заменить им первый элемент массива. Показать первый элемент массива.

* Расширить предыдущую программу путем ввода состояния расчета. 
Для положительного К – оставляем алгоритм неизменным, для отрицательного – берем сумму всех элементов, 
которые меньше К и заменяем ей первый элемент.