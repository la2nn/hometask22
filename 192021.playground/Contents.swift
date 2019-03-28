class First {
    var money: Int
    var time: Int
    var power: Int
    
    init(money: Int, time: Int, power: Int) {
        self.money = money
        self.time = time
        self.power = power
    }
    
    convenience init(money: Int) {
        self.init(money: money, time: 0, power: 0)
       
    }
}

let f1 = First(money: 15)
print(f1.money)

class Second: First {
    var hp: Int
    
    init(money: Int, time: Int, power: Int, hp: Int) {
        self.hp = hp
        super.init(money: money, time: time, power: power)
        
    }
  /* override init(money: Int, time: Int, power: Int, hp: Int) {
        super.init(money: Int, time: Int, power: Int)
        self.hp = hp
    } */
    convenience init(hp: Int) {
        self.init(money: 0, time: 0, power: 0, hp: hp)
        self.hp = hp
    }
 
}

let second1 = Second(money: 1, time: 2, power: 3, hp: 4)
second1.hp
second1.money
second1.time
second1.power

let second2 = Second(hp: 15)
second2.hp
second2.money
second2.time
second2.power

let array: [Any] = [second1, second2, f1]
for index in array {
    if let someSecond = index as Second {
        print("\(index) is Second")
    }
    
    }

