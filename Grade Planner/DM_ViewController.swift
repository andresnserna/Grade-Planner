//
//  DM_ViewController.swift
//  Grade Planner
//
//  Created by Andrés Serna on 9/17/25.
//

import UIKit

class DM_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    @IBOutlet weak var lbl_letterGrade: UILabel!
    @IBOutlet weak var lbl_percentageGrade: UILabel!
    
    @IBOutlet weak var lbl_readingQuizes: UILabel!
    @IBOutlet weak var lbl_attendance: UILabel!
    @IBOutlet weak var lbl_homeworks: UILabel!
    @IBOutlet weak var lbl_exams: UILabel!
    @IBOutlet weak var lbl_projects: UILabel!
    
    @IBAction func sld_readingQuizes(_ sender: UISlider) {
    }
    @IBAction func sld_attendance(_ sender: UISlider) {
    }
    @IBAction func sld_homeworks(_ sender: UISlider) {
    }
    @IBAction func sld_exams(_ sender: UISlider) {
    }
    @IBAction func sld_projects(_ sender: UISlider) {
    }
    
    
    
    
}
