//
//  ContentView.swift
//  Moonshot
//
//  Created by Macmaurice Osuji on 3/20/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var numOfRows = 150.0
    
    
    
    var body: some View {
        let columns = [
            GridItem(.adaptive(minimum: numOfRows))
        ]
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100,height: 100)
                                    .padding()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Text(mission.formattedlaunchdate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                            .shadow(radius: 10)
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        if numOfRows == 150 {
                            numOfRows = 400
                        } else {
                            numOfRows = 150
                        }
                        
                    }) {
                        HStack {
                            if numOfRows == 150 {
                                Image(systemName: "arrow.down.forward.and.arrow.up.backward.circle")
                                    .resizable()
                                    .frame(width: 35,height: 35)
                            } else {
                                Image(systemName: "arrow.up.backward.and.arrow.down.forward.circle")
                                    .resizable()
                                    .frame(width: 35,height: 35)
                            }
                             
                            Text("")
                            
                        }
                        
                    }
                    
                }
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
