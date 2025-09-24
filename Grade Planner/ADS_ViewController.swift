//
//  ADS_ViewController.swift
//  Grade Planner
//
//  Created by Andrés Serna on 9/17/25.
//

import UIKit

class ADS_ViewController: UIViewController {
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
    
    //label outlets
    @IBOutlet weak var lbl_letterGrade: UILabel!
    @IBOutlet weak var lbl_percentageGrade: UILabel!
    
    @IBOutlet weak var lbl_midtermExamPercent: UILabel!
    @IBOutlet weak var lbl_finalExamPercent: UILabel!
    @IBOutlet weak var lbl_challengesPercent: UILabel!
    @IBOutlet weak var lbl_quizzesPercent: UILabel!
    @IBOutlet weak var lbl_participationPercent: UILabel!
    
    //slider outlets
    @IBOutlet weak var sld_midtermExam: UISlider!
    @IBOutlet weak var sld_finalExam: UISlider!
    @IBOutlet weak var sld_challenges: UISlider!
    @IBOutlet weak var sld_quizzes: UISlider!
    @IBOutlet weak var sld_participation: UISlider!
    
    // MARK: Actions
    @IBAction func sld_midtermExam(_ sender: UISlider) {
        handleSliderChange(sender)
        lbl_midtermExamPercent.text = "\(Int(sender.value))%"
    }
    
    @IBAction func sld_finalExam(_ sender: UISlider) {
        handleSliderChange(sender)
        lbl_finalExamPercent.text = "\(Int(sender.value))%"
    }
    
    @IBAction func sld_challenges(_ sender: UISlider) {
        handleSliderChange(sender)
        lbl_challengesPercent.text = "\(Int(sender.value))%"
    }
    
    @IBAction func sld_quizzes(_ sender: UISlider) {
        handleSliderChange(sender)
        lbl_quizzesPercent.text = "\(Int(sender.value))%"

    }
    
    @IBAction func sld_participation(_ sender: UISlider) {
        handleSliderChange(sender)
        lbl_participationPercent.text = "\(Int(sender.value))%"

    }
    
    // MARK: Helper Functions

    private func handleSliderChange(_ slider: UISlider) {
        let intValue = Int(slider.value.rounded())
        // visually snap the slider to this value
//        slider.value = Float(intValue)

        // get the previous value from the dictionary (default to current if none)
        let lastIntValue = lastIntValues[slider] ?? intValue

        if intValue != lastIntValue {
            selectionFeedbackGenerator.selectionChanged()
            selectionFeedbackGenerator.prepare()
            // update dictionary
            lastIntValues[slider] = intValue
        }
        // update the grade labels as sliders change
        updateGradeLabels()

    }
    
    private func setSliderValues(){
        lbl_midtermExamPercent.text = "25%"
        lbl_finalExamPercent.text = "35%"
        lbl_challengesPercent.text = "20%"
        lbl_quizzesPercent.text = "10%"
        lbl_participationPercent.text = "10%"
    }
    
    private func setGradeValues(){
        lbl_letterGrade.text = "A"
        lbl_percentageGrade.text = "100%"
    }
    
    private func initSliderLastValues() {
        let sliders: [UISlider] = [
            sld_midtermExam,
            sld_finalExam,
            sld_challenges,
            sld_quizzes,
            sld_participation
        ]
        for slider in sliders {
            lastIntValues[slider] = Int(slider.value.rounded())
        }
    }
    
    private func calculatePercentageGrade() -> Float {
        let sliders: [UISlider] = [
                sld_midtermExam,
                sld_finalExam,
                sld_challenges,
                sld_quizzes,
                sld_participation
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
