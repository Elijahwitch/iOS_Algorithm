//
//  Node.swift
//  GraphTest
//
//  Created by Joon Ho Gwak on 7/2/24.
//

import Foundation


// Define the graph node
class Node: Identifiable {
    let id = UUID()
    let value: Int
    var neighbors: [Node] // Node is variable which array 

    init(value: Int) {
        self.value = value
        self.neighbors = []
    }
}
