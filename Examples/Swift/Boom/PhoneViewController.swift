//
//  ViewController.swift
//  Boom
//
//  Created by Sergey P on 31.05.2018.
//  Copyright © 2018 Boomware. All rights reserved.
//

import UIKit
import Boomware

class PhoneViewController: UIViewController
{

    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    // MARK: Actions
    
    @IBAction func actionGo(_ sender: Any) {
        guard let number = self.phoneField.text else {
            return
        }

        guard let params = BWParams(method: self.selectedVerificationMethod(), phoneNumber: number) else {
            return
        }

        params.from = nil

        BWBoomware.verify(params: params) { (error) in
            if let err = error as NSError? {
                let alert = UIAlertController(title: "Error", message: err.localizedDescription, preferredStyle: .alert)
                let action = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            } else {

                self.performSegue(withIdentifier: "PINSegue", sender: nil)
            }
        }
    }
    
    // MARK: Private
    private func selectedVerificationMethod() -> String
    {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            return BWParamsMethodSMS
            
        case 1:
            return BWParamsMethodVoice
            
        default:
            return BWParamsMethodCall
        }
    }

}

