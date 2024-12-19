//
//  ContentView.swift
//  iTour
//
//  Created by Piergiorgio Gonni on 2024-12-19.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query var destinations: [Destination]
    @Environment(\.modelContext) var modelContext

    func addSamples() {
        let rome = Destination(name: "Rome")
        let florence = Destination(name: "Florence")
        let naples = Destination(name: "Naples")
        modelContext.insert(rome)
        modelContext.insert(florence)
        modelContext.insert(naples)
    }

    var body: some View {
        List {
            Text("wtf")
            ForEach(destinations) { destination in
                Text(destination.name)
                    .font(.headline)
                Text(destination.details)
                    .font(.subheadline)
                Text(destination.date.formatted(date: .long, time: .shortened))
                    .font(.caption)
                Text("Priority: \(destination.priority)")
            }
            .navigationTitle("Destinations")
        }
        .toolbar {
            Button("Add samples", action: addSamples)
        }
    }
}

#Preview {
    ContentView()
}
