/* 1. Для нашей структуры Point перегрузить операторы: -, -=, prefix —, /, /=, *= */

struct Point {
    var x: Double
    var y: Double
}

var p1 = Point(x: 10, y: 10)
var p2 = Point(x: 4, y: 4)
var p3 = Point(x: 4, y: 4)
var p4 = Point(x: 8, y: 4)

func - (a: Point, b: Point) -> Point {
    return Point(x: (a.x - b.x), y: (a.y - b.y))
}
print(p1 - p2)

func -= (a: inout Point, b: Point) {
    a = a - b
}
p1 -= p2
print(p1)

func / (a: Point, b: Point) -> Point {
    return Point(x: (a.x / b.x), y: (a.y / b.y))
}
print(p1 / p2)

func /= (a: inout Point, b: Point) {
    a = a / b
}
p3 /= p4
print(p3)

func *= (a: inout Point, b: Point) {
    a.x = a.x * b.x
    a.y = a.y * b.y
}
p4 *= p4
print(p4)

prefix func - (a: Point) -> Point {
    return Point(x: -a.x, y: -a.y)
}
print(-p2)


/* 2. Создать структуру Rect, аналог CGRect, содержащую структуру Size и Point. Перегрузить операторы +, +=, -, -= для этой структуры.  */

struct Size {
    var length: Double
    var width: Double
    
    init(length: Double, width: Double) {                                   // Дабы избежать отрицательных величин
        self.length = length > 0 ? length : 0
        self.width = width > 0 ? width : 0
    }
}

struct Rect {
    var point: Point
    var size: Size
    
   func cornersOfRect() -> [Point] {
        let bottomLeftPoint = Point(x: point.x - size.width / 2,
                                    y: point.y - size.length / 2)
        let upperLeftPoint = Point(x: point.x - size.width / 2,
                                   y: point.y + size.length / 2)
        let bottomRightPoint = Point(x: point.x + size.width / 2,
                                     y: point.y - size.length / 2)
        let upperRightPoint = Point(x: point.x + size.width / 2,
                                    y: point.y + size.length / 2)
        return [bottomLeftPoint, upperLeftPoint, bottomRightPoint, upperRightPoint]
    }
}

var rect1 = Rect(point: Point(x: 2, y: 2), size: Size(length: 4, width: 4))
var rect2 = Rect(point: Point(x: 8, y: 8), size: Size(length: 2, width: 2))
print(rect1.cornersOfRect())

// ну пусть действия производятся с параметрами длин этих четырехугольников, а точка пусть будет всегда среднее расстояниями между средними точками прямоугольников

func + (rect1: Rect, rect2: Rect) -> Rect {
    let newPoint = Point(x: (rect1.point.x + rect2.point.x) / 2,
                         y: (rect1.point.y + rect2.point.y) / 2)
    let newSizeParameters = Size(length: rect1.size.length + rect2.size.length,
                                 width: rect1.size.width + rect2.size.width)
    return Rect(point: newPoint, size: newSizeParameters)
}

func += (rect1: inout Rect, rect2: Rect) {
    rect1 = rect1 + rect2
}

func - (rect1: Rect, rect2: Rect) -> Rect {
    let newPoint = Point(x: (rect1.point.x + rect2.point.x) / 2,
                         y: (rect1.point.y + rect2.point.y) / 2)
    let newSizeParameters = Size(length: abs(rect1.size.length - rect2.size.length),
                                 width: abs(rect1.size.width - rect2.size.width))
    return Rect(point: newPoint, size: newSizeParameters)
}

func -= (rect1: inout Rect, rect2: Rect) {
    rect1 = rect1 - rect2
}

print((rect1 + rect2).cornersOfRect())
print((rect1 - rect2).cornersOfRect())

rect1 -= rect2
print(rect1.cornersOfRect())

rect2 += rect2
print(rect2.cornersOfRect())

/*3. Перегрузить оператор + и += для String, но второй аргумент должен быть Int */

var justString = "Hello. The answer is "
var number = 42

func + (string: String, number: Int) -> String {
    return string + String(number)
}

func += (string: inout String, number: Int) {
    string = string + String(number) + " "
}

print(justString + number)

justString += number
justString += number
print(justString)

/* 4. Создать свой оператор, который будет принимать 2 String и в первом аргументе, при совпадении буквы с вторым аргументом, менять совпадения на заглавные буквы */

infix operator ~~

func ~~ (str1: inout String, str2: String) {
    var result = ""
    var tempStr2 = str2                     // она нужна, тк str2 не меняется
    
    if str1.count > str2.count {            // этот блок нужен для того, чтобы сравнять количество символах в обоих строках, добавив во второую строчку недостоющее кол-во символов
        for _ in (0...(str1.count - str2.count)) {
            tempStr2 += " "
        }
    }
    
    for (character1, character2) in zip(str1, tempStr2) {
        result += (character1 == character2 ? String(character1).uppercased() : String(character1))
    }
    
    str1 = result
}

var str1 = "abcdemeo1a123asdads"
var str2 = "obcaemeow"
var str3 = "abc"
var str4 = "obcaemeow"
str1 ~~ str2
print(str1)         // it works         // aBCdEMEO1a123asdads
