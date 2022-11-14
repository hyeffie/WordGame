//
//  ViewController.swift
//  WordGame
//
//  Created by Hyejeong Park on 2022/11/14.
//

import UIKit

class ViewController: UIViewController {
  
  var gameManager = WordGameManager.shared

  @IBOutlet weak var currentWordLabel: UILabel!
  
  @IBOutlet weak var nextWordLabel: UILabel!
  
  @IBOutlet weak var typedWordTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    currentWordLabel.text = gameManager.current
    nextWordLabel.text = gameManager.next
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
    if inputText == gameManager.current {
      updateDataAndLabels()
    } else {
      currentWordLabel.textColor = .red
    }
    typedWordTextField.text = ""
  }
  
  func updateDataAndLabels() {
    gameManager.goOntoNextStep()
    currentWordLabel.text = gameManager.current
    nextWordLabel.text = gameManager.next
    currentWordLabel.textColor = .black
  }
}
