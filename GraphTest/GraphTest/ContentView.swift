//
//  ContentView.swift
//  GraphTest
//
//  Created by Joon Ho Gwak on 7/2/24.
//

import SwiftUI


struct ContentView: View {
    let graph = Graph()

    init() {
        graph.addNode(1)
        graph.addNode(2)
        graph.addNode(3)
        graph.addNode(4)

        graph.addEdge(from: 1, to: 2)
        graph.addEdge(from: 1, to: 3)
        graph.addEdge(from: 2, to: 4)
        graph.addEdge(from: 3, to: 4)
    }

    var body: some View {
        let bfsData = graph.bfsLevels(startingFrom: 1)
        BarGraphView(data: bfsData)
    }
}


#Preview {
    ContentView()
}
