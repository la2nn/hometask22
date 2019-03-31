/*1. Создайте расширение для Int с пропертисами isNegative, isPositive, bool
 2. Добавьте проперти, которое возвращает количество символов в числе
 3. Добавьте сабскрипт, который возвращает символ числа по индексу:
 let a = 8245
 a[1] // 4
 a[3] // 8
 Профи могут определить и сеттер :) */

extension Int {
    var isPositive: Bool { return self > 0 }
    var isNegative: Bool { return self < 0 }
    var isNeutral: Bool { return self == 0 }
    var count: Int { return String(abs(self)).count }
    
    subscript(index: Int) -> Int {
        get {
            let str = String(abs(self)).reversed()                       // |self| обращаем в строку и переворачиваем
           
            guard str.count >= index + 1 else {
                print("Ошибка ввода. Нельзя обратиться к \(index) элементу данного числа - его нема.")
                return 0
            }
         
            return Int(String(Array(str)[index])) ?? 0                   // преобразованный в строку |self| разбиваем на элементы массива и вытаскиваем по index'у
        }
        set {
            let str = String(abs(self)).reversed()
            
            guard str.count >= index + 1 else {
                print("Ошибка ввода. Нельзя обратиться к \(index) элементу данного числа - его нема.")
                return
            }

            var numberArrayed = [Int]()                                  // создаю массив, куда будут складываться все числа типа Int, а не Character ( Array(str) будут Character все элементы )
            let result = Array(str)
            var resultString = ""                                        // да, можно было бы сделать var str и его removeAll, но после reversed он уже не типа String, поэтому создаю новую переменную
            
            numberArrayed = result.map { Int(String($0)) ?? 0 }          // Закидываем в массив перевернутый |self|
            numberArrayed[index] = newValue                              // меняем [index] на нужное значение
            
            for number in numberArrayed {
                resultString += String(number)                           // ну и теперь все закидываем строку
            }
            
            isNegative ? (self = (Int(String(resultString.reversed())) ?? 0) * (-1)) : (self = Int(String(resultString.reversed())) ?? 0)
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
            let end = index(startIndex, offsetBy: min(count, range.upperBound))
            return String(self[start..<end])
        }
        set {
            let start = index(startIndex, offsetBy: max(0, range.lowerBound))
            let end = index(startIndex, offsetBy: min(count, range.upperBound))
            removeSubrange(start..<end)
            insert(contentsOf: newValue, at: start)
        }
    }
    
    mutating func truncate(length: Int) -> String {
        let end = index(startIndex, offsetBy: min(count, length))
        return endIndex > end ? (String(self[startIndex..<end]) + "...") : String(self[startIndex..<end])
    }
}

var testString = "Hello, Kirill and Stas!"
testString[1..<2]                           // "e"
testString[2..<4] = "HeLLLLOOOOO!!!!!!!!"   // Заменяются " ll "
print(testString)
testString[0..<3]                           // "HeH"

print(testString.truncate(length: 15))
print(testString.truncate(length: 4444))


