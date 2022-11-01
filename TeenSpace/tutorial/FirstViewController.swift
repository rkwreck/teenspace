//
//  ViewController.swift
//  tutorial
//
//  Created by Rini Khandelwal on 10/11/22.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "this logo")!)
    }


    @IBAction func didTapButton(_ sender: Any) {
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondController = self.storyboard!.instantiateViewController(withIdentifier: "second_controller") as! SecondViewController
        //secondController.setup(firstName: "Rini", lastName: "Khandelwal")
        self.navigationController?.pushViewController(secondController, animated: true)
        
        // Uncomment below lines if navigation doesn't work
        
        //secondController.loadViewIfNeeded()
        //secondController.view.backgroundColor = .systemRed
        //secondController.setup(firstName: "Rini", lastName: "Khandelwal")
        //self.present(secondController, animated: true,completion: nil)
        
        // Uncomment above lines if navigation doesn't work
    }
}

