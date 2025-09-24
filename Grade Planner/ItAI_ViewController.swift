//
//  ItAI_ViewController.swift
//  Grade Planner
//
//  Created by Andrés Serna on 9/17/25.
//

import UIKit

class ItAI_ViewController: UIViewController {
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
    

    //MARK: Outlets
    
        // label outlets
    @IBOutlet weak var lbl_letterGrade: UILabel!
    @IBOutlet weak var lbl_percentageGrade: UILabel!
    
    @IBOutlet weak var lbl_ethicsPaperPercent: UILabel!
    @IBOutlet weak var lbl_unitAssignmentsPercent: UILabel!
    @IBOutlet weak var lbl_classCodingPercent: UILabel!
    @IBOutlet weak var lbl_examsPercent: UILabel!
    @IBOutlet weak var lbl_attendancePercent: UILabel!
    
        //slider outlets
    @IBOutlet weak var sld_ethicsPaper: UISlider!
    @IBOutlet weak var sld_unitAssignments: UISlider!
    @IBOutlet weak var sld_classCoding: UISlider!
    @IBOutlet weak var sld_exams: UISlider!
    @IBOutlet weak var sld_attendance: UISlider!
    
    //MARK: Actions

    @IBAction func sld_ethicsPaper(_ sender: UISlider) {
        handleSliderChange(sender)
        lbl_ethicsPaperPercent.text = "\(Int(sender.value))%"
    }
    
    @IBAction func sld_unitAssignments(_ sender: UISlider) {
        handleSliderChange(sender)
        lbl_unitAssignmentsPercent.text = "\(Int(sender.value))%"
    }
    
    @IBAction func sld_classCoding(_ sender: UISlider) {
        handleSliderChange(sender)
        lbl_classCodingPercent.text = "\(Int(sender.value))%"
    }
    
    @IBAction func sld_exams(_ sender: UISlider) {
        handleSliderChange(sender)
        lbl_examsPercent.text = "\(Int(sender.value))%"
    }
    
    @IBAction func sld_attendance(_ sender: UISlider) {
        handleSliderChange(sender)
        lbl_attendancePercent.text = "\(Int(sender.value))%"
    }
    
    //MARK: Helper funcs
    
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
        lbl_ethicsPaperPercent.text = "10%"
        lbl_unitAssignmentsPercent.text = "40%"
        lbl_classCodingPercent.text = "10%"
        lbl_examsPercent.text = "30%"
        lbl_attendancePercent.text = "10%"
    }
    
    private func setGradeValues(){
        lbl_letterGrade.text = "A"
        lbl_percentageGrade.text = "100%"
    }
    
    private func initSliderLastValues() {
        let sliders: [UISlider] = [
            sld_ethicsPaper,
            sld_unitAssignments,
            sld_classCoding,
            sld_attendance,
            sld_exams
        ]
        for slider in sliders {
            lastIntValues[slider] = Int(slider.value.rounded())
        }
    }
    
    private func calculatePercentageGrade() -> Float {
        let sliders: [UISlider] = [
            sld_ethicsPaper,
            sld_unitAssignments,
            sld_classCoding,
            sld_exams,
            sld_attendance
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
