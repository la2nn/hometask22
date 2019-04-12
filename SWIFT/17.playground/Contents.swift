/* Шахматная доска (Легкий уровень)
 
 1. Создайте тип шахматная доска.
 2. Добавьте сабскрипт, который выдает цвет клетки по координате клетки (буква и цифра).
 3. Если юзер ошибся координатами - выдавайте нил
 
 Крестики нолики (Средний уровень)
 1. Создать тип, представляющий собой поле для игры в крестики нолики
 На каждой клетке может быть только одно из значений: Пусто, Крестик, Нолик
 Добавьте возможность красиво распечатывать поле
 2. Добавьте сабскрипт, который устанавливает значение клетки по ряду и столбцу,
 причем вы должны следить за тем, чтобы программа не падала если будет введен не существующий ряд или столбец.
 3. Также следите за тем, чтобы нельзя было устанавливать крестик либо нолик туда, где они уже что-то есть. Добавьте метод очистки поля.
 4. Если хотите, добавте алгоритм, который вычислит победителя
 
 Морской бой (Тяжелый уровень)
 1. Создайте тип корабль, который будет представлять собой прямоугольник. В нем может быть внутренняя одномерная система координат (попахивает сабскриптом). Корабль должен принимать выстрелы по локальным координатам и вычислять когда он убит
 2. Создайте двумерное поле, на котором будут располагаться корабли врага. Стреляйте по полю и подбейте вражеский четырех трубник :)
 3. Сделайте для приличия пару выстрелов мимо, красивенько все выводите на экран :) */

// Задание 1

struct Chessboard {
    let rows = 1...8
    let columns = ["A", "B", "C", "D", "E", "F", "G", "H"]
    let oddColumns = ["B", "D", "F", "H"]
    
    enum CellColor: String {
        case white = "⬜"
        case black = "⬛"
    }
    
    func isLetterOdd(letter: String) -> Bool {
        return oddColumns.contains(letter) == true ? true : false
    }
    
    subscript(column: String, row: Int) -> String? {
        if columns.contains(column.uppercased()) && rows ~= row {
            if !isLetterOdd(letter: column.uppercased())  {
                return row%2 == 1 ? CellColor.black.rawValue : CellColor.white.rawValue
            } else {
                return row%2 == 1 ? CellColor.white.rawValue : CellColor.black.rawValue
            }
        }
        return nil
    }
}

var chessboard = Chessboard()
chessboard["a", 3]
chessboard["B", 3]
chessboard["123", 14]
chessboard["Z", 1]
chessboard["F", 0]

// Задание 2
var xTurnIsNow = true
var countOfTurns = 0

struct TicTacToe {
    static let width = 1...3
    static let height = 1...3
    
    struct Coordinate: Hashable {
        var x = Int()
        var y = Int()
    }
    
    enum TypeOfCell: String {
        case x = "❌"
        case o = "⭕"
        case space = "🔲"
    }
    
    func printField() {
        print()
        for y in TicTacToe.height {
            var currentString = ""
            for x in TicTacToe.width {
                switch gameField[Coordinate(x: x, y: y)] {
                case .x?: currentString += TypeOfCell.x.rawValue + " "
                case .o?: currentString += TypeOfCell.o.rawValue + " "
                case .space?: currentString += TypeOfCell.space.rawValue + " "
                default: break
                }
            }
            print(currentString)
        }
    }
    
    func isCellEmpty(position: Coordinate) -> Bool {
        return gameField[position] == .space ? true : false
    }
    
    func checkWin() -> Int {                  // 0 - выйграл X, 1 - выйграл O, 2 - ничья, т.к. поле заполнено, 3 - игра продолжается
        
        var countAtVertical = [0, 0]          // countAtVertical[0] - счет за X, countAtVertical[1] - счет за О
        var countAtHorizontal = [0, 0]        // countAtHorizontal[0] - счет за X, countAtHorizontal[1] - счет за О
        
        for y in TicTacToe.height {
            for x in TicTacToe.width {
                let currentKey = Coordinate(x: x, y: y)
                if gameField[currentKey] == .x {
                }
                if gameField[currentKey] == .o {
                    countAtHorizontal[1] += 1
                }
            }
            if countAtHorizontal[0] == 3 {
                return 0
            }
            if countAtHorizontal[1] == 3 {
                return 1
            }
            countAtHorizontal[0] = 0
            countAtHorizontal[1] = 0
        }
        
        for x in TicTacToe.width {
            for y in TicTacToe.height {
                let currentKey = Coordinate(x: x, y: y)
                if gameField[currentKey] == .x {
                    countAtVertical[0] += 1
                }
                if gameField[currentKey] == .o {
                    countAtVertical[1] += 1
                }
            }
            if countAtVertical[0] == 3 {
                return 0
            }
            if countAtVertical[1] == 3 {
                return 1
            }
            countAtVertical[0] = 0
            countAtVertical[1] = 0
        }
        
        // Считаем на главной диаганали
        if gameField[Coordinate(x: 1, y: 1)] == .x && gameField[Coordinate(x: 2, y: 2)] == .x && gameField[Coordinate(x: 3, y: 3)] == .x { return 0 }
        if gameField[Coordinate(x: 1, y: 1)] == .o && gameField[Coordinate(x: 2, y: 2)] == .o && gameField[Coordinate(x: 3, y: 3)] == .o { return 1 }
        
        // Считаем на побочной диагонали
        if gameField[Coordinate(x: 3, y: 1)] == .x && gameField[Coordinate(x: 2, y: 2)] == .x && gameField[Coordinate(x: 1, y: 3)] == .x { return 0 }
        if gameField[Coordinate(x: 3, y: 1)] == .o && gameField[Coordinate(x: 2, y: 2)] == .o && gameField[Coordinate(x: 1, y: 3)] == .o { return 1 }
        
        if isFieldFilled() { return 2 }
        
        return 3
    }
    
    func isFieldFilled() -> Bool {
        return countOfTurns == 9 ? true : false
    }
    
    func clearField() {
        for x in TicTacToe.height {
            for y in TicTacToe.width {
                gameField[Coordinate(x: x, y: y)] = .space
            }
        }
        xTurnIsNow = true
        print("Поле успешно очищено")
        printField()
    }
    
    subscript(coordinate: Coordinate) -> String {
        get {
            return ("")
        }
        
        set {
            let symbol = newValue.uppercased()
            let currentKey = Coordinate(x: coordinate.x, y: coordinate.y)
            
            if symbol != "X" && symbol != "O" {
                return print("Ошибка ввода")
            }
            
            guard (xTurnIsNow && symbol == "X") || (!xTurnIsNow && symbol == "O") else {
                print("Сейчас ходит другая сторона!")
                return
            }
            
            if TicTacToe.width ~= coordinate.x && TicTacToe.height ~= coordinate.y {
                if isCellEmpty(position: coordinate) {
                    switch xTurnIsNow {
                    case true :
                        if symbol == "X" {
                            xTurnIsNow = false
                            gameField[currentKey] = .x
                            countOfTurns += 1
                        }
                    case false:
                        if symbol == "O" {
                            xTurnIsNow = true
                            gameField[currentKey] = .o
                            countOfTurns += 1
                        }
                    }
                    printField()
                } else {
                    print("Клетка занята \n")
                }
            } else {
                print("Ошибка ввода. x∈[1...3], y∈[1...3]")
            }
            switch checkWin() {
            case 0:
                print("Победа за ❌")
                print("Новое поле..")
                clearField()
                countOfTurns = 0
            case 1:
                print("Победа за ⭕")
                print("Новое поле..")
                clearField()
                countOfTurns = 0
            case 2:
                print("Ничья")
                print("Новое поле..")
                clearField()
                countOfTurns = 0
            default: break
            }
        }
    }
}

var gameField = [TicTacToe.Coordinate : TicTacToe.TypeOfCell]()

func createFieldAtFirstTime() {
    for x in TicTacToe.height {
        for y in TicTacToe.width {
            gameField[TicTacToe.Coordinate(x: x, y: y)] = .space
        }
    }
    print("Поле успешно cоздано!")
}

createFieldAtFirstTime()
// Очередность ходов - сначала Х, затем О. После победы первый ход за Х !!!

var justField = TicTacToe()
/*justField[TicTacToe.Coordinate(x: 1, y: 1)] = "X"
 justField[TicTacToe.Coordinate(x: 1, y: 2)] = "O"
 justField[TicTacToe.Coordinate(x: 1, y: 3)] = "X"
 justField[TicTacToe.Coordinate(x: 2, y: 1)] = "O"
 justField[TicTacToe.Coordinate(x: 2, y: 2)] = "X"
 justField[TicTacToe.Coordinate(x: 2, y: 3)] = "O"
 justField[TicTacToe.Coordinate(x: 3, y: 1)] = "X"      // Победа за иксами, но следующий ход пытаются начать с О!
 justField[TicTacToe.Coordinate(x: 3, y: 2)] = "O"
 justField[TicTacToe.Coordinate(x: 3, y: 3)] = "X"*/

/* justField[TicTacToe.Coordinate(x: 2, y: 2)] = "X"
 justField[TicTacToe.Coordinate(x: 3, y: 3)] = "O"
 justField[TicTacToe.Coordinate(x: 2, y: 3)] = "X"
 justField[TicTacToe.Coordinate(x: 1, y: 3)] = "O"
 justField[TicTacToe.Coordinate(x: 1, y: 1)] = "X"
 justField[TicTacToe.Coordinate(x: 1, y: 2)] = "O"
 justField[TicTacToe.Coordinate(x: 3, y: 1)] = "X"
 justField[TicTacToe.Coordinate(x: 2, y: 1)] = "O"
 justField[TicTacToe.Coordinate(x: 3, y: 2)] = "X"  ничья */

/* justField[TicTacToe.Coordinate(x: 3, y: 3)] = "X"
justField[TicTacToe.Coordinate(x: 3, y: 1)] = "O"
justField[TicTacToe.Coordinate(x: 2, y: 3)] = "X"
justField[TicTacToe.Coordinate(x: 2, y: 2)] = "O"
justField[TicTacToe.Coordinate(x: 1, y: 1)] = "X"
justField[TicTacToe.Coordinate(x: 1, y: 3)] = "O" */

justField[TicTacToe.Coordinate(x: 1, y: 1)] = "X"
justField[TicTacToe.Coordinate(x: 2, y: 1)] = "X"
justField[TicTacToe.Coordinate(x: 3, y: 1)] = "X"
justField[TicTacToe.Coordinate(x: 4, y: 1)] = "O"
justField[TicTacToe.Coordinate(x: 3, y: 1)] = "O"

/*justField[TicTacToe.Coordinate(x: 2, y: 1)] = "O"
justField[TicTacToe.Coordinate(x: 3, y: 1)] = "X"
justField[TicTacToe.Coordinate(x: 1, y: 2)] = "O"
justField[TicTacToe.Coordinate(x: 2, y: 2)] = "X"
justField[TicTacToe.Coordinate(x: 3, y: 2)] = "O"
justField[TicTacToe.Coordinate(x: 2, y: 3)] = "X"
justField[TicTacToe.Coordinate(x: 1, y: 3)] = "O"
justField[TicTacToe.Coordinate(x: 3, y: 3)] = "X"*/
