//
//  ADS_ViewController.swift
//  Grade Planner
//
//  Created by Andrés Serna on 9/17/25.
//

import UIKit

class ADS_ViewController: UIViewController {

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
    
    @IBOutlet weak var lbl_midtermExamPercent: UILabel!
    @IBOutlet weak var lbl_finalExamPercent: UILabel!
    @IBOutlet weak var lbl_challengesPercent: UILabel!
    @IBOutlet weak var lbl_quizzesPercent: UILabel!
    @IBOutlet weak var lbl_participationPercent: UILabel!
    
    @IBAction func sld_midtermExam(_ sender: UISlider) {
    }
    @IBAction func sld_finalExam(_ sender: UISlider) {
    }
    @IBAction func sld_challenges(_ sender: UISlider) {
    }
    @IBAction func sld_quizzes(_ sender: UISlider) {
    }
    @IBAction func sld_participation(_ sender: UISlider) {
    }

}
