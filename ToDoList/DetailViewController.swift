//
//  DetailViewController.swift
//  ToDoList
//
//  Created by Berlian on 17/06/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var subtitleDetail: UITextField!
    @IBOutlet weak var descDetail: UITextView!
    
    var model : ToDoListItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = model?.title
        subtitleDetail.text = model?.subtitle
        descDetail.text = model?.desc
//        descDetail = mod
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
