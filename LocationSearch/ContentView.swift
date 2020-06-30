//
//  ContentView.swift
//  LocationSearch
//
//  Created by Peter Alt on 6/30/20.
//  Copyright © 2020 Peter Alt. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject var locationService: LocationService
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Location Search")) {
                    ZStack(alignment: .trailing) {
                        TextField("Search", text: $locationService.queryFragment)
                        if locationService.status == .isSearching {
                            Image(systemName: "clock")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                Section(header: Text("Results")) {
                    List {
                        if locationService.status == .noResults {
                            Text("No Results")
                                .foregroundColor(Color.gray)
                        }
                        ForEach(locationService.searchResults, id: \.self) { completionResult in
                            Text(completionResult.title)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(locationService: LocationService())
    }
}
