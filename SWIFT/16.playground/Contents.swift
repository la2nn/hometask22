struct GameObject {
    
    enum Object: String {
        case box = "📦"
        case wall = "⬛"
        case floor = "◻️"
        case aim = "⭕"
        case player = "🐷"
    }
    
    var position: Coordinate
    var type: Object
}


enum Direction {
    case Up
    case Down
    case Left
    case Right
}

struct Coordinate: Hashable {
    var x: Int
    var y: Int
}


let roomOne = [["w", "w", "w", "w", "w", "w", "w", "w", "w", "w", "w", "w", "w", "w"],
               ["w", "w", "w", "a", "f", "f", "f", "f", "f", "w", "w", "w", "w", "w"],
               ["w", "w", "f", "b", "f", "p", "f", "f", "b", "a", "f", "f", "w", "w"],
               ["w", "f", "a", "f", "f", "f", "w", "f", "f", "f", "f", "f", "f", "w"],
               ["w", "f", "f", "w", "f", "f", "w", "f", "f", "f", "f", "f", "f", "w"],
               ["w", "f", "b", "w", "f", "f", "w", "w", "f", "f", "f", "f", "w", "w"],
               ["w", "f", "f", "w", "f", "f", "w", "w", "f", "f", "f", "w", "w", "w"],
               ["w", "w", "f", "f", "f", "w", "w", "w", "w", "f", "w", "w", "w", "w"],
               ["w", "w", "w", "w", "w", "w", "w", "w", "w", "w", "w", "w", "w", "w"]]

let roomTwo = [["w", "w", "w", "w", "w", "w", "w"],
               ["w", "f", "f", "f", "f", "f", "w"],
               ["w", "f", "f", "a", "a", "w", "w"],
               ["w", "f", "f", "b", "b", "w", "w"],
               ["w", "f", "p", "f", "f", "f", "w"],
               ["w", "w", "w", "w", "w", "w", "w"]]

let rooms = [roomOne, roomTwo]
var currentRoom = rooms[0]
var numberOfCurrentRoom = 0

var positionsOfAims = [Coordinate]()
var playerPosition = Coordinate(x: 0, y: 0)

typealias Map = [[String]]
typealias GameField = [Coordinate: GameObject]

class GameEngine {
    var room: Map
    var gameField: GameField
    
    init(room: Map, gameField: GameField) {
        self.room = room
        self.gameField = gameField
    }
    
    func move(object: inout GameObject, direction: Direction) {
        let x = object.position.x
        let y = object.position.y
        
        var doubleNextX = Int()
        var doubleNextY = Int()
        var nextX = Int()
        var nextY = Int()
        
        switch object.type {
        case .player:
            switch direction {
            case .Up    : object.position = Coordinate(x: x, y: y - 1)
            doubleNextX = x
            doubleNextY = y - 2
            nextX = x
            nextY = y - 1
                
            case .Down  : object.position = Coordinate(x: x, y: y + 1)
            doubleNextX = x
            doubleNextY = y + 2
            nextX = x
            nextY = y + 1
                
            case .Left  : object.position = Coordinate(x: x - 1, y: y)
            doubleNextX = x - 2
            doubleNextY = y
            nextX = x - 1
            nextY = y
                
            case .Right : object.position = Coordinate(x: x + 1, y: y)
            doubleNextX = x + 2
            doubleNextY = y
            nextX = x + 1
            nextY = y
                
            }
        default:
            break
        }
        
        var doubleNextObject = gameField[Coordinate(x: doubleNextX, y: doubleNextY)]
        var nextObject = gameField[Coordinate(x: nextX, y: nextY)]
        var currentCountOfAims = Int()
        
        if nextObject?.type == .aim {                                                      // Если следующий объект - цель
            gameField[Coordinate(x: x, y: y)]?.type = .floor
            object.position = Coordinate(x: nextX, y: nextY)
            gameField[object.position] = object
        }
        
        if doubleNextObject?.type == .aim && nextObject?.type == .box {                     // Если следующий объект - коробка , а через один - цель
            doubleNextObject?.type = .floor
            doubleNextObject!.position = Coordinate(x: x, y: y)
            gameField[doubleNextObject!.position] = doubleNextObject
            
            nextObject?.type = .box
            nextObject?.position = Coordinate(x: doubleNextX, y: doubleNextY)
            gameField[nextObject!.position] = nextObject
            
            
            object.position = Coordinate(x: nextX, y: nextY)
            gameField[object.position] = object
        }
        
        if nextObject?.type == .box  {                                                      // Если следующий объект - коробка
            doubleNextObject?.position = Coordinate(x: x, y: y)
            gameField[doubleNextObject!.position] = doubleNextObject
            
            nextObject?.position = Coordinate(x: doubleNextX, y: doubleNextY)
            gameField[nextObject!.position] = nextObject
            
            gameField[object.position] = object
        }
        
        if nextObject?.type == .floor {                                                     // Если следующий объект - пол
            nextObject?.position = Coordinate(x: x, y: y)
            gameField[nextObject!.position] = nextObject
            gameField[object.position] = object
        }
        
        if doubleNextObject?.type == .wall && nextObject?.type == .box {                    // Если следующий объект - коробка , а через один - стена
            doubleNextObject?.position = Coordinate(x: doubleNextX, y: doubleNextY)
            gameField[doubleNextObject!.position] = doubleNextObject
            
            nextObject?.position = Coordinate(x: nextX, y: nextY)
            gameField[nextObject!.position] = nextObject
            
            object.position = Coordinate(x: x, y: y)
            gameField[object.position] = object
        }
        
        if nextObject?.type == .wall {                                                      // Если следующий объект - стена
            nextObject?.position = Coordinate(x: nextX, y: nextY)
            gameField[nextObject!.position] = nextObject
            
            object.position = Coordinate(x: x, y: y)
            gameField[object.position] = object
        }
        
        /* -> Убрать комментарий, чтобы игрок не мог наступать на .aim
         if nextObject?.type == .aim {
         
         object.position = Coordinate(x: x, y: y)
         gameField[object.position] = object
         }
         */
        
        if doubleNextObject?.type == .box && nextObject?.type == .box {                  // Если подряд две коробки
            doubleNextObject?.position = Coordinate(x: doubleNextX, y: doubleNextY)
            gameField[doubleNextObject!.position] = doubleNextObject
            
            nextObject?.position = Coordinate(x: nextX, y: nextY)
            gameField[nextObject!.position] = nextObject
            
            object.position = Coordinate(x: x, y: y)
            gameField[object.position] = object
        }
        
        for checkAim in positionsOfAims {
            if gameField[checkAim]!.type == .floor {
                gameField[checkAim]!.type = .aim
            }
            if gameField[checkAim]!.type == .player {
                currentCountOfAims += 1
            }
        }
        
        for i in 0 ..< roomParameters(room: currentLevel).x {
            for j in 0 ..< roomParameters(room: currentLevel).y {
                if gameField[Coordinate(x: i, y: j)]?.type == .aim {
                    currentCountOfAims += 1
                }
            }
        }
        
        print("Осталось целей: \(currentCountOfAims)")
        printGameboard(room: currentLevel)
        
        if currentCountOfAims == 0 {
            print("WOW!!! YOU WON THIS ONE")
            print("NEXT LEVEL STARTS")
            
            gameField.removeAll()
            positionsOfAims.removeAll()
            
            numberOfCurrentRoom += 1
            currentRoom = rooms[numberOfCurrentRoom]
        }
    }
}

func roomParameters(room: GameEngine) -> (x: Int, y: Int) {
    var x = Int()
    var y = Int()
    
    for (roomHeight, roomWidth) in room.room.enumerated() {
        y = roomHeight
        x = roomWidth.count
    }
    return(x: x, y: y)
}

func makeFieldFrom(map: Map) -> GameField {
    var field = [Coordinate: GameObject]()
    for (y, array) in map.enumerated() {
        for (x, char) in array.enumerated() {
            let cell = Coordinate(x: x, y: y)
            switch char {
            case "w":
                field[cell] = GameObject(position: cell, type: .wall)
            case "f":
                field[cell] = GameObject(position: cell, type: .floor)
            case "b":
                field[cell] = GameObject(position: cell, type: .box)
            case "a":
                field[cell] = GameObject(position: cell, type: .aim)
                positionsOfAims.append(cell)
            case "p":
                field[cell] = GameObject(position: cell, type: .player)
                playerPosition = cell
            default:
                break
            }
        }
    }
    return field
}


func printGameboard(room: GameEngine) {
    for (y, currentRow) in room.room.enumerated() {          // y --> 0 ... room height      // currentRow --> [w, w, w, w, w, w] ...
        var result = ""
        for x in 0...currentRow.count {
            if let cellImage = room.gameField[Coordinate(x: x, y: y)]?.type.rawValue {
                result += cellImage
            }
        }
        print(result)
    }
    print()
}

var currentLevel = GameEngine(room: currentRoom, gameField: makeFieldFrom(map: currentRoom))
if var player = currentLevel.gameField[playerPosition] {
    printGameboard(room: currentLevel)
    currentLevel.move(object: &player, direction: .Up)
    currentLevel.move(object: &player, direction: .Up)
    currentLevel.move(object: &player, direction: .Left)
    currentLevel.move(object: &player, direction: .Left)
    currentLevel.move(object: &player, direction: .Right)
    currentLevel.move(object: &player, direction: .Down)
    currentLevel.move(object: &player, direction: .Down)
    currentLevel.move(object: &player, direction: .Left)
    currentLevel.move(object: &player, direction: .Up)
    currentLevel.move(object: &player, direction: .Left)
    currentLevel.move(object: &player, direction: .Down)
    currentLevel.move(object: &player, direction: .Left)
    currentLevel.move(object: &player, direction: .Down)
    currentLevel.move(object: &player, direction: .Down)
    currentLevel.move(object: &player, direction: .Down)
    currentLevel.move(object: &player, direction: .Right)
    currentLevel.move(object: &player, direction: .Up)
    currentLevel.move(object: &player, direction: .Up)
    currentLevel.move(object: &player, direction: .Down)
    currentLevel.move(object: &player, direction: .Down)
    currentLevel.move(object: &player, direction: .Down)
    currentLevel.move(object: &player, direction: .Right)
    currentLevel.move(object: &player, direction: .Right)
    currentLevel.move(object: &player, direction: .Up)
    currentLevel.move(object: &player, direction: .Up)
    currentLevel.move(object: &player, direction: .Up)
    currentLevel.move(object: &player, direction: .Up)
    currentLevel.move(object: &player, direction: .Up)
    currentLevel.move(object: &player, direction: .Right)
    currentLevel.move(object: &player, direction: .Right)
    currentLevel.move(object: &player, direction: .Right)
    currentLevel.move(object: &player, direction: .Right)
}

if numberOfCurrentRoom == 1 {
    currentLevel = GameEngine(room: currentRoom, gameField: makeFieldFrom(map: currentRoom))
    if var player = currentLevel.gameField[playerPosition] {
        printGameboard(room: currentLevel)
        
        currentLevel.move(object: &player, direction: .Right)
        currentLevel.move(object: &player, direction: .Up)
        currentLevel.move(object: &player, direction: .Down)
        currentLevel.move(object: &player, direction: .Right)
        currentLevel.move(object: &player, direction: .Up)
        
    }
}
