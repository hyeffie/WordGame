//
//  WordGame.swift
//  WordGame
//
//  Created by Hyejeong Park on 2022/11/14.
//

import Foundation

class WordGame {
  
  private static let words: [String] = "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리".components(separatedBy: " ")
  
  private var remainingWords: [String] = WordGame.words.shuffled()
  
  var current: String {
    remainingWords.last ?? ""
  }
  
  var next: String {
    remainingWords.count < 2 ? "" : remainingWords[remainingWords.count - 2]
  }
  
  private func goOntoNextStep() {
    let _ = remainingWords.popLast()
  }
  
  func resetGame() {
    remainingWords = WordGame.words.shuffled()
  }
  
  func compareAndUpdate(with text: String) -> Bool {
    if text == current {
      goOntoNextStep()
      return true
    } else {
      return false
    }
  }
}
