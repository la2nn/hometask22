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
    var dad: Father
    var mom: Mother
    var kids: [Children]
    
    func printFamilyMembers() -> [String] {
        print("Принтим семью ->")
        var family = [String]()
        family.append(dad.name)
        family.append(mom.name)
        family.append(kids[0].name)
        family.append(kids[1].name)
        
        return family
    }
    init(dad: Father) {
        
        self.dad = dad
        self.mom = dad.wife
        self.kids = dad.children!
    }
}

class Father: Human {
    var wife: Mother!
    var children: [Children]!
    
    lazy var callFamily: () -> String = { [unowned self] in
        return "Hey family: \(self.wife.name), \(self.children[0].name), \(self.children[1].name)!" }
   
    lazy var callMother: () -> String = { [unowned self] in
        return "Hey wife: \(self.wife.name)!" }
    
    lazy var callChildren: () -> String = { [unowned self] in
        return "Hey kids: \(self.children[0].name), \(self.children[1].name)!" }
    
    deinit {
        print("Father deinit")
    }
}

class Mother: Human {
    weak var husband: Father!
    var children: [Children]!
    
    deinit {
        print("Mother deinit")
    }
}

class Children: Human {
    weak var father: Father?
    weak var mother: Mother?
    
    func giveMeToy() {
        print("\(self.name), let me play with your toy!")
    }
    func giveMeCandy() {
        print("\(mother!.name), gimme a candy, please!")
    }
    func buyToy() {
        print("\(father!.name), buy me more toys!")
    }
    
    deinit {
        print("Kid deinit")
    }
}

if 5+5 == 10 {

    let mom = Mother(name: "Маман")
    let dad = Father(name: "Папаc")
    let kid1 = Children(name: "Ребенок1")
    let kid2 = Children(name: "Ребенок2")
    let kids = [kid1, kid2]
    
    dad.wife = mom
    dad.children = kids
    mom.husband = dad
    mom.children = kids
    let family = Family(dad: dad)
    
    print(dad.callFamily())
    print(dad.callMother())
    print(dad.callChildren())
    print(family.printFamilyMembers())
    
    for kid in kids {
        kid.father = dad
        kid.mother = mom
    }
    
    kid1.giveMeToy()
    kid1.giveMeCandy()
    kid2.buyToy()
    
    print("Минус семья: ")
}


