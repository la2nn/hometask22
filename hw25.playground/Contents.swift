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

enum ShoppingList: UInt8 {
    case bread =    0b00000001
    case chicken =  0b00000010
    case apples =   0b00000100
    case pears =    0b00001000
}

var checkList: UInt8 = (ShoppingList.bread.rawValue | ShoppingList.pears.rawValue)

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

ShoppingList.isPurchased(.bread)            // true
ShoppingList.isPurchased(.chicken)          // false
ShoppingList.purchase(.chicken)
ShoppingList.isPurchased(.chicken)          // true
ShoppingList.removeItem(.bread)
checkList.binary()
ShoppingList.isPurchased(.bread)            // false

// 2. Создать цикл, который будет выводить 1 байтное число с одним установленным битом в такой последовательности, чтобы в консоли получилась вертикальная синусоида

enum Direction {
    case left
    case right
}

var sin: UInt8 = 0b00000001
var currentDirection: Direction = .left

for _ in 0..<16 {
    print(sin.binary())
    
    switch sin {
    case 0b00000001: currentDirection = .left
    case 0b10000000: currentDirection = .right
    default: break
    }
 
    switch currentDirection {
    case .left: sin = sin << 1
    case .right: sin = sin >> 1
    }
}

/* 3. Создайте 64х битное число, которое представляет клетки на шахматной доске. Установите биты так, что 0 - это белое поле, а 1 - черное. Младший бит это клетка а1 и каждый следующий байт начинается с клетки а (а2, а3, а4) и заканчивается клеткой h(h2, h3, h4). Выбирая клетки но индексу столбца и строки определите цвет клетки опираясь исключительно на значение соответствующего бита */

let chessboard: UInt64 = 0b10101010_01010101_10101010_01010101_10101010_01010101_10101010_01010101

enum Column: UInt64 {
    case A = 1, B, C, D, E, F, G, H
}

func cellColor(_ column: Column, _ row: UInt64) {
    
    guard 1...8 ~= row else {
        print("Дружище, шахматная доска 8х8, ты что-то попутал..")
        return
    }
    
    var pointer: UInt64 = 0b00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000001
    pointer = pointer << (row * column.rawValue - 1)
    pointer & chessboard != 0 ? print("This cell is black!") : print("This cell is white!")

}

cellColor(.A, 1)        // black
cellColor(.A, 2)        // white
cellColor(.G, 8)        // white
cellColor(.H, 8)        // black
cellColor(.H, 9)        // error
