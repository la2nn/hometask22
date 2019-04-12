/* Задание 1 - Создать структуру “Описание файла” содержащую свойства:
- путь к файлу
- имя файла
- максимальный размер файла на диске
- путь к папке, содержащей этот файл
- тип файла (скрытый или нет)
- содержимое файла (можно просто симулировать контент)

Главная задача - это использовать правильные свойства там, где нужно, чтобы не пришлось хранить одни и те же данные в разных местах и т.д. и т.п.
 
 Задание 2 - Создайте энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета.
 Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.
 
 Задание 3 - Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
 - минимальный и максимальный возраст каждого объекта
 - минимальную и максимальную длину имени и фамилии
 - минимально возможный рост и вес
 - самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса */


// Задание 1

let FolderPath = "C:/User/Docs/Lesson15/"
struct FileDescription {
    
    var filePath: String {
        return FolderPath + fileName
    }
    
    var fileName: String
    
    var fileSize: Int {
        didSet {
            if fileSize > FileDescription.maxSize {
            fileSize = oldValue
            }
        }
    }
    
    static let maxSize = 128
    
    var fileType: Type
    
    enum `Type` {
        case hidden
        case unhidden
    }
    
    var fileContent: String
    
    static var fileCounter = 0
    
    init(fileName: String, fileSize: Int, fileType: Type, fileContent: String) {
        self.fileName = fileName
        self.fileSize = fileSize
        self.fileType = fileType
        self.fileContent = fileContent
        FileDescription.fileCounter += 1
    }
}

let newFile = FileDescription(fileName: "hometask.swift", fileSize: 112, fileType: .unhidden, fileContent: "Just hometask")
let systemFile = FileDescription(fileName: "system.cmd", fileSize: 1, fileType: .hidden, fileContent: "System file / Do not edit")

print(newFile.filePath)
print(systemFile.fileContent)
print("Amount files in folder \(FolderPath) is \(FileDescription.fileCounter)")

print("-------")

// Задание 2

enum Palette: Int {
    
    case red = 0xFF0000
    case green = 0x00FF00
    case blue = 0x0000FF
    case black = 0x000000
    case yellow = 0xFFFF00
    
    static let gammaCount = 5
    
    static var fisrtColor: Int {
        return Palette.red.rawValue
    }
    
    static var lastColor: Int {
        return Palette.yellow.rawValue
    }
}

// Задание 3

class Human {
    
    static let maxAge = 0...120
    static let lengthName = 2...25
    static let minMaxGrowth = 100...250
    static let minMaxWeight = 2...300
    
    var firstname: String {
        didSet {
            if !(Human.lengthName ~= firstname.count) {
                firstname = "Mistake"
            }
        }
    }
    
    var lastname: String {
        didSet {
            if !(Human.lengthName ~= lastname.count) {
                lastname = "Mistake"
            }
        }
    }
    
    var age: Int {
        didSet {
            if !(Human.maxAge ~= age) {
                age = oldValue
            }
        }
    }
    
    var growth: Int {
        didSet {
            if !(Human.minMaxGrowth ~= growth) {
                growth = oldValue
            }
        }
    }
    
    var weight: Int {
        didSet {
            if !(Human.minMaxWeight ~= weight) {
                weight = oldValue
            }
        }
    }
    
    static var humanCounter = 0
    
    init(firstname: String, lastname: String, age: Int, growth: Int, weight: Int) {
        self.firstname = Human.lengthName ~= firstname.count ? firstname : "Mistake"
        self.lastname = Human.lengthName ~= lastname.count ? lastname : "Mistake"
        self.age = Human.maxAge ~= age ? age : Human.maxAge.min() ?? 0
        self.growth = Human.minMaxGrowth ~= growth ? growth : Human.minMaxGrowth.min() ?? 0
        self.weight = Human.minMaxWeight ~= weight ? weight : Human.minMaxWeight.min() ?? 0
        Human.humanCounter += 1
    }
}

let tutor = Human(firstname: "Midnight" , lastname: "Pulse", age: 42, growth: 182, weight: 77)

print(tutor.firstname)
print(tutor.lastname)
print(tutor.age)
print(tutor.growth)
print(tutor.weight)

print("-------")

tutor.firstname = "Agohaiuhushduhuiasdbd iahsbdoajspdoajs asdnjW@@@najks"
print(tutor.firstname)
tutor.lastname = "SsafJiofjiasjpodpsaj wesasdasdvm"
print(tutor.lastname)
tutor.age = 324
print(tutor.age)
tutor.growth = 295
print(tutor.growth)
tutor.weight = 444
print(tutor.weight)
