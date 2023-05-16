//
//  ContentView.swift
//  SideOoy
//
//  Created by Content Arcade on 16/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isSidebarOpened = false
    var sideBarWidth = UIScreen.main.bounds.size.width * 0.85
    var bgColor: Color =
    Color(.init(
        red: 52 / 255,
        green: 70 / 255,
        blue: 182 / 255,
        alpha: 1))
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(0..<8) { _ in
                        AsyncImage(
                            url: URL(
                                string: "https://picsum.photos/600"
                            )) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 240)
                            } placeholder: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.gray.opacity(0.6))
                                        .frame(height: 240)
                                    ProgressView()
                                }
                            }
                            .aspectRatio(3 / 2, contentMode: .fill)
                            .cornerRadius(12)
                            .padding(.vertical)
                            .shadow(radius: 4)
                    }
                }
                .toolbar {
                    Button {
                        isSidebarOpened.toggle()
                    } label: {
                        Label("Toggle SideBar",
                              systemImage: "line.3.horizontal.circle.fill")
                    }
                }
                .listStyle(.inset)
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
            }
            sideBarContent()
        }
    }
    
    
    @ViewBuilder func sideBarContent() -> some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(.black.opacity(0.6))
            .opacity(isSidebarOpened ? 1 : 0)
            .animation(.easeInOut.delay(0.2), value: isSidebarOpened)
            .onTapGesture {
                isSidebarOpened.toggle()
            }
            content
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    var content: some View {
        HStack(alignment: .top) {
            ZStack(alignment: .top) {
                bgColor
            }
            .frame(width: sideBarWidth)
            .offset(x: isSidebarOpened ? 0 : -sideBarWidth)
            .animation(.default, value: isSidebarOpened)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
