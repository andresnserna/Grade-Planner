//
//  ItAI_ViewController.swift
//  Grade Planner
//
//  Created by Andrés Serna on 9/17/25.
//

import UIKit

class ItAI_ViewController: UIViewController {

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
    
    @IBOutlet weak var lbl_ethicsPaperPercent: UILabel!
    @IBOutlet weak var lbl_unitAssignmentsPercent: UILabel!
    @IBOutlet weak var lbl_classCodingPercent: UILabel!
    @IBOutlet weak var lbl_examsPercent: UILabel!
    @IBOutlet weak var lbl_attendancePercent: UILabel!
    
    @IBAction func sld_ethicsPaper(_ sender: UISlider) {
    }
    @IBAction func sld_unitAssignments(_ sender: UISlider) {
    }
    @IBAction func sld_classCoding(_ sender: UISlider) {
    }
    @IBAction func sld_exams(_ sender: UISlider) {
    }
    @IBAction func sld_attendance(_ sender: UISlider) {
    }

}
