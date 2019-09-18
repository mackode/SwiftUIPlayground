//
//  SettingsView.swift
//  SwiftUIPlayground
//
//  Created by Mackode - Bartlomiej Makowski on 18/09/2019.
//  Copyright © 2019 pl.mackode. All rights reserved.
//

import Combine
import SwiftUI

class Order: ObservableObject, Codable {
    enum CodingKeys: String, CodingKey {
        case type, number, extraSection, extra, name, city
    }

    var objectWillChange = PassthroughSubject<Void, Never>()

    static let types = ["Type1", "Type2", "Type3", "Type4"]

    var type = 0 { didSet { update() } }
    var number = 1 { didSet { update() } }

    var extraSection = false { didSet { update() } }
    var extra = false { didSet { update() } }

    var name = "" { didSet { update() } }
    var city = "" { didSet { update() } }

    var valid: Bool {
        if name.isEmpty || city.isEmpty {
            return false
        }

        return true
    }

    func update() {
        objectWillChange.send()
    }
}

struct SettingsView: View {
    @ObservedObject var order = Order()

    @State var message = ""
    @State var messageVisible = false

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $order.type, label: Text("Select type")) {
                        ForEach(0 ..< Order.types.count) {
                            Text(Order.types[$0]).tag($0)
                        }
                    }

                    Stepper(value: $order.number, in: 1...100) {
                        Text("Number \(order.number)")
                    }
                }

                Section {
                    Toggle(isOn: $order.extraSection) {
                        Text("Extra section")
                    }

                    if order.extraSection {
                        Toggle(isOn: $order.extra) {
                            Text("Extra stuff")
                        }
                    }
                }

                Section {
                    TextField("Name", text: $order.name)
                    TextField("City", text: $order.city)
                }

                Section {
                    Button(action: {
                        self.sendOrder()
                    }) {
                        Text("Send")
                    }
                }.disabled(!order.valid)
            }
            .navigationBarTitle(Text("Create Order"))
            .alert(isPresented: $messageVisible) {
                Alert(title: Text("Order state"), message: Text(message), dismissButton: .default(Text("Ok")))
            }
        }
    }

    func sendOrder() {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Encode failed")
            return
        }

        print(String(data: encoded, encoding: String.Encoding.utf8)!)
        self.message = "Order delivered"
        self.messageVisible = true
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
