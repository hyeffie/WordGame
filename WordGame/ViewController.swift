//
//  ViewController.swift
//  WordGame
//
//  Created by Hyejeong Park on 2022/11/14.
//

import UIKit

class ViewController: UIViewController {
  
  var game = WordGame()

  @IBOutlet weak var currentWordLabel: UILabel!
  
  @IBOutlet weak var nextWordLabel: UILabel!
  
  @IBOutlet weak var typedWordTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    currentWordLabel.text = game.current
    nextWordLabel.text = game.next
  }

  @IBAction func startEditing(_ sender: Any) {
    if typedWordTextField.canBecomeFirstResponder && typedWordTextField.isFirstResponder {
      typedWordTextField.becomeFirstResponder()
    }
  }
  
  @IBAction func compare(_ sender: Any) {
    guard let input = typedWordTextField.text else { return }
    compareAndUpdate(with: input.trimmingCharacters(in: .whitespacesAndNewlines))
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    typedWordTextField.endEditing(true)
  }
  
  func compareAndUpdate(with text: String) {
    if game.compareAndUpdate(with: text) {
      currentWordLabel.text = game.current
      nextWordLabel.text = game.next
      currentWordLabel.textColor = .black
    } else {
      currentWordLabel.textColor = .red
    }
    typedWordTextField.text = ""
  }
}
