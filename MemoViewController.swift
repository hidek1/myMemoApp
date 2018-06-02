//
//  MemoViewController.swift
//  myMemoApp
//
//  Created by 吉永秀和 on 2018/05/28.
//  Copyright © 2018年 吉永秀和. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController {
    var memo: String?
    @IBOutlet weak var myImageview: UIImageView!
    @IBOutlet weak var memoTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        myImageview.contentMode = UIViewContentMode.scaleAspectFit
        // Do any additional setup after loading the view.
//        self.saveButton.isEnabled = false
  
        if let memo = self.memo {
            self.memoTextField.text = memo
            self.navigationItem.title = "Edit Memo"
            if memo == "江頭" {
                myImageview.image = UIImage(named: "ega.jpg")
            }
            if memo == "エガちゃん" {
                myImageview.image = UIImage(named: "ega2.jpg")
            }
            if memo == "コーラ" {
                myImageview.image = UIImage(named: "egac.mp4")
            }
        }
        
        self.updateSaveButtonState()
    }
    private func updateSaveButtonState() {
        let memo = self.memoTextField.text ?? ""
        self.saveButton.isEnabled = !memo.isEmpty
    }


    @IBAction func memoTextFieldChanged(_ sender: Any) {
        self.updateSaveButtonState()
    }
    @IBAction func cancel(_ sender: Any) {
        if self.presentingViewController is UINavigationController {
            self.dismiss(animated: true, completion: nil)
        } else {
 self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIBarButtonItem, button === self.saveButton else {
            return
        }
        self.memo = self.memoTextField.text ?? ""
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
