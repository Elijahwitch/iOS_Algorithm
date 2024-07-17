import Foundation

// Stack
// late pop first push

struct Stack<T> {
    // T means receives any data type.
    // if use once, can use only data type which inpusts first in function
    var storage = [T]()
    // set inside in structure, l.through init()_
    var isEmpty : Bool {
        storage.isEmpty
    }
    
    init(_ elements: [T]) {
        storage = elements
    }
    
    // those can changes inside property, storage
    mutating func push(_ element: T) { storage.append(element) }
    mutating func pop() -> T? { storage.popLast() }
    
    // check upper value
    func peek() -> T? {
        storage.last
    }
}

var stack = Stack<Int>([1, 2, 3, 4, 5])
