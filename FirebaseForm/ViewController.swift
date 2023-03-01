//
//  ViewController.swift
//  FirebaseForm
//
//  Created by Kaiscer Vasquez on 1/3/23.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {

    // MARK: Outlets

    
    @IBOutlet weak var tvExpect: UITextField!
    @IBOutlet weak var tvName: UITextField!
    @IBOutlet weak var tvmail: UITextField!
    

    
    private let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    // MARK: Button Actions
    
    @IBAction func btnSave(_ sender: Any) {
        
        db.collection("usuarios").document(tvExpect.text!).setData(["usuarios": tvName.text ?? "", "email":tvmail.text ?? ""])
    }
    
    @IBAction func btnSearhc(_ sender: Any) {
    }
    
    @IBAction func btnDeleted(_ sender: Any) {
    }
}

