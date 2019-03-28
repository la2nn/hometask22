import Foundation

/*
 Задание 1 - Повторить урок Алексея по памяти
 
 Задание 2 - Добавить дату рождения (отдельной структурой), которая содержит ДД ММ ГГ;
 Добавить Computed property, которая будет считать сколько студенту лет, на основании даты рождения;
 Добавить еще одну Computed property, которая будет считать, сколько студент учился (прим: если меньше 6 лет -> 0)
 
 Задание 3 - Создать структуру отрезок, у которой есть две внутренняя структура - точки - stored proporties;
 Создать Computed property - mid point (точка, между двумя точками);
 Создать Computed property - length (длина отрезка);
 Если двигать mid point (установить в другую точку), то точка a и точка b должны перенестись (на то же расстояние, что и mid point);
 Если изменить длину отрезка, то изменится положение точки b (но точка а остается на месте)
 */

// Задание 1 + Задание 2

struct Student {
    
    struct Date {
        var day: Int
        var month: Int
        var year: Int
    }
    
    var firstName: String {
        willSet {
            print("Will set \(newValue) instead of \(firstName)")
        }
        didSet {
            print("Did set \(firstName) instead of \(oldValue)")
            firstName = firstName.capitalized
        }
    }
    
    var lastName: String {
        didSet(oldLastName){
            lastName = lastName.capitalized
        }
    }
    
    var fullName: String {
        get {
            return firstName + " " + lastName
        }
        set {
            print("Full name wants to be \(newValue)")
            let words = newValue.components(separatedBy: " ")
            if words.count > 0 {
                firstName = words[0]
            }
            if words.count > 1 {
                lastName = words[1]
            }
        }
    }
    
    var birthday: Date
    
    var age: Int {
        get {
            let currentDate = ["Day": 28, "Month": 1, "Year": 2019]
            var age = (currentDate["Year"] ?? 0) - birthday.year
            if (currentDate["Month"] ?? 0) < birthday.month ||
                ((currentDate["Month"] ?? 0) == birthday.month && (currentDate["Day"] ?? 0) < birthday.day) {
                age -= 1
            }
            return age
        }
    }
    
    var studiedTime: Int {
        get {
            if age <= 7 {
            return 0
        }
        return (age - 7)
        }
    }
    
}


var student = Student(firstName: "Ivan",
                      lastName: "Dedmorozov",
                      birthday: Student.Date(day: 24, month: 5, year: 1999))

student.firstName = "JACoB"
student.lastName = "Tinkoff"
print(student.fullName)

print("----------")

student.fullName = "SAm SeRIOus"
print(student.fullName)

print("----------")

print("Student's born on \(student.birthday.day).\(student.birthday.month).\(student.birthday.year)")
print("Student's age is \(student.age)")
print("Student studied" + " \(student.studiedTime) " + "years")

print("----------")

/* Задание 3 - Создать структуру отрезок, у которой есть две внутренняя структура - точки - stored proporties;
Создать Computed property - mid point (точка, между двумя точками);
Создать Computed property - length (длина отрезка);
Если двигать mid point (установить в другую точку), то точка a и точка b должны перенестись (на то же расстояние, что и mid point);
Если изменить длину отрезка, то изменится положение точки b (но точка а остается на месте) */


struct Section {
    
    struct Coordinate {
        var x: Double
        var y: Double
    }
    
    var pointA: Coordinate
    var pointB: Coordinate
    
    var midPoint: Coordinate {
        get {
            let midX = (pointA.x + pointB.x)/2
            let midY = (pointA.y + pointB.y)/2
            return Coordinate(x: midX, y: midY)
        }
        set {
            let trueMidX = midPoint.x
            let trueMidY = midPoint.y

            pointA.x += newValue.x - trueMidX
            pointA.y += newValue.y - trueMidY
            pointB.x += newValue.x - trueMidX
            pointB.y += newValue.y - trueMidY
        }
    }
    
    var length: Double {
        get {
            return sqrt(pow((pointB.x - pointA.x),2) + pow((pointB.y - pointA.y),2))
        }
        set {
            pointB = Coordinate(x: pointA.x + (pointA.x - pointB.x) * newValue / length,
                                y: pointA.y + (pointA.y - pointB.y) * newValue / length)
        }
    }
    
}

var otrezok = Section(pointA: Section.Coordinate(x: 1, y: 1), pointB: Section.Coordinate(x: 14, y: 7))
print("Length of segment \(otrezok.length)")
print("Middle point of segment \(otrezok.midPoint)")

print("----------")

otrezok.midPoint = Section.Coordinate(x: 4, y: 8)
print("Теперь точка А имеет координаты \(otrezok.pointA)")
print("Теперь точка B имеет координаты \(otrezok.pointB)")
print("Проверяем - мидпоинт не должен измениться! \(otrezok.midPoint)")

print("----------")

otrezok.length = 15123.5
print("Новая длина отрезка - \(otrezok.length)")
print("Точка А не должна меняться - \(otrezok.pointA)")
print("Точка B должна меняться - \(otrezok.pointB)")
