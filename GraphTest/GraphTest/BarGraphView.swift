//
//  BarGraphView.swift
//  GraphTest
//
//  Created by Joon Ho Gwak on 7/2/24.
//

import SwiftUI

// Bar graph view
struct BarGraphView: View {
    let data: [Int: Int]

    var body: some View {
        VStack {
            Text("Bar Graph of Nodes per Level")
                .font(.headline)

            HStack(alignment: .bottom) {
                ForEach(data.keys.sorted(), id: \.self) { level in
                    VStack {
                        Text("\(data[level]!)")
                            .font(.caption)
                            .rotationEffect(.degrees(0))
                            .offset(y: data[level]! > 0 ? -10 : 0)

                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 20, height: CGFloat(data[level]!) * 20)
                    }
                }
            }
            .padding()
        }
    }
}

// Preview
#Preview {
        let sampleData: [Int: Int] = [
            0: 1,
            1: 2,
            2: 1
        ]
        return BarGraphView(data: sampleData)
}
