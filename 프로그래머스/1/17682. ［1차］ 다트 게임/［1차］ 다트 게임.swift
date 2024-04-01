struct Stack<T>{
    private var stack:[T] = []
    var last: T?{
        return self.stack.last
    }
    mutating func push(_ element: T){
        stack.append(element)
    }
    mutating func pop()->T?{
        return stack.popLast()
    }
}

func solution(_ dartResult:String) -> Int {
    var answers = Array<Int>()
    var myStack = Stack<Int>()
    //S,D,T를 만나기 전까지 스택에 쌓음
    //S,D,T를 만나면 스택 내 값 계산 후 스택에 삽입
    //*,#을 만나면
    // *을 만나면 스택 최상위와 직전 점수에 =*2
    // #을 만나면 스택 최상위 점수에 +=-1
    for item in dartResult{
        
        if item.isNumber{
            if item == "0" && myStack.last == 1{
                _ = myStack.pop()
                myStack.push(10)
            }else{
                myStack.push(item.wholeNumberValue!)
            }
        }else if item.isLetter{
            let number = myStack.pop()!
            if item == "S"{
                answers.append(number)
            }else if item == "D"{
                answers.append(number * number)
            }else if item == "T"{
                answers.append(number * number * number)
            }
        }else{
            let number = answers.popLast()!
            if item == "*"{
                var numbers:[Int] = []
                if answers.isEmpty == false{
                    numbers.append(answers.popLast()!)
                }
                numbers.append(number)
                for option in numbers{
                    answers.append(option * 2)
                }
            }else if item == "#"{
                answers.append(number * -1)
            }
        }
    }
    var ans = 0
    for item in answers{
        print(item)
        ans += item
    }
    return ans
}