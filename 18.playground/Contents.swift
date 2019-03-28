// Задание 1
/* У нас есть базовый клас "Артист" и у него есть имя и фамилия. И есть метод "Выступление". У каждого артиста должно быть свое выступление: танцор танцует, певец поет и тд. А для художника, что бы вы не пытались ставить, пусть он ставит что-то свое (пусть меняет имя на свое артистическое). Когда вызываем метод "выступление" показать в консоле имя и фамилию артиста и собственно само выступление.
 Полиморфизм используем для артистов. Положить их всех в массив, пройтись по нему и вызвать их метод "выступление" */

class Artist {
    var firstname: String = ""
    var lastname: String = ""
    
    var fullname: String {
     return firstname + " " + lastname
    }
    
    func playSelfPart() -> String {
        return fullname + " -> "
    }
}

class Dancer: Artist {
    override func playSelfPart() -> String {
        return super.playSelfPart() + "Jump and one more jump"
    }
}

class Singer: Artist {
    override func playSelfPart() -> String {
        return super.playSelfPart() + "Ну что ж ты шарик лаешь на меня?"
    }
}

class Musician: Artist {
    override func playSelfPart() -> String {
        return super.playSelfPart() + "Туц туц"
    }
}

class Painter: Artist {
    override var fullname: String {
        return firstname + " - Де - " + lastname
    }
    override func playSelfPart() -> String {
        return fullname + " -> вжух-вжух *типа кистью рисую*"
    }
}

var painter = Painter()
painter.firstname = "Антуан"
painter.lastname = "Сент"
//print(painter.playSelfPart())

var musician = Musician()
musician.firstname = "Антонио"
musician.lastname = "Вивальди"
//print(musician.playSelfPart())

var singer = Singer()
singer.firstname = "Алексей"
singer.lastname = "Скутеренко"
//print(singer.playSelfPart())

var dancer = Dancer()
dancer.firstname = "Никита"
dancer.lastname = "Литвенко"
//print(dancer.playSelfPart())

let myBand = [musician, singer, dancer, painter]
for person in myBand {
    print(person.playSelfPart())
}

print("\n \n \n")
// Задание 2
/*  Создать базовый клас "транспортное средство" и добавить три разных проперти: скорость, вместимость и стоимость одной перевозки (computed). Создайте несколько дочерних класов и переопределите их компютед проперти у всех. Создайте класс самолет, корабль, вертолет, машина и у каждого по одному объекту. В компютед пропертис каждого класса напишите свои значения скорости, вместимости, стоимости перевозки. + у вас должен быть свой метод который считает сколько уйдет денег и времени что бы перевести из пункта А в пункт В определенное количество людей с использованимем наших транспортных средств. Вывести в кольсоль результат (как быстро сможем перевести, стоимость, количество перевозок). Используем полиморфизм */

class Vehicle {
    var name: String {
        return ""
    }
    var vehicleCoefficient: Int {       // [Евро/чел] Просто какой-то транспортный коэффициент за каждого пассажира (ну что-то типа окупаемости за перевозку. Условно)
        return 1
    }
    let unitOfTimeCosts = 5.2           // [Евро * ч] Для всех транспортов постоянная величина
    var speed: Double {                 // [км/час]
        return 0.0
    }
    let distance = 1500.0               // [км]
    var maxCapacity: Int {              // [чел]
        return 1
    }
    var currentCapacity = 0             // [чел]
    var carriageCost: Double? {
        if maxCapacity < currentCapacity {
            print("-----------------------------------------------------------")
            print("Ошибка: текущее количество людей в транспорте превышает максимальное!")
            return nil
        }
        return Double(currentCapacity * vehicleCoefficient) + speed * unitOfTimeCosts / distance
    }
    
    func result() {
        if carriageCost != nil {
            print("-----------------------------------------------------------")
            print("Транспорт: \(name)")
            print("Время в пути: \(distance / speed) [часов]")
            print("Скорость: \(speed) [км/ч]")
            print("Расстояние: \(distance) [км]")
            print("Количество пассажиров: \(currentCapacity) [чел]")
            print("Транспортный коэффициент: \(vehicleCoefficient) [Евро/чел]")
            print("Стоимость перевозки всех пассажиров: \(carriageCost!) [Евро]")
        }
    }
}

class Airplane: Vehicle {
    override var name: String {
        return "Самолет"
    }
    override var vehicleCoefficient: Int {
    return 70
    }
    override var speed: Double {
        return 800.0
    }
    override var maxCapacity: Int {
        return 250
    }
}

class Ship: Vehicle {
    override var name: String {
        return "Корабль"
    }
    override var vehicleCoefficient: Int {
        return 30
    }
    override var speed: Double {
        return 60.0
    }
    override var maxCapacity: Int {
        return 1250
    }
}

class Helicopter: Vehicle {
    override var name: String {
        return "Вертолет"
    }
    override var vehicleCoefficient: Int {
        return 150
    }
    override var speed: Double {
        return 350
    }
    override var maxCapacity: Int {
        return 4
    }
}

class Car: Vehicle {
    override var name: String {
        return "Машина"
    }
    override var vehicleCoefficient: Int {
        return 10
    }
    override var speed: Double {
        return 80
    }
    override var maxCapacity: Int {
        return 5
    }
}

var airplane = Airplane()
airplane.currentCapacity = 120
var ship = Ship()
ship.currentCapacity = 700
var helicopter = Helicopter()
helicopter.currentCapacity = 6
var car = Car()
car.currentCapacity = 5

let vehicles = [airplane, ship, helicopter, car]
for vehicle in vehicles {
    vehicle.result()
}

print("\n \n \n")
// Задание 3
/*  Есть 5 классов: люди, крокодилы, обезьяны, собаки, жирафы. (в этом задании вы будете создавать не дочерние классы, а родительские и ваша задача создать родительский таким образом, что бы группировать эти 5).
 - Создайте по пару объектов каждого класса.
 - Посчитайте присмыкающихся (создайте масив, поместите туда присмыкающихся и скажите сколько в нем объектов)
 - Сколько четвероногих?
 - Сколько здесь животных?
 - Сколько живых существ? */

class Creatures {
    var name: String {
        return ""
    }
    var isAnimal: Bool {
        return true
    }
    var isLivingOnSurface: Bool {
        return true
    }
    var hasAtail: Bool {
        return false
    }
    
    var amountOfLegs: Int {
        if !isAnimal || !isLivingOnSurface {
        return 0
        }
        return 2
    }
    
    func result() {
        print("-----------------------------------------------------------")
        print("Название вида - \(name)")
        
        if isAnimal {
            print("Животное")
        } else {
            print("Растение")
        }
        
        if isLivingOnSurface {
            print("Живет на поверхности")
        } else {
            print("Живет не на поверхности")
        }
        
        if hasAtail {
            print("С хвостом")
        } else {
            print("Без хвоста")
        }

        print("Количество лап / ног - \(amountOfLegs)")
    }
}

class Fish: Creatures {
    override var name: String {
        return "Рыба"
    }
    override var isLivingOnSurface: Bool {
        return false
    }
    override var hasAtail: Bool {
        return true
    }
}
class Human: Creatures {
    override var name: String {
        return "Человек"
    }
}

class Crocodile: Creatures {
    override var name: String {
        return "Крокодил"
    }
    override var hasAtail: Bool {
        return true
    }
    override var amountOfLegs: Int {
        return 4
    }
}

class Tree: Creatures {
    override var name: String {
        return "Дерево"
    }
    override var isAnimal: Bool {
        return false
    }
}

var fish = Fish()
var human = Human()
var crocodile = Crocodile()
var tree = Tree()

let creatures = [fish, human, crocodile, tree]
for creature in creatures {
    creature.result()
}
