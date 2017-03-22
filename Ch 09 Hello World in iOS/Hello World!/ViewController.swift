//
//  ViewController.swift
//  Hello World!
//
//  Created by Iversen, Jakob H on 2/20/17.
//  Copyright © 2017 Leaning Mobile Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var lblOutput: UILabel!
    @IBAction func showOutput(_ sender: Any) {
        let name = txtName.text
        let output = "Hello " + name!
        lblOutput.text = output
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func dismissKeyboard(){
        view.endEditing(true)
    }

}

