//
//  GenresView.swift
//  EntertainmentLimitless
//
//  Created by Martin Tercero on 11/29/22.
//

import SwiftUI

struct GenresView: View {
    var body: some View {
        VStack{
            Collapsible(
                label: {Text("Movies")},
                content: {
                    HStack{
                        Collapsible(
                            label: {Text("Genre")},
                            content: {
                                HStack {
                                    Text("Movie Genre")
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                            }
                        )
                        Spacer()
                    }
                }
            )
            
            Collapsible(
                label: {Text("Series")},
                content: {
                    HStack {
                        Text("Serie Genre")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                }
            )
        }
    }
}

struct GenresView_Previews: PreviewProvider {
    static var previews: some View {
        GenresView()
    }
}
