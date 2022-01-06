//
//  ContentView.swift
//  hirokiKadai6
//
//  Created by 河村宇記 on 2022/01/03.
//

import SwiftUI

struct ContentView: View {
    private static let range = 1...100
    @State private var randomNum: Int = Int.random(in: Self.range)
    @State private var sliderNum: Double = 1.0
    @State private var judgeAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        VStack {
            Text("\(randomNum)")
                .font(.largeTitle)
                .padding()
            Slider(value: $sliderNum, in: Double(Self.range.lowerBound)...Double(Self.range.upperBound))
                .padding(.horizontal)

            HStack {
                Text("1")
                    .padding()
                
                Spacer()
                
                Text("100")
                    .padding()
            }
            
            Button(action: {
                alertMessage = numJudge()
                judgeAlert = true
                randomNum = Int.random(in: Self.range)
            }) { Text("判定！") }
            .alert("結果", isPresented: $judgeAlert, actions: {}, message: {Text(alertMessage)})
        }
    }
    
    private func numJudge() -> String {
        let firstLine = randomNum == Int(sliderNum) ? "あたり！" : "はずれ！"
        return "\(firstLine)\n" + "あなたの値: \(Int(sliderNum))"
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
