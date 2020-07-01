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
                        // This is optional and simply displays an icon during an active search
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
                            // This simply lists the results, use a button in case you'd like to perform an action or use a NavigationLink to move to the next view upon selection.
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
