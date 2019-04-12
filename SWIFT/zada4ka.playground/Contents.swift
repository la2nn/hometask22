enum PudleState {
    case beginning
    case process
}

func pudleVolume(input: [Int]) -> Int {
    var result = 0
    var tempPudle = 0
    var pudleState = PudleState.beginning
    var maxValue = 0
    var maxValue2 = 0
    
    for height in input 
        maxValue = height > maxValue ? height : maxValue
        
        switch pudleState {
        case .beginning:
            if height < maxValue {
                pudleState = .process
                tempPudle += maxValue - height
            }
        case .process:
            if height < maxValue {
                tempPudle += maxValue - height
            } else {
                result += tempPudle
                tempPudle = 0
                pudleState = .beginning
            }
        }
    }
    return result
}

let input = [1, 4, 2, 9, 8, 0, 0, 4, 3, 2]
print(pudleVolume(input: input))
