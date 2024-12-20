//
//  ContentView.swift
//  iTour
//
//  Created by Piergiorgio Gonni on 2024-12-19.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query(sort: [
        SortDescriptor(\Destination.priority, order: .reverse),
        SortDescriptor(\Destination.name)
    ]) var destinations: [Destination]
    @Environment(\.modelContext) var modelContext
    @State private var path = [Destination]()

    func addSamples() {
        let rome = Destination(name: "Rome")
        let florence = Destination(name: "Florence")
        let naples = Destination(name: "Naples")
        modelContext.insert(rome)
        modelContext.insert(florence)
        modelContext.insert(naples)
    }

    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }

    func createDestination() {
        let newDestination = Destination()
        modelContext.insert(newDestination)
        path = [newDestination]
    }

    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(destinations) { destination in
                    NavigationLink(value: destination) {
                        VStack(alignment: .leading) {
                            Text(destination.name)
                                .font(.headline)
                            if destination.details != "" {
                                Text(destination.details)
                                    .font(.subheadline)
                            }
                            Text(destination.date.formatted(date: .long, time: .shortened))
                                .font(.caption)
                            Text("Priority: \(destination.priority)")
                                .font(.caption2)
                        }
                    }
                }
                .onDelete(perform: deleteDestinations)
            }
            .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
            .navigationTitle("Destinations")
            .toolbar {
                Button { createDestination() } label: {
                    Label("Create", systemImage: "plus")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
