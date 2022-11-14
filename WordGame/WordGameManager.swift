//
//  WordGameManager.swift
//  WordGame
//
//  Created by Hyejeong Park on 2022/11/14.
//

import Foundation

class WordGameManager {
  
  static let shared = WordGameManager.init()
  
  private init() {
    startGame()
  }
  
  private static let words: [String] = "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리".components(separatedBy: " ")
  
  private var remainingWords: [String] = WordGameManager.words
  
  private var retiredWords: [String] = []
  
  var current: String { retiredWords.last ?? "" }
  
  var next: String { remainingWords.last ?? "" }
  
  func startGame() {
    remainingWords = WordGameManager.words.shuffled()
    retiredWords = []
    let firstWord = remainingWords.popLast() ?? ""
    retiredWords.append(firstWord)
  }
  
  func goOntoNextStep() {
    guard let current = remainingWords.popLast() else { return }
    retiredWords.append(current)
  }
}
