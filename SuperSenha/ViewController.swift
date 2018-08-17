//
//  ViewController.swift
//  SuperSenha
//
//  Created by retina on 28/02/18.
//  Copyright © 2018 retina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfCharacters: UITextField!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swCapitalLetters: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    } 
    // passando informações de 1 VC para PasswordsViewController
    // executado momentos antes da view controller apresentar a nova tela,
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // cria passwordsViewController para acessar as propriedades da classe passando os valores
        let passwordsViewController = segue.destination as! PasswordsViewController
        
        // se numberOfPasswords tiver um valor e puder se convertido para Int o valor vai ser passado
        if let numberOfPasswords = Int(tfTotalPasswords.text!) {
            passwordsViewController.numberOfPasswords = numberOfPasswords
        }
        
        // mesma coisa para numberOfCharacters
        if let numberOfCharacters = Int(tfNumberOfCharacters.text!) {
            passwordsViewController.numberOfCharacters = numberOfCharacters
        }
        
        // passa as informações dos switches ( true or false)
        passwordsViewController.useLetters = swLetters.isOn
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useCapitalLetters = swCapitalLetters.isOn
        passwordsViewController.useSpecialCharacters = swCapitalLetters.isOn
        view.endEditing(true)
    }

}

