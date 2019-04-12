// Задание 3

/*
 Морской бой (Тяжелый уровень)
 1. Создайте тип корабль, который будет представлять собой прямоугольник. В нем может быть внутренняя одномерная система координат (попахивает сабскриптом). Корабль должен принимать выстрелы по локальным координатам и вычислять когда он убит
 2. Создайте двумерное поле, на котором будут располагаться корабли врага. Стреляйте по полю и подбейте вражеский четырех трубник :)
 3. Сделайте для приличия пару выстрелов мимо, красивенько все выводите на экран :) */

struct Coordinate: Hashable {
    var x: Int
    var y: Int
}

enum CellType: String {
    case shipAlive = "🔲"
    case shipDead = "❌"
    case water = "🌀"
    case miss = "💢"
}

let myBattlefield = [["w", "w", "w", "s", "w", "w", "w", "w", "w", "w"],
                     ["w", "s", "w", "s", "w", "s", "s", "s", "s", "w"],
                     ["s", "s", "w", "w", "w", "w", "w", "w", "w", "w"],
                     ["w", "w", "w", "w", "w", "w", "w", "w", "w", "w"],
                     ["w", "w", "w", "w", "w", "w", "w", "w", "w", "w"],
                     ["w", "w", "w", "s", "s", "s", "w", "w", "w", "w"],
                     ["w", "s", "w", "w", "w", "w", "w", "w", "w", "s"],
                     ["w", "s", "w", "w", "s", "s", "w", "w", "w", "w"],
                     ["w", "s", "w", "w", "w", "w", "w", "w", "w", "w"],
                     ["w", "w", "w", "s", "w", "w", "w", "w", "s", "w"]]

let enemyBattlefield = [["w", "w", "w", "w", "w", "w", "w", "w", "w", "w"],
                        ["s", "s", "w", "s", "w", "w", "w", "w", "s", "w"],
                        ["s", "w", "w", "s", "w", "w", "w", "w", "s", "w"],
                        ["w", "w", "w", "w", "w", "w", "w", "s", "s", "w"],
                        ["s", "s", "w", "w", "w", "w", "w", "w", "w", "w"],
                        ["w", "w", "w", "s", "s", "s", "w", "w", "w", "w"],
                        ["w", "s", "w", "w", "w", "w", "w", "w", "w", "s"],
                        ["w", "s", "w", "w", "w", "w", "w", "w", "w", "w"],
                        ["w", "s", "w", "w", "w", "w", "w", "w", "w", "w"],
                        ["w", "w", "w", "s", "w", "w", "s", "w", "w", "w"]]

var countOfShips = 0                                                        // По правилам: количество кораблей по обе стороны равны, поэтмоу не стал делать количество кораблей за каждую сторону, а смысл..

func makeDictionaryFrom(field: [[String]]) -> [Coordinate : CellType] {
    var dictionary = [Coordinate : CellType]()
    for (y, array) in field.enumerated() {
        for (x, char) in array.enumerated() {
            let cell = Coordinate(x: x, y: y)
            switch char {
            case "s":
                dictionary[cell] = CellType.shipAlive
                countOfShips += 1
                
            case "w":
                dictionary[cell] = CellType.water
            default:
                break
            }
        }
    }
    return dictionary
}

var myCount = Int()                                                     // Кол-во моих попаданий
var enemyCount = Int()                                                  // Кол-во попаданий врага
var enemyShots: [Coordinate] = []                                       // Массив выстрелов врага, чтобы не было повторений
var myField = makeDictionaryFrom(field: myBattlefield)                  // Дикшенери моей карты
var enemyField = makeDictionaryFrom(field: enemyBattlefield)            // Дикшенери вражеской карты

func printBattlefield(field: [Coordinate : CellType]) {
    var currentString = String()
    for y in 0...9 {
        for x in 0...9 {
            switch field[Coordinate(x: x, y: y)]! {
            case CellType.water: currentString += CellType.water.rawValue + " "
            case CellType.miss: currentString += CellType.miss.rawValue + " "
            case CellType.shipAlive: currentString += CellType.shipAlive.rawValue + " "
            case CellType.shipDead: currentString += CellType.shipDead.rawValue + " "
            }
        }
        print(currentString)
        currentString = ""
    }
    print()
}

func printHiddenBattlefield() {                                          // Т.е. с "туманом войны"
    var currentString = String()
    for y in 0...9 {
        for x in 0...9 {
            switch enemyField[Coordinate(x: x, y: y)]! {
            case CellType.water: currentString += CellType.water.rawValue + " "
            case CellType.miss: currentString += CellType.miss.rawValue + " "
            case CellType.shipAlive: currentString += CellType.water.rawValue + " "
            case CellType.shipDead: currentString += CellType.shipDead.rawValue + " "
            }
        }
        print(currentString)
        currentString = ""
    }
    print()
}

print("Мое поле: ")
printBattlefield(field: myField)
print("Вражеское поле: ")
printBattlefield(field: enemyField)

var isEnemyTurn = true
var isGameEnd = false

func myShot(shot: Coordinate) {
    var needToRestart = false
    
    guard !isGameEnd else {
        print("Зачем стреляешь, дядя? Игра окончена!")
        return
    }
    
        if (0...9 ~= shot.x) && (0...9 ~= shot.y) {
    
            switch enemyField[shot]! {
            case CellType.shipAlive: enemyField[shot]! = CellType.shipDead
                                     myCount += 1
                                     needToRestart = true
                                     print("Попадание! -> Вы стреляете еще раз!")
                
            case CellType.water: enemyField[shot]! = CellType.miss
                                 print("Промах!")
                
            case CellType.miss: print("Вы уже стреляли в эту клетку!")
                                needToRestart = true
                
            case CellType.shipDead: print("Выстрел в уже подбитую часть корабля!")
                                    needToRestart = true
            }
            
            if needToRestart {
                printHiddenBattlefield()
                if myCount == countOfShips/2 {          // Запихал сюда, чтобы сообщение вышло без необходимости произвести новый выстрел!
                    print("Я победил!")
                    isGameEnd = true
                }
                if enemyCount == countOfShips/2 {
                    print("Враг победил!")
                    isGameEnd = true
                }
                return
            } else {
                print("Я попал \(myCount) раз(а) из \(countOfShips/2)!")
                printHiddenBattlefield()
            }
            
        } else {
            print("Поле 10х10, т.е. x∈[0...9] и y∈[0...9]")
            return
        }
        
        // теперь выстрел врага
        // пока выстрел не сделан, он будет пытаться его сделать
        while isEnemyTurn == true {
            enemyTurn()
        }
        isEnemyTurn = true
}

func enemyTurn() {
    var x = Int.random(in: 0...9)
    var y = Int.random(in: 0...9)
    var needToRestart = false
    
    while enemyShots.contains(Coordinate(x: x, y: y)) {
        x = Int.random(in: 0...9)
        y = Int.random(in: 0...9)
    }
    
    switch myField[Coordinate(x: x, y: y)]! {
    case CellType.shipAlive: myField[Coordinate(x: x, y: y)]! = CellType.shipDead
                             enemyCount += 1
                             needToRestart = true
                             print("Попадание от врага в мою бухту!")
        
    case CellType.water: myField[Coordinate(x: x, y: y)]! = CellType.miss
                         print("Промах от противника!")
        
   /* case CellType.miss: print("Противник уже стрелял в эту клетку!")
                        needToRestart = true
    case CellType.shipDead: print("Противник выстрелил в подбитую часть коробля!")
                            needToRestart = true                                    теряет актуальность, т.к. противник стреляет только по тем клеткам, по которым ранее не попадал! */
    default: break
    }
    
    enemyShots.append(Coordinate(x: x, y: y))
    
    if needToRestart {
        printBattlefield(field: myField)
        isEnemyTurn = true
    } else {
        print("Противник попал \(enemyCount) раз(а) из \(countOfShips/2)!")
        printBattlefield(field: myField)
        isEnemyTurn = false
    }
}

myShot(shot: Coordinate(x: 0, y: 1))
myShot(shot: Coordinate(x: 1, y: 1))
myShot(shot: Coordinate(x: 3, y: 1))
myShot(shot: Coordinate(x: 8, y: 1))
myShot(shot: Coordinate(x: 0, y: 2))
myShot(shot: Coordinate(x: 3, y: 2))
myShot(shot: Coordinate(x: 8, y: 2))
myShot(shot: Coordinate(x: 7, y: 3))
myShot(shot: Coordinate(x: 8, y: 3))
myShot(shot: Coordinate(x: 0, y: 4))
myShot(shot: Coordinate(x: 1, y: 4))
myShot(shot: Coordinate(x: 3, y: 5))
myShot(shot: Coordinate(x: 4, y: 5))
myShot(shot: Coordinate(x: 5, y: 5))
myShot(shot: Coordinate(x: 1, y: 6))
myShot(shot: Coordinate(x: 9, y: 6))
myShot(shot: Coordinate(x: 1, y: 7))
myShot(shot: Coordinate(x: 1, y: 8))
myShot(shot: Coordinate(x: 3, y: 9))
myShot(shot: Coordinate(x: 6, y: 9))
 
myShot(shot: Coordinate(x: 0, y: 0))
myShot(shot: Coordinate(x: 10, y: 10))
//myShot(shot: Coordinate(x: Int.random(in: 0...9), y: Int.random(in: 0...9)))
//myShot(shot: Coordinate(x: Int.random(in: 0...9), y: Int.random(in: 0...9)))
/*myShot(shot: Coordinate(x: 0, y: 1))
myShot(shot: Coordinate(x: 1, y: 1))
myShot(shot: Coordinate(x: 0, y: 2))*/

