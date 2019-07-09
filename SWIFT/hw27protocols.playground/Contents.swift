/* 1. Объявить протокол Food, который будет иметь проперти name (только чтение) и метод taste(), который будет выводить текст со вкусовыми ощущениями

2. Все продукты разных типов, которые вы принесли из супермаркета, находятся в сумке (массив) и все, как ни странно, реализуют протокол Food. Вам нужно пройтись по сумке, назвать предмет и откусить кусочек. Можете отсортировать продукты до имени. Используйте для этого отдельную функцию, которая принимает массив продуктов

3. Некоторые продукты могут испортиться, если их не положить в холодильник. Создайте новый протокол Storable, он наследуется от протокола Food и содержит еще булевую проперти - expired. У некоторых продуктов замените Food на Storable. Теперь пройдитесь по всем продуктам и, если продукт надо хранить в холодильнике, то перенесите его туда, но только если продукт не испорчен уже, иначе просто избавьтесь от него. Используйте функцию для вывода продуктов для вывода содержимого холодильника

4. Добавьте проперти daysToExpire в протокол Storable. Отсортируйте массив продуктов в холодильнике. Сначала пусть идут те, кто быстрее портятся. Если срок совпадает, то сортируйте по имени.

5. Не все, что мы кладем в холодильник, является едой. Поэтому сделайте так, чтобы Storable не наследовался от Food. Мы по прежнему приносим еду домой, но некоторые продукты реализуют теперь 2 протокола. Холодильник принимает только те продукты, которые еще и Storable. функция сортировки должна по прежнему работать. */

protocol Food {
    var name: String { get }

    func taste() -> String
}

protocol Storable {
    var name: String { get set }
    var daysToExpire: Int { get set }
    var expired: Bool { get }
}

class Bread: Food, Storable {
    var name: String
    var daysToExpire: Int
    var expired: Bool {
        return daysToExpire == 0 ? true : false
    }
    
    func taste() -> String {
        return "Bread as a bread, its ok"
    }
    
    init (name: String, daysToExpire: Int) {
        self.name = name
        self.daysToExpire = daysToExpire
    }
}

class Cheese: Food, Storable {
    var name: String
    var daysToExpire: Int
    var expired: Bool {
        return daysToExpire == 0 ? true : false
    }
    
    func taste() -> String{
        return "Its tasty a bit"
    }
    
    init (name: String, daysToExpire: Int) {
        self.name = name
        self.daysToExpire = daysToExpire
    }
}

class Milk: Food, Storable {
    var name: String
    var daysToExpire: Int
    var expired: Bool {
        return daysToExpire == 0 ? true : false
    }
    
    func taste() -> String {
        return "hmm.. This milk has a strange taste... 🤔🤔🤔"
    }
    
    init (name: String, daysToExpire: Int) {
        self.name = name
        self.daysToExpire = daysToExpire
    }
}

class Jam: Food {
    var name = "Jam"
    
    func taste() -> String {
        return "its... BEAUTIFUL.. OHF GOD KILL ME .. i've never tasted so tasty food. oh.."
    }
}

class Medicine: Storable {
    var name: String
    var daysToExpire: Int
    var expired: Bool {
        return daysToExpire == 0 ? true : false
    }
    
    init (name: String, daysToExpire: Int) {
        self.name = name
        self.daysToExpire = daysToExpire
    }
}

let milk1 = Milk(name: "Простоквашино", daysToExpire: 0)
let milk2 = Milk(name: String("Простоквашино".reversed()), daysToExpire: 2)
let bread = Bread(name: "Красная цена", daysToExpire: 1)
let jam = Jam()
let cheese1 = Cheese(name: "Дружба", daysToExpire: 4)
let cheese2 = Cheese(name: "Голландский", daysToExpire: 10)
let cheese3 = Cheese(name: "Каждый день", daysToExpire: 0)
let medicine1 = Medicine(name: "Практонис", daysToExpire: 44)
let medicine2 = Medicine(name: "Мезим", daysToExpire: 192)
let medicine3 = Medicine(name: "Пурген", daysToExpire: 0)

var bagFromShop : [AnyObject] = [milk1, milk2, cheese1, cheese2, cheese3, jam, bread, medicine1, medicine2, medicine3]

var refrigerator: Array<AnyObject> = []
var trashBin: Array<AnyObject> = []

func putItemsInRefrigeratorFrom(bag: inout [AnyObject]) {
    for item in bag {
        if let object = item as? Storable {
            object.expired ? trashBin.append(item) : refrigerator.append(item)
            print("Days left \(object.daysToExpire) for \(object.name)")
        }
       
        if item is Food && !(item is Storable) {                                                                // у Food по заданию нет Storable -> соответвенно нет и срока годности
            if let object = item as? Food {
                print("\(object.name) has unlimited days to expire!")
            }
            refrigerator.append(item)
        }
    }
    bag.removeAll()
    print("Now refrigerator contains \(refrigerator.count) item(s)")
    print("Now trash bin contains \(trashBin.count) item(s)")
}

func sortRefrigerator() {
    var storableObjects = [Storable]()
    var foodObjects = [Food]()
    
    for item in refrigerator {
        if let object = item as? Storable {
            storableObjects.append(object)
        }
        
        if item is Food && !(item is Storable) {
                foodObjects.append(item as! Food)
        }
    }
    storableObjects.sort { $0.daysToExpire < $1.daysToExpire }
    refrigerator.removeAll()
    storableObjects.forEach { refrigerator.append($0 as AnyObject) }                     // без  anyObject ругается
    foodObjects.forEach { refrigerator.append($0 as AnyObject) }                         // без  anyObject ругается
}

func tasteAllFoodInRefregerator(items: [AnyObject]) {
    for item in items {
        if let object = item as? Food {
            let tasteString = object.name + " ---> " + object.taste()
            print(tasteString)
        }
    }
}

putItemsInRefrigeratorFrom(bag: &bagFromShop)
sortRefrigerator()
print(refrigerator)
tasteAllFoodInRefregerator(items: refrigerator)

