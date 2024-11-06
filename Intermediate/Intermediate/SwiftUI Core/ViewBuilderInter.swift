//
//  ViewBuilderInter.swift
//  Intermediate
//
//  Created by johyukjun on 11/2/24.
//

import SwiftUI

struct ViewBuilderInter: View {
    var body: some View {
        VStack {
            HeaderComponent(title: "general component", description: "component description optional", iconName: "gear")
            HeaderComponent(title: "general component 2", description: nil, iconName: nil)
            
            // content 는 View 타입이기 때문에 View 에서 사용할 수 있는 것들 사용 가능
//            HeaderGeneric(title: "generic component", content: Text("additional content"))
//            HeaderGeneric(title: "generic component 2", content: Image(systemName: "camera"))
//            HeaderGeneric(title: "generic component 3", content: HStack{
//                Text("HStack")
//                Image(systemName: "photo.stack")
//            })
            
            // @ViewBuilder
            // content 를 return 할 수 있게 func 생성하여 쉽게 View 를 사용 가능
            // 클로저 안에서 content 사용 가능
            HeaderGeneric(title: "@ViewBuilder Component") {
                HStack {
                    Text("@ViewBuilder")
                    Image(systemName: "building")
                }
            }
            
            // ViewBuilder Custom 사용
            CustomHStack {
                Text("CustomHStack")
                Text("CustomHStack")
            }
            
            Spacer()
        } // VStack
    }
}

struct HeaderComponent: View {
    let title: String
    let description: String?
    let iconName: String?
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                if let description = description {
                    Text(description)
                        .font(.caption)
                }
                
                if let iconName = iconName {
                    Image(systemName: iconName)
                }
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 2)
            } // VStack
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        } // VStack
    }
}

struct HeaderGeneric<Content: View>: View {
    let title: String
    let content: Content
    
    // generic 확장 -> ViewBuilder
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content() // content() 해서 함수 초기화
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                content
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 2)
            } // VStack
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        } // VStack
    }
}

struct CustomHStack<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
        }
    }
}

struct LocalViewBuilder: View {
    enum ViewType {
        case one, two, three
    }
    
    let type: ViewType
    
    var body: some View {
        VStack {
            numberPlate
        }
    }
    
    @ViewBuilder private var numberPlate: some View {
        if type == .one {
            view1
        }
        else if type == .two {
            view2
        }
        else if type == .three {
            view3
        }
    }
    
    private var view1: some View {
        Text("one")
    }
    
    private var view2: some View {
        VStack {
            Text("two")
            Image(systemName: "2.circle")
        }
    }
    
    private var view3: some View {
        Image(systemName: "3.circle")
    }
}

#Preview {
    ViewBuilderInter()
}

#Preview("LocalViewBuilder") {
    LocalViewBuilder(type: .one)
}
