/*1. Создайте расширение для Int с пропертисами isNegative, isPositive, bool
 
 2. Добавьте проперти, которое возвращает количество символов в числе
 
 3. Добавьте сабскрипт, который возвращает символ числа по индексу:
 
 let a = 8245
 
 a[1] // 4
 a[3] // 8
 
 Профи могут определить и сеттер :) */

extension Int {
    var isPositive: Bool { return self > 0 ? true : false }
    var isNegative: Bool { return self < 0 ? true : false }
    var isNeutral: Bool { return (!isPositive && !isNegative) ? true : false }
    var count: Int { return String(abs(self)).count }
    
    subscript(index: Int) -> Int {
        get {
            let str = String(abs(self)).reversed()                       // |self| обращаем в строку и переворачиваем
            if index + 1 > str.count {
                print("Ошибка ввода. Нельзя обратиться к \(index) элементу данного числа - его нема.")
                return 0
            }
            let result = Int(String(Array(str)[index]))                  // преобразованный в строку |self| разбиваем на элементы массива и вытаскиваем по index'у
           // return result != nil ? result! : 0  // дада можно было 2 строки записать в одну, но было бы страшно
            return result ?? 0
        }
        set {
            let str = String(abs(self)).reversed()
            if index + 1 > str.count {
                print("Ошибка ввода. Нельзя изменить \(index) элемент данного числа - его нема.")
                return
            }
            
            var numberArrayed = [Int]()                                 // создаю массив, куда будут складываться все числа типа Int, а не Character ( Array(str) будут Character все элементы )
            let result = Array(str)
            var resultString = ""                                       // да, можно было бы сделать var str и его removeAll, но после reversed он уже не типа String, поэтому создаю новую переменную
            
            for character in result {
                numberArrayed.append(Int(String(character))!)           // Закидываем в массив перевернутый |self|
            }
            
            numberArrayed[index] = newValue                             // то, ради чего мы здесь, меняем [index] на нужнуое значение
            
            for number in numberArrayed {
                resultString += String(number)                          // ну и теперь все закидываем строку
            }
            
            if self.isNegative {
                self = Int(String(resultString.reversed()))! * (-1)     // если self был отрицательный, то нужно шоби результат был отрицательный
            } else  {                                                   // форс анрап потому что проверка была выполнена выше
                self = Int(String(resultString.reversed()))!
            }
            
        }
    }
}

var b = -123496789
b[0] = 1
b[1] = 2
b[2] = 3
b[3] = 4
b[4] = 5
b[8] = 9
b[9] = 4        // тут выйдет сообщение об ошибке
print(b)

b.count
b.isPositive
b.isNegative
b.isNeutral

/* 4. Расширить String, чтобы принимал сабскрипт вида s[0..<3] и мог также устанавливать значения используя его

5. Добавить стрингу метод truncate, чтобы отрезал лишние символы и , если таковые были, заменял их на троеточие:

let s = "Hi hi hi"

s.truncate(4) // Hi h...

s.truncate(10) // Hi hi hi*/

extension String {
    subscript(range: Range<Int>) -> String {
        get {
            let start = index(startIndex, offsetBy: max(0, range.lowerBound))
            let end = index(startIndex, offsetBy: min(self.count, range.upperBound))
            return String(self[start..<end])
        }
        set {
            let start = index(startIndex, offsetBy: max(0, range.lowerBound))
            let end = index(startIndex, offsetBy: min(self.count, range.upperBound))
            self.removeSubrange(start..<end)
            self.insert(contentsOf: newValue, at: start)
        }
    }
    
    mutating func truncate(length: Int) -> String {
        let end = index(startIndex, offsetBy: min(self.count, length))
        if self.endIndex > end {
            return String(self[self.startIndex..<end]) + "..."
        }
        return String(self[self.startIndex..<end])          // не стал делать через statement ? ... : ..., выглядело страшно
    }
}

var testString = "Hello, Kirill and Stas!"
testString[1..<2]                           // "e"
testString[2..<4] = "HeLLLLOOOOO!!!!!!!!"   // Заменяются " ll "
print(testString)
testString[0..<3]                           // "HeH"

print(testString.truncate(length: 15))
print(testString.truncate(length: 41))


