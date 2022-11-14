//
//  ViewController.swift
//  WordGame
//
//  Created by Hyejeong Park on 2022/11/14.
//

import UIKit

class ViewController: UIViewController {
  
  var words = "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리".components(separatedBy: " ")
  
  var winCount: Int = 0

  @IBOutlet weak var currentWordLabel: UILabel!
  
  @IBOutlet weak var nextWordLabel: UILabel!
  
  @IBOutlet weak var typedWordTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    words.shuffle()
    
    currentWordLabel.text = words[winCount]
    nextWordLabel.text = words[winCount + 1]
  }

  @IBAction func startEditing(_ sender: Any) {
    if typedWordTextField.canBecomeFirstResponder && typedWordTextField.isFirstResponder {
      typedWordTextField.becomeFirstResponder()
    }
  }
  
  @IBAction func compareWords(_ sender: Any) {
    guard let input = typedWordTextField.text,
          winCount < words.count else { return }
    
    let typedWord = input.trimmingCharacters(in: .whitespacesAndNewlines)
    let currentWord = words[winCount]
    
    if typedWord == currentWord {
      winCount += 1
      updateWords(with: winCount)
      currentWordLabel.textColor = .black
    } else {
      currentWordLabel.textColor = .red
    }
    typedWordTextField.text = ""
  }
  
  func updateWords(with nextIndex: Int) {
    currentWordLabel.text = nextWordLabel.text
    nextWordLabel.text = nextIndex + 1 < words.count ? words[nextIndex + 1] : ""
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    typedWordTextField.endEditing(true)
  }
}
