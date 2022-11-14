//
//  ViewController.swift
//  WordGame
//
//  Created by Hyejeong Park on 2022/11/14.
//

import UIKit

class ViewController: UIViewController {
  
  let gameManager = WordGameManager.shared

  @IBOutlet weak var currentWordLabel: UILabel!
  
  @IBOutlet weak var nextWordLabel: UILabel!
  
  @IBOutlet weak var typedWordTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    gameManager.startGame()
    currentWordLabel.text = gameManager.latestWords.0
    nextWordLabel.text = gameManager.latestWords.1
  }

  @IBAction func startEditing(_ sender: Any) {
    if typedWordTextField.canBecomeFirstResponder && typedWordTextField.isFirstResponder {
      typedWordTextField.becomeFirstResponder()
    }
  }
  
  @IBAction func compare(_ sender: Any) {
    guard let input = typedWordTextField.text else { return }
    compareWord(with: input.trimmingCharacters(in: .whitespacesAndNewlines))
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    typedWordTextField.endEditing(true)
  }
  
  func compareWord(with inputText: String) {
    if inputText == gameManager.latestWords.0 {
      updateDataAndLabels()
    } else {
      currentWordLabel.textColor = .red
    }
    typedWordTextField.text = ""
  }
  
  func updateDataAndLabels() {
    gameManager.goOntoNextStep()
    currentWordLabel.text = gameManager.latestWords.0
    nextWordLabel.text = gameManager.latestWords.1
    currentWordLabel.textColor = .black
  }
}
