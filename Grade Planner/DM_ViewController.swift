//
//  DM_ViewController.swift
//  Grade Planner
//
//  Created by Andrés Serna on 9/17/25.
//

import UIKit

class DM_ViewController: UIViewController {
    //for the taptic feedback
    private let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    // Dictionary to hold each slider's last integer value
    private var lastIntValues: [UISlider: Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSliderValues()
        setGradeValues()
        initSliderLastValues()
        selectionFeedbackGenerator.prepare()
    }
    
    // MARK: Outlets
    
    // Label outlets
    @IBOutlet weak var lbl_letterGrade: UILabel!
    @IBOutlet weak var lbl_percentageGrade: UILabel!
    
    @IBOutlet weak var lbl_readingQuizzes: UILabel!
    @IBOutlet weak var lbl_attendance: UILabel!
    @IBOutlet weak var lbl_homeworks: UILabel!
    @IBOutlet weak var lbl_exams: UILabel!
    @IBOutlet weak var lbl_projects: UILabel!
    
    //  Slider outlets
    @IBOutlet weak var sld_readingQuizzes: UISlider!
    @IBOutlet weak var sld_attendance: UISlider!
    @IBOutlet weak var sld_homeworks: UISlider!
    @IBOutlet weak var sld_exams: UISlider!
    @IBOutlet weak var sld_projects: UISlider!
    
    //MARK: Actions
    
    @IBAction func sld_readingQuizzes(_ sender: UISlider) {
        handleSliderChange(sender)
        lbl_readingQuizzes.text = "\(Int(sender.value))%"
    }
    
    @IBAction func sld_attendance(_ sender: UISlider) {
        handleSliderChange(sender)
        lbl_attendance.text = "\(Int(sender.value))%"
    }
    
    @IBAction func sld_homeworks(_ sender: UISlider) {
        handleSliderChange(sender)
        lbl_homeworks.text = "\(Int(sender.value))%"
    }
    
    @IBAction func sld_exams(_ sender: UISlider) {
        handleSliderChange(sender)
        lbl_exams.text = "\(Int(sender.value))%"
    }
    
    @IBAction func sld_projects(_ sender: UISlider) {
        handleSliderChange(sender)
        lbl_projects.text = "\(Int(sender.value))%"
    }
    
    //MARK: Helper Functions
    
    private func handleSliderChange(_ slider: UISlider) {
        let intValue = Int(slider.value.rounded())
        // visually snap the slider to this value
//        slider.value = Float(intValue)

        // get the previous value from the dictionary (default to current if none)
        let lastIntValue = lastIntValues[slider] ?? intValue

        if intValue != lastIntValue {
            selectionFeedbackGenerator.selectionChanged()
            selectionFeedbackGenerator.prepare()
            
            //simulate taptic engine, since the simulator doesn't support it
            print("tick!")
            
            // update dictionary
            lastIntValues[slider] = intValue
        }
        // update the grade labels as sliders change
        updateGradeLabels()

    }
    
    private func setSliderValues(){
        lbl_readingQuizzes.text = "10%"
        lbl_attendance.text = "10%"
        lbl_homeworks.text = "20%"
        lbl_exams.text = "30%"
        lbl_projects.text = "30%"
    }
    
    private func setGradeValues(){
        lbl_letterGrade.text = "A"
        lbl_percentageGrade.text = "100%"
    }
    
    private func initSliderLastValues() {
        let sliders: [UISlider] = [
            sld_readingQuizzes,
            sld_attendance,
            sld_homeworks,
            sld_exams,
            sld_projects
        ]
        for slider in sliders {
            lastIntValues[slider] = Int(slider.value.rounded())
        }
    }
    
    private func calculatePercentageGrade() -> Float {
        let sliders: [UISlider] = [
            sld_readingQuizzes,
            sld_attendance,
            sld_homeworks,
            sld_exams,
            sld_projects
        ]

        // sum as Float
        let total: Float = sliders.reduce(0.0) { $0 + $1.value }
        return total
    }
    
    private func calculateLetterGrade(from percentage: Float) -> String {
        switch percentage {
        case 90...100:
            return "A"
        case 80..<90:
            return "B"
        case 70..<80:
            return "C"
        case 60..<70:
            return "D"
        default:
            return "F"
        }
    }
    
    private func updateGradeLabels() {
        let percent = calculatePercentageGrade()
        lbl_percentageGrade.text = String(format: "%.0f%%", percent) // no decimals

        let letter = calculateLetterGrade(from: percent)
        lbl_letterGrade.text = letter
    }
    
    
}
