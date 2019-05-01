//Новичек

// 1. Почитать о том, что такое стек и очередь.
// 2. Используя протокол из прикрепленного фото, сделать расширение "Container" для класса "Array" таким образом, чтобы массивом можно было управлять как стеком. Небольшая подсказка, указывать в качестве типа данных вместо Self.Generator.Element нужно просто Element.

//Студент

// 3. Создать расширение протокола "Container", которое позволит управлять массивом, как очередью. О том, какие у очереди должны быть методы и свойства - почитайте в интернете.
// 4. Разберитесь, почему код не работает и какой тип данных необходимо использовать для того, чтобы все заработало.
// 5. Еще одной задачей для усложнения, окажется то, что изначально все работать не будет и вам придется разобраться какое наследование и полиморфизм нужно организовать в нашем проекте для того, чтобы это все заработало. Сделать это можно, изучив структуру наследования класса Array и того, какие протоколы он использует.

//Мастер

// 6. Создать протокол "CustomDictionary" который будет копировать базовый функционал обычного "Dictionary"
// 7. Создать еще одно расширение класса "Array" и назначить ему поддержку этого протокола и организовать работу всех функций.

// Звезда - это уже будет тяжело.

// 8. Разделите простокол Conteiner на три наследованных от него протокола Stack и Queue, CustomDictionary. Общие методы оставьте в контейнере, если они есть, остальной функционал разделите между ними
// 9. Вместо расширения структуры "Array" создайте три структуры - наследника от структуры "Array", каждая из них будет поддерживать разные протоколы (Stack, Queue, CustomDictionary). Тут вам придется серьезно разбираться в cтруктуре самого класса Array и того, какую структуру наследования протоколов нужно выстроить для полноценной работы этого проекта.

// Профи

// 10. Если вы дшли до этого момента, то пора расширить протокол и класс CustomDictionary для обеспечения полноценной работы словаря.
// 11. Сделайте обязательный инициализатор для "CustomDictionary"
// 12. Для проверки ввсего функционала воспользуйесь всеми функциями и структурами, которые сделали в этом ДЗ.
// 13. Создайте тип данных, который будет содержать коллекцию полученных нами протоколов.
// 14. Соберите несколько экземпляров полученных нами структур в один большой массив используя тип данных из задания 13, в цикле выполняйте действия по удалению и добавлению объектов в них, в процессе цикла нужно будет проверять объекты на соответствия тем или иным протоколам и выполнять для них соответствующие функции.


// 1 - почитал
// 2

protocol Container: RangeReplaceableCollection {
    mutating func pop() -> Element?
    mutating func push(element : Element)
    func peek() -> Element?
}

extension Array: Container {
    mutating func pop() -> Element? {
        return self.isEmpty ? nil : self.removeLast()
    }
    
    mutating func push(element : Element) {
        self.append(element)
    }
    
    func peek() -> Element? {
        return self.isEmpty ? nil : self.last
    }
}

// 3, 4, 5

extension Container {
    mutating func enqueue(element: Element) {
        self.insert(element, at: self.startIndex)
    }
    
    mutating func dequeue() -> Element? {
        return self.pop()
    }
}

var arr = [1, 2, 3, 4, 5]
arr.pop()
arr.pop()
arr.pop()
arr.push(element: 9)
arr.push(element: 44)
let lastElement = arr.peek()
arr.enqueue(element: 144)
arr.dequeue()


