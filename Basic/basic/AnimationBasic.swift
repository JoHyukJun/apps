//
//  AnimationBasic.swift
//  Basic
//
//  Created by johyukjun on 8/28/24.
//

import SwiftUI

struct AnimationBasic: View {
    // property
    @State var isAnimated: Bool = false
    let timing: Double = 5.0
    
    var body: some View {
        VStack {
            Button {
                withAnimation(
                    .default
                        .repeatCount(5)
                        // .repeatForever()
                        .delay(1.0)
                ) {
                    isAnimated.toggle()
                }
            } label: {
                Text("button")
            }

            Spacer()
            
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 0)
                .fill(isAnimated ? Color.red : Color.green)
                .frame(width: isAnimated ? 100 : 300,
                       height: isAnimated ? 100 : 300
                )
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 100 : 0)
            
            Spacer()
        }
        
        VStack {
            Button {
                isAnimated.toggle()
            } label: {
                Text("button")
            }

            // linear animation
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 50, height: 100)
                .animation(.linear(duration: timing), value: isAnimated)
            
            // easeIn animation
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 50, height: 100)
                .animation(.easeIn(duration: timing), value: isAnimated)
            
            // easeOut animation
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 50, height: 100)
                .animation(.easeOut(duration: timing), value: isAnimated)
            
            // easeInOut animation
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 50, height: 100)
                .animation(.easeInOut(duration: timing), value: isAnimated)
        }
        
        VStack {
            Button {
                // response: 단일 진동 완료하는 시간
                // damping: 스프링 정지 속도 제어 (0 - 1)
                // blendDuration: 다른 애니메이션 간의 전환 길이 제어
                withAnimation(.spring(
                    response: 0.5, dampingFraction: 0.5, blendDuration: 0)) {
                        isAnimated.toggle()
                    }
            } label: {
                Text("button")
            }

            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 50, height: 100)
        }
    }
}

#Preview {
    AnimationBasic()
}
