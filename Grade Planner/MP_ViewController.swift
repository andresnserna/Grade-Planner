//
//  MP_ViewController.swift
//  Grade Planner
//
//  Created by Andrés Serna on 9/17/25.
//

import UIKit

class MP_ViewController: UIViewController {
    
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
    
    @IBOutlet weak var lbl_homeworkAssignmentsPercent: UILabel!
    @IBOutlet weak var lbl_finalProjPrototypePercent: UILabel!
    @IBOutlet weak var lbl_finalProjImplPercent: UILabel!
    @IBOutlet weak var lbl_finalProjPresiPercent: UILabel!
    @IBOutlet weak var lbl_attendancePercent: UILabel!
    @IBOutlet weak var lbl_absencesPercent: UILabel!
    
    @IBAction func sld_homeworkAssignments(_ sender: UISlider) {
    }
    @IBAction func sld_finalProjPrototype(_ sender: UISlider) {
    }
    @IBAction func sld_finalProjImpl(_ sender: UISlider) {
    }
    @IBAction func sld_finalProjPresi(_ sender: UISlider) {
    }
    @IBAction func sld_attendance(_ sender: UISlider) {
    }
    @IBAction func sld_absences(_ sender: UISlider) {
    }
    
    @IBAction func btn_absencesInfo(_ sender: UIButton) {
    }
    
}
