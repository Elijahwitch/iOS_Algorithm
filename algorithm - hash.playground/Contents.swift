import Foundation

// Hash sorts data with hash function, save value by sorted key.
// it takes O(1) time to search tree 
struct Person: Hashable {
    
    var name: String
    var age: Int
    
    func hash(into hasher: inout Hasher)  {
        hasher.combine(name)
        hasher.combine(age)
    }
}

// dict have Person as a Key
var dict = [Person: Int]()

// insert alice, bob as key
let alice = Person(name: "Alice", age: 25)
let bob = Person(name: "Bob", age: 25)
dict[alice] = alice.age
dict[bob] = bob.age


// search in array with dict[key]
print(dict[alice])


