//
//  SearchView.swift
//  EntertainmentLimitless
//
//  Created by Duilio Rosciano on 11/13/22.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            Text("Searching for \(searchText)")
                .searchable(text: $searchText, prompt: "Enter your Movie or TV Series")
                .navigationTitle("Entertainment Limiltess")
                
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

