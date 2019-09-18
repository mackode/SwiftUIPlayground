//
//  ContentView.swift
//  SwiftUIPlayground
//
//  Created by Mackode - Bartlomiej Makowski on 28/08/2019.
//  Copyright © 2019 pl.mackode. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State var first: String = ""
    @State var second: String = ""

    @State var data = [String]()

    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    VStack {
                        Group {
                            TextField("first", text: $first)
                                .padding(12.0)
                        }
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 6.0))
                        .shadow(radius: 5.0)

                        Group {
                            TextField("second", text: $second)
                                .padding(12.0)
                        }
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .shadow(radius: 5.0)

                        Button(action: {
                            self.data.append("\(self.first) \(self.second)")
                            self.first = ""
                            self.second = ""
                        }) {
                            Group {
                                Text("add").foregroundColor(Color.white)
                            }
                            .padding(12.0)
                            .background((self.first.count + self.second.count > 0 ? Color.blue : Color.gray))
                            .clipShape(RoundedRectangle(cornerRadius: 6.0))
                            .shadow(radius: 5.0)
                        }
                    }.padding(10.0)
                }.background(Color.gray)

                List(data, id: \.self) {item in
                    Text(item)
                }

                NavigationLink(destination: SettingsView()) {
                    Text("Settings")
                }
            }
            .navigationBarTitle(Text("Test field state"))
            .navigationBarItems(leading: HStack {
                Text("first")
                Text(first).foregroundColor(Color.red)
                Text("second")
                Text(second).foregroundColor(Color.red)
            })
        }
    }
    /*
    var body: some View {
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)

            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack(alignment: .top) {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }
            .padding()

            Spacer()
        }
    }
    */
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
