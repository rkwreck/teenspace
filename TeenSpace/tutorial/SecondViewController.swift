//
//  SecondViewController.swift
//  tutorial
//
//  Created by Rini Khandelwal on 10/11/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet private weak var firstNameLabel: UILabel!
    @IBOutlet private weak var secondNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)

        self.isModalInPresentation = true
        // Do any additional setup after loading the view.
        setup(firstName:"Rini",lastName:"Khandelwal")
    }
    

    func setup(firstName: String, lastName: String)
    {
        firstNameLabel.text  = "Welcome"
        secondNameLabel.text = "Choose a Space to enter:"
    }
    
    //
     @IBAction func doneButtonTapped(_ sender: Any){
         
         //let gunController = self.storyboard!.instantiateViewController(withIdentifier: "gun_ViewController") as! Gun_ViewController
         //self.navigationController?.pushViewController(gunController, animated: true)
         
         
         // =====
         let thirdController = self.storyboard!.instantiateViewController(withIdentifier: "third_controller") as! ThirdViewController
         self.navigationController?.pushViewController(thirdController, animated: true)
         
        
     }
    // MARK: - Navigation
    @IBAction func drugButtonTapped(_ sender: UIButton) {
        let drugController = self.storyboard!.instantiateViewController(withIdentifier: "drug_ViewController") as! drug_ViewController
        self.navigationController?.pushViewController(drugController, animated: true)
    }
    
    @IBAction func drivingTapped(_ sender: UIButton) {
        let drivingController = self.storyboard!.instantiateViewController(withIdentifier: "driving_controller") as! driving_ViewController
        self.navigationController?.pushViewController(drivingController, animated: true)
    }
    
    
    @IBAction func teenTapped(_ sender: UIButton) {
        let teenController = self.storyboard!.instantiateViewController(withIdentifier: "teen_ViewController") as! Teen_ViewController
        self.navigationController?.pushViewController(teenController, animated: true)
    }
    
    
    ///=== Repurposed
    @IBAction func gunTapped(_ sender: UIButton) {
        let gunController = self.storyboard!.instantiateViewController(withIdentifier: "gun_ViewController") as! Gun_ViewController
        self.navigationController?.pushViewController(gunController, animated: true)
        
        ///=== Repurposed for Cyber Safety
    
        //let thirdController = self.storyboard!.instantiateViewController(withIdentifier: "third_controller") as! ThirdViewController
        //self.navigationController?.pushViewController(thirdController, animated: true)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     */
    

}
