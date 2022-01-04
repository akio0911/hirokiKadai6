//
//  ContentView.swift
//  hirokiKadai6
//
//  Created by 河村宇記 on 2022/01/03.
//

import SwiftUI

struct ContentView: View {
    @State private var randomNum: Int = Int.random(in: 1...100)
    @State private var sliderNum: Double = 1.0
    @State private var judgeAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        VStack {
            Text("\(randomNum)")
                .font(.largeTitle)
                .padding()
            
            Slider(value: $sliderNum, in: 1...100)
                .padding(.horizontal)

            HStack {
                Text("1")
                    .padding()
                
                Spacer()
                
                Text("100")
                    .padding()
            }
            
            Button(action: {
                numJudge()
                judgeAlert = true
                randomNum = Int.random(in: 1...100)
            }) { Text("判定！") }
            .alert("結果", isPresented: $judgeAlert, actions: {}, message: {Text(alertMessage)})
        }
    }
    
    private func numJudge() {
        if randomNum == Int(sliderNum) {
            alertMessage = "あたり！\n" + "あなたの値: \(Int(sliderNum))"
        } else {
            alertMessage = "はずれ！\n" + "あなたの値: \(Int(sliderNum))"
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
