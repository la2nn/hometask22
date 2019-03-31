/*1. Расширьте енум из урока и добавьте в него метод, помогающий установить соответствующий бит в переданную маску и метод, помогающий его прочитать. Эти методы должны принимать и возвращать маску, либо принимать адрес маски и менять его */

extension UInt8 {
    func binary() -> String {
        var result = ""
        for i in 0..<8 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
}

extension UInt64 {
    func binary() -> String {
        var result = ""
        for i in 0..<8 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
}


enum ShoppingList: UInt8 {
    case Bread =    0b00000001
    case Chicken =  0b00000010
    case Apples =   0b00000100
    case Pears =    0b00001000
}

var checkList: UInt8 = 0b00001001

extension ShoppingList {
    static func isPurchased(_ item: ShoppingList) -> Bool {
        return (checkList & item.rawValue) != 0
    }
    
    static func purchase(_ item: ShoppingList) {
        checkList = (checkList | item.rawValue)
    }
    
    static func removeItem(_ item: ShoppingList) {
        checkList = (checkList & ~item.rawValue)
    }
}

ShoppingList.isPurchased(.Bread)            // true
ShoppingList.isPurchased(.Chicken)          // false
ShoppingList.purchase(.Chicken)
ShoppingList.isPurchased(.Chicken)          // true
ShoppingList.removeItem(.Bread)
checkList.binary()
ShoppingList.isPurchased(.Bread)            // false

// 2. Создать цикл, который будет выводить 1 байтное число с одним установленным битом в такой последовательности, чтобы в консоли получилась вертикальная синусоида

enum Direction {
    case Left
    case Right
}

var sin: UInt8 = 0b00000001
var currentDirection = Direction.Left

for _ in 0..<16 {
    print(sin.binary())
    
    switch sin {
    case 0b00000001: currentDirection = .Left
    case 0b10000000: currentDirection = .Right
    default: break
    }
 
    switch currentDirection {
    case .Left: sin = sin << 1
    case .Right: sin = sin >> 1
    }
}

/* var a: UInt8 = 0b00000001
var b: UInt8 = 0b11111110
a.binary()
b.binary()
a << 2
(a|b).binary()  // 0 + 0 = 0, иначе 1
(a&b).binary()  // 1 + 1 = 1, иначе 0
(a & ~b).binary()
(a^b).binary()  // 1 + 0 = 1 , иначе 0
(~a).binary()   // инверсия */

/* 3. Создайте 64х битное число, которое представляет клетки на шахматной доске. Установите биты так, что 0 - это белое поле, а 1 - черное. Младший бит это клетка а1 и каждый следующий байт начинается с клетки а (а2, а3, а4) и заканчивается клеткой h(h2, h3, h4). Выбирая клетки но индексу столбца и строки определите цвет клетки опираясь исключительно на значение соответствующего бита */

let chessboard: UInt64 = 0b10101010_01010101_10101010_01010101_10101010_01010101_10101010_01010101

enum Column: UInt64 {
    case A = 1, B, C, D, E, F, G, H
}

func mask(_ column: Column, _ row: UInt64) -> UInt64 {
    return 1 << (column.rawValue * 8 + row)
}

func cellColor(_ column: Column, _ row: UInt64) {
    if row == 8 && column == .H { return print("White") }
    return (chessboard & mask(column, row) != 0) ? print("Black") : print("White")
}

cellColor(.A, 1)        // white
cellColor(.A, 2)        // white
cellColor(.G, 8)        // whie

