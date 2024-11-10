//
//  IntroView.swift
//  Intermediate
//
//  Created by johyukjun on 11/10/24.
//

import SwiftUI
import SwiftData


struct IntroView: View {
    // @Enviroment 를 사용해서 가상 공간인 modelContext 를 만들고 선언함
    @Environment(\.modelContext) private var modelContext
    // @Query 는 View 에서 요청을 할 때 View -> modelContext 에 저장된 SwiftData 를 요청하고 그 요청된 값을 다시 View 에 자동으로 연결
    @Query private var people: [SampleModel]
    
    var body: some View {
        VStack(spacing: 20) {
            Button {
                // Create random data
                let name = ["derek", "karma", "police"].randomElement()
                let age = [10, 30, 20].randomElement()
                
                let person = SampleModel(name: name ?? "", age: age ?? 0)
                
                // person 을 modelContext 를 통해 SwiftData 저장
                modelContext.insert(person)
            } label: {
                Text("Add Person")
            }
            .padding()
            
            List(people, id: \.self) { person in
                HStack {
                    Text(person.name)
                    
                    Spacer()
                    
                    Text("\(person.age)")
                        .font(.caption)
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    IntroView()
        .modelContainer(for: SampleModel.self)
}
