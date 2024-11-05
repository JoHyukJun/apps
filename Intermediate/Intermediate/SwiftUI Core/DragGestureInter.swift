//
//  DragGestureInter.swift
//  Intermediate
//
//  Created by johyukjun on 11/2/24.
//

import SwiftUI


struct DragGestureInter: View {
    // offset: 기준이 되는 주소에 더해지는 값
    // View 타입에서 x, y 축 값 입력을 통해 View 의 위치 조정
    // CGSize: .zero -> x:0, y:0
    @State var offset: CGSize = .zero
    
    var body: some View {
        ZStack {
            VStack {
                Text("\(offset.width)")
                
                Spacer()
            } // VStack
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 500)
                .offset(offset)
                .scaleEffect(getScaleAmount())
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.spring()) {
                                offset = value.translation
                            }
                        })
                        .onEnded({ value in
                            withAnimation(.spring()) {
                                offset = .zero
                            }
                        })
                )
        }
    }
    
    func getScaleAmount() -> CGFloat {
        let max = (NSScreen.main?.visibleFrame.size.width)! / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        
        return 1.0 - min(percentage, 0.5)
    }
}

struct DragGestureInter2: View {
    @State var startOffsetY: CGFloat = (NSScreen.main?.visibleFrame.size.height)! * 0.28
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            FrontView()
            
            LoginView()
                .offset(y: startOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.spring()) {
                                currentDragOffsetY = value.translation.height
                            }
                        })
                    
                        .onEnded({ value in
                            withAnimation(.spring()) {
                                if currentDragOffsetY < -150 {
                                    // cancle offset
                                    endingOffsetY = -startOffsetY
                                }
                                else if (endingOffsetY != 0 && currentDragOffsetY > 150) {
                                    endingOffsetY = 0
                                }
                                currentDragOffsetY = 0
                            }
                        })
                )
        }
    }
}

struct FrontView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("unlucky strike")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top, 70)
            
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("Welcome!")
                .multilineTextAlignment(.center)
            
            Button {
                
            } label: {
                Text("Login")
                    .foregroundStyle(.white)
                    .font(.title)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.black.cornerRadius(10))
            }
            
            Spacer()
        } // VStack
        .frame(maxWidth: .infinity)
        .background(Color.green)
        .ignoresSafeArea()
    }
}

struct LoginView: View {
    @State private var id: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chevron.up")
                .padding(.top)
            
            Text("Login with drag")
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.bottom)
            
            Text("Login")
                .font(.title)
                .padding()
            
            TextField("ID", text: $id)
                .padding()
                .background(Color.gray.opacity(0.2))
                .padding(.horizontal)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .padding(.horizontal)
            
            Button {
                
            } label: {
                Text("LOGIN")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .padding(.horizontal)
            }
            
            Spacer()
            
            Text("Cancle with drag")
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.bottom)
            
            Image(systemName: "chevron.down")
                .padding(.bottom)
        } // VStack
        .background(Color.blue)
    }
}
#Preview {
    DragGestureInter()
}

#Preview("DragGestureInter2") {
    DragGestureInter2()
}
