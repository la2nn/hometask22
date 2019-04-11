/* Рассмотрим такую ситуацию: есть семья - папа, мама и дети.
 Папа глава семьи, у него есть Мама, Мама контролирует детей, т.е. иерархия: Папа - Мама - Дети, Дети на одном уровне.
 Дети могут вызывать друг друга и они могут искать пути, как общаться с другими Детьми, например говорить "дай игрушку", спрашивать Маму: "Мама, дай конфетку", общаться с Папой: "Папа, купи игрушку".
 Вся эта иерархия лежит в объекте класса Семья, у которого есть методы, например распечатать всю Семью, е. метод вернёт массив всех членов Семьи.
 У Папы есть 3 кложера (closures) - 1. когда он обращается к Семье - распечатать всю Семью, 2. распечатать Маму, 3. распечатать всех Детей.
 Создать всю иерархию со связями. При выходе из зоны видимости все объекты должны быть уничтожены. */
// { [capture list : weak ..? / unowned ... ] in .. }

class Human {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Family {
    var dad: Father?
    var mom: Mother?
    var kids: [Children]
    
    func getFamilyMembersNames() -> [String] {
        print("Принтим семью ->")
        var family = [Human]()
        if let father = dad {
            family.append(father)
        }
        if let mother = mom {
            family.append(mother)
        }
        kids.forEach { kid in
            family.append(kid)
        }
        return family.map { $0.name }
    }
    
    init(dad: Father) {             // если пляшем от батька
        self.dad = dad
        if let wife = dad.wife {
            self.mom = wife
        }
        self.kids = dad.children
    }
    
    init(mom: Mother) {              // если пляшем от детей
        self.mom = mom
        if let husband = mom.husband {
            self.dad = husband
        }
        self.kids = mom.children
    }
}

class Father: Human {
    var wife: Mother?
    var children: [Children] = []
    
    lazy var callFamily: () -> String = { [unowned self] in
        var wifeName = ""
        if let motherName = self.wife?.name {
            wifeName += motherName + ", "
        }
        return "Hey family: " + wifeName + self.childrenNames()
    }
    
    lazy var callMother: () -> String = { [unowned self] in
        if let wifeName = self.wife?.name {
            return "Hey wife: \(wifeName) !"
        }
        return "Нема жены"
    }
    
    lazy var callChildren: () -> String = { [unowned self] in
        return "Hey kids: " + self.childrenNames()
    }
    
    func childrenNames() -> String {
        let childrenNames = self.children.map { $0.name }
        return childrenNames.joined(separator: ", ")
    }
    
    deinit {
        print("Father deinit")
    }
}

class Mother: Human {
    weak var husband: Father?
    var children: [Children] = []
    
    deinit {
        print("Mother deinit")
    }
}

class Children: Human {
    weak var father: Father?
    weak var mother: Mother?
    
    func giveMeToy(_ brotherName: String) {
        if let brother = father?.children.first(where: { $0.name == brotherName }) {
            print("\(brotherName) give me a TOY!")
        } else {
            print("Такого брата нет!")
        }
    }
    
    func giveMeCandy() {
        if let momName = mother?.name {
            print("\(momName), gimme a candy, please!")
        }
    }
    
    func buyToy() {
        if let dadName = father?.name {
            print("\(dadName), buy me more toys!")
        }
    }
    
    deinit {
        print("Kid deinit")
    }
}

func actionsWithFamily() {
    
    let mom = Mother(name: "Маман")
    let dad = Father(name: "Папаc")
    let kid1 = Children(name: "Джон")
    let kid2 = Children(name: "Сноу")
    let kids = [kid1, kid2]
    
    dad.wife = mom
    //dad.wife = nil       работает тема
    dad.children = kids
    mom.husband = dad
    mom.children = kids
    
    let family = Family(dad: dad)
    
    print(dad.callFamily())
    print(dad.callMother())
    print(dad.callChildren())
    print(family.getFamilyMembersNames())
    
    kids.forEach { kid in
        kid.father = dad
        kid.mother = mom
    }
    
    kid1.giveMeToy("Джон")
    kid1.giveMeToy("Сноу")
    kid1.giveMeCandy()
    kid2.buyToy()
    
    print("Минус семья: ")
}

actionsWithFamily()
