//
//  ContentView.swift
//  tictactoe
//
//  Created by mason kaydo on 11/4/25.
//

import SwiftUI

struct ContentView: View {
    @State var moves = Array(repeating: "", count: 9)
    @State private var xturn = true
    var body: some View {
        VStack {
            Text("Tic Tac Toe")
                .font(.title).bold()
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(120)), count: 3)){
                ForEach(0..<9){
                    index in
                    ZStack{
                        Color.blue
                        Text(moves[index])
                            .font(.system(size: 90))
                            .fontWeight(.heavy)
                    }
                        .frame(width: 120, height: 120, alignment: .center)
                        .cornerRadius(30)
                        .onTapGesture {
                            withAnimation {
                                if moves[index] == ""{
                                    moves[index] = xturn ? "X" : "O"
                                    xturn.toggle()
                                }
                            }
                        }
                }
            }
            
        }
        .preferredColorScheme(ColorScheme.dark)
    }
}

#Preview {
    ContentView()
}
