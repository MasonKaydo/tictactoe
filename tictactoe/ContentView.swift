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
    @State var gameOver = false
    @State var winMessage = ""
    
    var body: some View {
        VStack {
            Text("Tic Tac Toe")
                .font(.title).bold()
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(120)), count: 3)) {
                ForEach(0..<9) { index in
                    ZStack {
                        Color.blue
                        Color.white
                            .opacity(moves[index] == "" ? 1 : 0.0)
                        Text(moves[index])
                            .font(.system(size: 90))
                            .fontWeight(.heavy)
                    }
                    .frame(width: 120, height: 120, alignment: .center)
                    .cornerRadius(30)
                    .onTapGesture {
                        withAnimation {
                            if !gameOver && moves[index] == "" {
                                moves[index] = xturn ? "X" : "O"
                                xturn.toggle()
                            }
                        }
                    }
                    .rotation3DEffect(.degrees(moves[index] == "" ? 180 : 0), axis: (0,1,0))
                }
            }
        }
        .preferredColorScheme(.dark)
        .alert(isPresented: $gameOver) {
            Alert(
                title: Text(winMessage),
                dismissButton: .default(Text("OK"), action: {
                    moves = Array(repeating: "", count: 9)
                    xturn = true
                })
            )
        }
        .onChange(of: moves) { oldValue, newValue in
            checkForWinner()
        }
    }
    
    private func checkForWinner() {
        if moves[0] != "" && moves[0] == moves[1] && moves[1] == moves[2] {
            winMessage = "\(moves[0]) Wins!"
            gameOver = true
        }
    }
}

#Preview {
    ContentView()
}

