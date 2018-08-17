//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by retina on 28/02/18.
//  Copyright © 2018 retina. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {

    
    @IBOutlet weak var tvPasswords: UITextView!
    
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    var passwordGenerator: PasswordsGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Total de senhas: \(numberOfPasswords)"
        passwordGenerator = PasswordsGenerator(numberOfCharacters: numberOfCharacters, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCharacters)
            
            generatePasswords()
        }
   
    func generatePasswords() {
        // leva o scroll para cima no inicio, 0,0
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        tvPasswords.text = ""
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
            tvPasswords.text.append(password + "\n\n")
        }
    }
    
    @IBAction func generate(_ sender: UIButton) {
        
        generatePasswords()
        
    }
    

}
