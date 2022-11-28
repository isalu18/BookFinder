//
//  SnapCarousel.swift
//  BookFinder
//
//  Created by Isaac Sanchez on 05/09/22.
//

import SwiftUI

struct SnapCarousel<Content: View, T: Identifiable>: View {
    var category: String
    var content: (T) -> Content
    var list: [T]
    var spacing: CGFloat
    var trailingSpace: CGFloat
    
    @Binding var index: Int
    @State private var height = 0.0
    
    init(spacing: CGFloat = 15, trailingSpace: CGFloat = 100, category: String, index: Binding<Int>, items: [T], @ViewBuilder content: @escaping (T) -> Content) {
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self.category = category
        self._index = index
        self.content = content
    }
    
    @GestureState var offSet: CGFloat = 0
    @State var currentIndex: Int = 0
    
    var body: some View {
        VStack {
            Text(category)
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.title3)
                .padding()
            GeometryReader { proxy in
                
                let width = proxy.size.width - (trailingSpace - spacing)
                let adjustmentWidth = (trailingSpace / 2) - spacing
                
                HStack(spacing: spacing) {
                    ForEach(list) { book in
                        content(book)
                            .frame(width: proxy.size.width - trailingSpace)
                    }
                }
                .padding(.horizontal, spacing)
                .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustmentWidth : 0) + offSet)
                .gesture(
                    DragGesture()
                        .updating($offSet, body: { value, out, _ in
                            out = value.translation.width
                        })
                        .onEnded({ value in
                            let offSetX = value.translation.width
                            
                            let progress = -offSetX / width
                            
                            let roundIndex = progress.rounded()
                            
                            currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                            
                            currentIndex = index
                        })
                        .onChanged({ value in
                            let offSetX = value.translation.width
                            
                            let progress = -offSetX / width
                            
                            let roundIndex = progress.rounded()
                            
                            index = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                        })
                )
                .onAppear {
                    height = proxy.size.width
                }
            }
            .frame(height: height * 1.15)
            .animation(.easeInOut, value: offSet == 0)
            
            HStack(spacing: 10) {
                ForEach(list.indices, id: \.self) { index in
                    Circle()
                        .fill(.black.opacity(currentIndex == index ? 1 : 0.1))
                        .frame(width: 10, height: 10)
                        .scaleEffect(currentIndex == index ? 1.4 : 1)
                        .animation(.spring(), value: currentIndex == index)
                }
            }
            .padding(.vertical)
        }
    }
}

struct SnapCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
