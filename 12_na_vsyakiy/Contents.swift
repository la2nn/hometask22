/* 1. Создать энум с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции.
 Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур
 
 2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название.
 Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.
 
 3. Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку.
 Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)
 
 4. Создайте функцию, которая будет принимать шахматную фигуру и тюпл новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах (для мегамонстров программирования). Вызовите эту функцию для нескольких фигур и распечатайте поле снова. */


// Задание 1

enum Chess {
    
    enum Figure: String {
        case Pawn = "Pawn"
        case Rook = "Rook"
        case Knight = "Knight"
        case Bishop = "Bishop"
        case Queen = "Queen"
        case King = "King"
    }
    
    enum Color: String {
        case White = "White"
        case Black = "Black"
    }
    
    enum Horizontal: String {
        case A = "A"
        case B = "B"
        case C = "C"
        case D = "D"
        case E = "E"
        case F = "F"
        case G = "G"
        case H = "H"
    }

    enum Vertical: Int {                                            // Неявно установленные исходные значения
        case One = 1, Two, Three, Four, Five, Six, Seven, Eight     // print(Chess.Vertical.Two.rawValue) ---> вернет 2
    }
    
}

typealias Chessman = (type: Chess.Figure, color: Chess.Color, horizPos: Chess.Horizontal, vertPos: Chess.Vertical)

let whiteKing = Chessman(.King, .White, .G, .Seven)
let blackKing = Chessman(.King, .Black, .G, .Five)
let blackPawn = Chessman(.Pawn, .Black, .G, .Four)
let whiteRook1 = Chessman(.Rook, .White, .E, .Five)
let whiteRook2 = Chessman(.Rook, .White, .H, .Two)
let whiteKnight = Chessman(.Knight, .White, .E, .Two)

let arrayOfFigures = [whiteKing, blackKing, blackPawn, whiteRook1, whiteRook2, whiteKnight]

// Задание 2

func printFigure(_ arrayOfChessman: [Chessman]) {
    
    for figure in arrayOfChessman {
        
        print("Figure: \(figure.0.rawValue), color: \(figure.1.rawValue), at: \(figure.2.rawValue, figure.3.rawValue)")
        // Почему нельзя так: print("Figure: \(Chess.Figure.rawValue), ..... ) ?
        
    }
}

printFigure(arrayOfFigures)
print("\n")

// Задание 3

let blackChessman = ["King": "♚", "Queen": "♛", "Rook": "♜", "Bishop": "♝", "Knight": "♞", "Pawn": "♟️"]
let whiteChessman = ["King": "♔", "Queen": "♕", "Rook": "♖", "Bishop": "♗", "Knight": "♘", "Pawn": "♙"]

func printChessBoard(_ figures: [Chessman]) {
    
    // Создаем поле
    
    var y = 8
    
    while y != 0 {                      // Создание поля по вертикали
        var string = String()
        
        for x in 1...8 {                // Создание поля по горизонтали
            var cellEmpty = true
            
            // Каждой клетке по горизонтали присвоим соответсвтующую букву
            var horiz = String()
            switch x {
                case 1: horiz = "A"
                case 2: horiz = "B"
                case 3: horiz = "C"
                case 4: horiz = "D"
                case 5: horiz = "E"
                case 6: horiz = "F"
                case 7: horiz = "G"
                case 8: horiz = "H"
            default: break
            }
            
            for figure in arrayOfFigures {
                switch figure {
                    case (let type, let color, let horizPos , let vertPos) where horizPos.rawValue == horiz && vertPos.rawValue == y:
                        cellEmpty = false
                        var dict = [String: String]()
                    
                        switch color {
                            case .Black: dict = blackChessman
                            case .White: dict = whiteChessman
                        }
                    string.append(dict[type.rawValue]!)          // Рисуем фигуры и избавляемся от Optional
                    
                default: break
                }
            }
            if cellEmpty {
                string.append((x % 2 == y % 2) ? "⬛" : "⬜")
            }
            string.append(" ")                                  // Пробелы между клетками для "красоты"
        }
        y -= 1
    print(y+1, string)
    }
    print("  ","A"," B"," C"," D", " E", " F", " G", " H")
}

printChessBoard(arrayOfFigures)


// Задание 4  4. Создайте функцию, которая будет принимать шахматную фигуру и тюпл новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах (для мегамонстров программирования). Вызовите эту функцию для нескольких фигур и распечатайте поле снова. */

func movement(_ startPos: (String, Int), endPos: (String, Int),_ closure: (Int, Int) -> Bool) -> Bool {

    if startPos == endPos {
        print("Нельзя ходить на месте!")
    }
    
    var horizStart = Int()
    switch startPos.0 {
        case "A": horizStart = 1
        case "B": horizStart = 2
        case "C": horizStart = 3
        case "D": horizStart = 4
        case "E": horizStart = 5
        case "F": horizStart = 6
        case "G": horizStart = 7
        case "H": horizStart = 8
        default: break
    }
    
    var horizEnd = Int()
    switch startPos.0 {
        case "A": horizEnd = 1
        case "B": horizEnd = 2
        case "C": horizEnd = 3
        case "D": horizEnd = 4
        case "E": horizEnd = 5
        case "F": horizEnd = 6
        case "G": horizEnd = 7
        case "H": horizEnd = 8
        default: break
    }
    
    let abscissaChanged = abs(horizStart - horizEnd)
    let ordinateChanged = abs(startPos.1 - endPos.1)
    
    return closure(abscissaChanged, ordinateChanged)
}
    
func moveFigure(_ newFigure: inout [Chessman], newPos: (x: Chess.Horizontal, y: Chess.Vertical)) {
    
}
