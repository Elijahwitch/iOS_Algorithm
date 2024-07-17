//: [Previous](@previous)

import Foundation

protocol Heap {
    
    var array : [Int] { get set }
    
    mutating func insert(_ data : Int)
    mutating func pop() -> Int?
    mutating func sort()
    
    func sorted() -> [Int]
    
    static func heapify(_ array: inout [Int])
    
}

extension Heap {
    func display() {
        if array.count == 1 {
            print("Empty!")
        } else {
            print(array[1..<array.endIndex])
        }
    }
    
    func getParentIndex(_ index : Int) -> Int { index / 2 }
    
    func getLeftChildIndex(_ index : Int) -> Int { index * 2 }
    
    func getRightChildIndex(_ index : Int) -> Int { index * 2 + 1 }
}

enum Child {
    // express child node
    case none
    case left
    case both
    
    // index have both child node or one node or none
    static func type(_ index : Int, size : Int) -> Self {
        if size < index * 2 + 1 {
            return .none
        } else if size == index * 2 * 1 {
                return .left
            } else {
                return .both
            }
        }
}

struct MaxHeap : Heap {

    var array = Array<Int>()
    
    var maxValue : Int? {
        if array.count == 1 {
            return nil
        } else {
            return array[1]
        }
    }
    
    init() {
        array.append(Int.max)
    }
    
    mutating func insert(_ data: Int) {
        var currentIndex = array.count
        
        array.append(data)
        
        while array[getParentIndex(currentIndex)] < array[currentIndex] {
            array.swapAt(getParentIndex(currentIndex), currentIndex)
            
            currentIndex = getParentIndex(currentIndex)
        }
    }
    mutating func pop() -> Int? {
        if array.count == 1 { return nil }
            else if array.count == 2 { return array.removeLast() }

            var currentIndex = 1
            let returnValue = array[currentIndex]

            array[currentIndex] = array.removeLast()

            while true {
                switch Child.type(currentIndex, size : array.count) {
                    case .both :
                        let greaterChildIndex = array[currentIndex * 2] > array[currentIndex * 2 + 1] ? currentIndex * 2 : currentIndex * 2 + 1
                        if array[greaterChildIndex] > array[currentIndex] { array.swapAt(greaterChildIndex, currentIndex) }

                        currentIndex = greaterChildIndex

                    case .left :
                        if array[getLeftChildIndex(currentIndex)] > array[currentIndex] { array.swapAt(getLeftChildIndex(currentIndex), currentIndex) }

                        return returnValue

                    case .none :
                        return returnValue
                }
            }
    }
    mutating func sort() {
        if array.count == 1 { return }
            else if array.count == 2 { return }

            var currentIndex = 1
            for i in 1..<array.count {
                currentIndex = 1
                array.swapAt(currentIndex, array.count - i)

                loop : while true {
                    switch Child.type(currentIndex, size : array.count - i) {
                        case .both :
                            let greaterChildIndex = array[currentIndex * 2] > array[currentIndex * 2 + 1] ? currentIndex * 2 : currentIndex * 2 + 1
                            if array[greaterChildIndex] > array[currentIndex] { array.swapAt(greaterChildIndex, currentIndex) }

                            currentIndex = greaterChildIndex

                        case .left :
                            if array[getLeftChildIndex(currentIndex)] > array[currentIndex] { array.swapAt(getLeftChildIndex(currentIndex), currentIndex) }

                            break loop

                        case .none :
                            break loop
                    }
                }
            }
    }
    
    func sorted() -> [Int] {
        var array = array

        if array.count == 1 { return [] }
        else if array.count == 2 { return array }

        var currentIndex = 1
        for i in 1..<array.count {
            currentIndex = 1
            array.swapAt(currentIndex, array.count - i)

            loop : while true {
                switch Child.type(currentIndex, size : array.count - i) {
                    case .both :
                        let greaterChildIndex = array[currentIndex * 2] > array[currentIndex * 2 + 1] ? currentIndex * 2 : currentIndex * 2 + 1
                        if array[greaterChildIndex] > array[currentIndex] { array.swapAt(greaterChildIndex, currentIndex) }

                        currentIndex = greaterChildIndex

                    case .left :
                        let leftChildIndex = currentIndex * 2
                        if array[leftChildIndex] > array[currentIndex] { array.swapAt(leftChildIndex, currentIndex) }

                        break loop

                    case .none :
                        break loop
                }
            }
        }

        return Array(array[1..<array.endIndex])
    }
 
        
        
    static func heapify(_ array: inout [Int]) {
        array.insert(Int.max, at: 0)
            
        for index in (1...(array.count - 1) / 2).reversed() {
            var currentIndex = index
                
            loop : while true {
                switch Child.type(currentIndex, size : array.count) {
                    case .both :
                        let greaterChildIndex = array[currentIndex * 2] > array[currentIndex * 2 + 1] ? currentIndex * 2 : currentIndex * 2 + 1
                        if array[greaterChildIndex] > array[currentIndex] { array.swapAt(greaterChildIndex, currentIndex) }
                            
                        currentIndex = greaterChildIndex
                            
                    case .left :
                        let leftChildIndex = currentIndex * 2
                        if array[leftChildIndex] > array[currentIndex] { array.swapAt(leftChildIndex, currentIndex) }
                            
                        break loop
                            
                    case .none :
                            break loop
                }
            }
        }
    }
        
}




//: [Next](@next)
