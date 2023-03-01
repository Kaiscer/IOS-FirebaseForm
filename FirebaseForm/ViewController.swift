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
    
    @IBAction func btnSave(_ sender: UIButton) {
        
        db.collection("usuarios").document(tvExpect.text!).setData(["usuarios": tvName.text ?? "", "email":tvmail.text ?? ""])
        
        
    }
    
    @IBAction func btnSearhc(_ sender: UIButton) {
        db.collection("usuarios").document(tvExpect.text!).getDocument{
            (DocumentSnapshot, error) in
            if let document = DocumentSnapshot, error == nil {
                
                self.tvName.text = document.get("usuario") as? String
                self.tvmail.text = document.get("emial") as? String
                
            }
        }
    }
    
    @IBAction func btnDeleted(_ sender: UIButton) {
        db.collection("usuarios").document(tvExpect.text!).delete()
        tvExpect.text = ""
        tvName.text = ""
        tvmail.text = ""
    }
}

