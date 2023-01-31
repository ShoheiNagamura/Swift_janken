//
//  ContentView.swift
//  Swift_janken
//
//  Created by shouhei nagamura on 2023/01/31.
//

import SwiftUI

struct ContentView: View {
    
    @State var imageName = "janken"
    @State var result = "結果"
    
    var body: some View {
        VStack(spacing:32){
            Image(imageName)
                .resizable()
                .frame(maxWidth: .infinity)
            HStack(spacing:16){
                Button("ぐー"){
                    showResult(myHand: .gu)
                }
                .frame(maxWidth: .infinity, minHeight: 50) //サイズ
                .background(.green)
                .foregroundColor(.white)
                        
                Button("ちょき"){
                    showResult(myHand: .choki)
                }
                .frame(maxWidth: .infinity, minHeight: 50) //サイズ
                .background(.red)
                .foregroundColor(.white)
                        
                Button("ぱー"){
                    showResult(myHand: .pa)
                }
                .frame(maxWidth: .infinity, minHeight: 50) //サイズ
                .background(.blue)
                .foregroundColor(.white)
            }
            Text(result)
        }
        .padding(40.0)
    }
    
    func showResult(myHand: JankenHand) {
        let comHand = JankenHand(rawValue: Int.random(in: 0...2))!
        
        if comHand == .gu {
           imageName = "gu"
        } else if comHand == .choki {
           imageName = "choki"
        } else {
           imageName = "pa"
        }
        
        
        // showResultの続き
        if myHand == .gu {
            if comHand == .gu {
                result = "引き分け" // 自分がgu、相手が
            } else if comHand == .choki {
                result = "勝ち"
            } else {
                result = "負け"
            }
        } else if myHand == .choki {
            if comHand == .gu {
                result = "負け"
            } else if comHand == .choki {
                result = "引き分け"
            } else {
                result = "勝ち"
            }
         } else {
             if comHand == .gu {
               result = "勝ち"
             } else if comHand == .choki {
               result = "負け"
            } else {
               result = "引き分け"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum JankenHand :Int {
case gu , choki , pa
}
