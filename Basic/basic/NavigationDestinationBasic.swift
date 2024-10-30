//
//  NavigationDestinationBasic.swift
//  Basic
//
//  Created by johyukjun on 10/15/24.
//

import SwiftUI

// MARK: - NavigationDestination
struct NavigationDestinationBasic: View {
    var body: some View {
        NavigationStack {
            // NavigationLink 에서 value 값을 navigationDestination 으로 값을 넘겨 줄 수 있음(type check)
            
            VStack(spacing: 20) {
                NavigationLink(value: "String Test") {
                    Text("Navigation 1")
                }
                
                NavigationLink(value: true) {
                    Text("Navigation 2")
                }
            }
            .navigationDestination(for: String.self, destination: { stringValue in
                Text("value ") + Text(stringValue).bold()
            })
            .navigationDestination(for: Bool.self, destination: { boolValue in
                Text("value: ") + Text("\(boolValue.description)").bold()
            })
            .navigationTitle("Navigation Destination")
        }
    }
}

// MARK: - NavigationLink with Sheet
struct NavigationLinkIsPresented: View {
    @State private var showSheet: Bool = false
    @State private var navigate: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Button("Show Sheet") {
                    showSheet.toggle()
                }
            }
            .navigationTitle("Navigation with Sheet")
            .sheet(isPresented: $showSheet, content: {
                VStack(spacing: 20) {
                    NavigationLink {
                        Text("Destination from link")
                    } label: {
                        Text("NavigationLink")
                    }
                    
                    Button("Button Link") {
                        showSheet = false
                        navigate = true
                    }
                } // VStack
            })
            .navigationDestination(isPresented: $navigate) {
                Text("Destination from button")
            }
        }
        .padding()
    }
}


// MARK: - Model
struct ProductForNav: Hashable {
    var name: String
    var price: Double
}

struct DateForNav: Hashable {
    var name: String
    var date: Date
}

// MARK: - Path
struct NavigationLinkPath: View {
    @State private var product = ProductForNav(name: "Apple", price: 100)
    @State private var date = DateForNav(name: "buying date", date: .now)
    @State private var navPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navPath) {
            VStack(spacing: 20) {
                List {
                    NavigationLink(value: product) {
                        Text(product.name)
                    }
                    
                    NavigationLink(value: date) {
                        Text(date.name)
                    }
                }
            }
            .navigationTitle("Order")
            // navigationDestination 에서 path 로 넘어온 Link 값을 설정
            .navigationDestination(for: ProductForNav.self) { product in
                List {
                    Text(product.name)
                    Text(product.price, format: .currency(code: "USD"))
                        .foregroundStyle(.secondary)
                }
                .navigationTitle("Price Detail")
            }
            .navigationDestination(for: DateForNav.self) { when in
                List {
                    Text(when.name)
                    Text(when.date.formatted(date: .long, time: .omitted))
                        .foregroundStyle(.secondary)
                }
                .navigationTitle("Date Detail")
            }
        }
    }
}

// MARK: - To Root View
struct NavigationLinkToRoot: View {
    //property
    @State private var navPath: [String] = []
    
    var body: some View {
        NavigationStack(path: $navPath) {
            VStack(spacing: 20) {
                NavigationLink(value: "view 2") {
                    Text("move to view 2")
                }
                NavigationLink(value: "view 3") {
                    Text("move to view 3")
                }
            } // VStack
            .navigationTitle("To Root")
            .navigationDestination(for: String.self) { pathValue in
                if pathValue == "view 2" {
                    NavLink2(navPath: $navPath)
                }
                else {
                    NavLink3(navPath: $navPath)
                }
            }
        }
        .font(.title)
        .padding()
    }
}

struct NavLink2: View {
    @Binding var navPath: [String]
    
    var body: some View {
        VStack(spacing: 20) {
            // navPath 에 view 3 으로 value 값 넘기기
            NavigationLink(value: "view 3") {
                Text("move to view 3")
            }
            
            Text("NavPath: ")
            Text(navPath, format: .list(type: .and, width: .narrow))
        }
        .padding()
    }
}

struct NavLink3: View {
    @Binding var navPath: [String]
    
    var body: some View {
        VStack(spacing: 20) {
            Button("move to root view") {
                navPath.removeAll()
            }
            
            Text("NavPath: ")
            Text(navPath, format: .list(type: .and, width: .narrow))
        }
        .padding()
    }
}


#Preview {
    NavigationDestinationBasic()
}

#Preview("NavigationLinkIsPresented") {
    NavigationLinkIsPresented()
}

#Preview("NavigationLinkPath") {
    NavigationLinkPath()
}

#Preview("NavigationLinkToRoot") {
    NavigationLinkToRoot()
}
