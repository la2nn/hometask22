/* 1. Сделать класс Человек, у этого класса будут проперти Папа, Мама, Братья, Сестры (всё опционально).
 Сделать примерно 30 человек, взять одного из них, поставить ему Папу/Маму. Папе и Маме поставить Пап/Мам/Братьев/Сестер. Получится большое дерево иерархии.
 Посчитать, сколько у этого человека двоюродных Братьев, троюродных Сестёр, Теть, Дядь, итд
 2. Все сестры, матери,... должны быть класса Женщина, Папы, братья,... класса Мужчины.
 У Мужчин сделать метод Двигать_диван, у Женщин Дать_указание (двигать_диван). Всё должно работать как и ранее.
 Всех этих людей положить в массив Семья, пройти по массиву посчитать количество Мужчин и Женщин, для каждого Мужчины вызвать метод Двигать_диван, для каждой женщины Дать_указание.
 3. Расширить класс человек, у него будет проперти Домашние_животные. Животные могут быть разные (попугаи, кошки, собаки...) их может быть несколько, может и не быть вообще.
 Раздать некоторым людям домашних животных. Пройти по всему массиву людей. Проверить каждого человека на наличие питомца, если такой есть - добавлять всех животных в массив животных. Посчитать сколько каких животных в этом массиве.
 Вся эта живность должна быть унаследована от класса Животные. У всех животных должен быть метод Издать_звук(крик) и у каждого дочернего класса этот метод переопределён на свой, т.е. каждое животное издаёт свой звук.
 Когда проходим по массиву животных, каждый представитель вида животных должен издать свой звук. */

// Задание 1

class Human {
    final var father: Male?
    final var mother: Female?
    final var brothers: [Male]?
    final var sisters: [Female]?
    final var pets: [Pet]?
}

class Male: Human {
    func moveSofa() {
        print("Sofa is moved")
    }
}

class Female: Human {
    func command() {
        print("Move my sofa!")
    }
}

class Pet {
    func makeSound() {
        print("sound?")
    }
}

class Parrot: Pet {
    override func makeSound() {
        print("Hello world")
    }
}

class Cat: Pet {
    override func makeSound() {
        print("Meow - meow")
    }
}

class Dog: Pet {
    override func makeSound() {
        print("Woof woof motherfucker")
    }
}

func familyCreatorFor(human: Human) -> Human {
    let brothers = [Male](repeating: Male(), count: 3)
    let sisters = [Female](repeating: Female(), count: 4)
    let pets = [Parrot(), Dog(), Dog(), Cat(), Cat()]
    
    // mother and father
    human.mother = Female()
    human.father = Male()

    
    // three brothers and four sisters
    human.brothers = brothers
    human.sisters = sisters
    
    // five pets
    human.pets = pets
    
    return human
}

var human1 = Human()
var human2 = Human()
var human3 = Human()
var human4 = Human()
var human5 = Human()

human1 = familyCreatorFor(human: human1)
human2 = familyCreatorFor(human: human2)
human3 = familyCreatorFor(human: human3)
human4 = familyCreatorFor(human: human4)
human5 = familyCreatorFor(human: human5)

let humans = [human1, human2, human3, human4, human5]

human1.mother?.command()            // printed - Move my sofa!
human1.mother = nil
human1.mother?.command()            // nil

human1.brothers?.count
human1.sisters?.count
human1.pets?.count

human4.sisters = nil
human5.pets = nil                   // попробуй удалить эту строку -> результат изменится

var countOfDogs = 0
var countOfCats = 0
var countOfParrots = 0
var countOfSisters = 0
var countOfBrothers = 0

var arrayOfPets = [Pet]()

for human in humans {
    if let sisters = human.sisters {
        for _ in sisters {
            countOfSisters += 1
        }
    }
    if let brothers = human.brothers {
        for _ in brothers {
            countOfBrothers += 1
        }
    }
    if let pets = human.pets {
        for pet in pets {
            switch pet {
            case is Dog: countOfDogs += 1
            pet.makeSound()
            case is Parrot: countOfParrots += 1
            pet.makeSound()
            case is Cat: countOfCats += 1
            pet.makeSound()
            default: break
            }
            arrayOfPets.append(pet)
        }
    }
}

print(countOfDogs)
print(countOfCats)
print(countOfParrots)
print(countOfSisters)
print(countOfBrothers)
print(arrayOfPets.count)

