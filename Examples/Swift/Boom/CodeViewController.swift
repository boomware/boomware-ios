//
//  CodeViewController.swift
//  Boom
//
//  Created by Sergey P on 31.05.2018.
//  Copyright © 2018 Boomware. All rights reserved.
//

import UIKit
import Boomware

class CodeViewController: UIViewController {

    @IBOutlet weak var codeField: UITextField!
    
    @IBAction func actionCheckCode(_ sender: Any) {

        BWBoomware.confirm(code: self.codeField.text!) { (requestId, phone, error) in

            if let err = error as NSError? {
                let alert = UIAlertController(title: "Error", message: err.localizedDescription, preferredStyle: .alert)
                let action = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            } else {

                self.performSegue(withIdentifier: "SuccessSegue", sender: nil)
            }
        }
    }
}
