//
//  MP_ViewController.swift
//  Grade Planner
//
//  Created by Andrés Serna on 9/17/25.
//

import UIKit

class MP_ViewController: UIViewController {
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
    @IBOutlet weak var lbl_letterGrade: UILabel!
    @IBOutlet weak var lbl_percentageGrade: UILabel!
    
    @IBOutlet weak var lbl_homeworkAssignmentsPercent: UILabel!
    @IBOutlet weak var lbl_finalProjPrototypePercent: UILabel!
    @IBOutlet weak var lbl_finalProjImplPercent: UILabel!
    @IBOutlet weak var lbl_finalProjPresiPercent: UILabel!
    @IBOutlet weak var lbl_attendancePercent: UILabel!
    @IBOutlet weak var lbl_absencesPercent: UILabel!
    
    // Slider outlets
    @IBOutlet weak var sld_homeworkAssignments: UISlider!
    @IBOutlet weak var sld_finalProjPrototype: UISlider!
    @IBOutlet weak var sld_finalProjImpl: UISlider!
    @IBOutlet weak var sld_finalProjPresi: UISlider!
    @IBOutlet weak var sld_attendance: UISlider!
    @IBOutlet weak var sld_absences: UISlider!
    
    
    //MARK: Slider Actions
    @IBAction func sld_homeworkAssignmentsChanged(_ sender: UISlider) {
        handleSliderChange(sender)
        // update your label here if needed:
        lbl_homeworkAssignmentsPercent.text = "\(Int(sender.value))%"
    }
    
    @IBAction func sld_finalProjPrototypeChanged(_ sender: UISlider) {
        handleSliderChange(sender)
        lbl_finalProjPrototypePercent.text = "\(Int(sender.value))%"
    }

    @IBAction func sld_finalProjImplChanged(_ sender: UISlider) {
        handleSliderChange(sender)
        lbl_finalProjImplPercent.text = "\(Int(sender.value))%"
    }

    @IBAction func sld_finalProjPresiChanged(_ sender: UISlider) {
        handleSliderChange(sender)
        lbl_finalProjPresiPercent.text = "\(Int(sender.value))%"
    }

    @IBAction func sld_attendanceChanged(_ sender: UISlider) {
        handleSliderChange(sender)
        lbl_attendancePercent.text = "\(Int(sender.value))%"
    }

    @IBAction func sld_absencesChanged(_ sender: UISlider) {
        handleSliderChange(sender)
        let absences = Int(sender.value)
        let penaltyAbsences = max(absences - 2, 0)
        let penalty = penaltyAbsences * 2
        lbl_absencesPercent.text = "-\(penalty)%"
    }
    
    
    @IBAction func btn_absencesInfo(_ sender: Any) {
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
        lbl_homeworkAssignmentsPercent.text = "60%"
        lbl_finalProjPrototypePercent.text = "10%"
        lbl_finalProjImplPercent.text = "15%"
        lbl_finalProjPresiPercent.text = "5%"
        lbl_attendancePercent.text = "10%"
        lbl_absencesPercent.text = "-0%"
    }
    
    private func setGradeValues(){
        lbl_letterGrade.text = "A"
        lbl_percentageGrade.text = "100%"
    }
    
    private func initSliderLastValues() {
        let sliders: [UISlider] = [
            sld_homeworkAssignments,
            sld_finalProjPrototype,
            sld_finalProjImpl,
            sld_finalProjPresi,
            sld_attendance,
            sld_absences
        ]
        for slider in sliders {
            lastIntValues[slider] = Int(slider.value.rounded())
        }
    }
    
    private func calculatePercentageGrade() -> Float {
        // list of all *positive* contribution sliders
        let positiveSliders: [UISlider] = [
            sld_homeworkAssignments,
            sld_finalProjPrototype,
            sld_finalProjImpl,
            sld_finalProjPresi,
            sld_attendance
        ]
        
        // sum the positive values
        let baseTotal: Float = positiveSliders.reduce(0.0) { $0 + $1.value }

        // handle absences penalty
        let absences = Int(sld_absences.value) // # of absences
        let penaltyAbsences = max(absences - 2, 0) // absences beyond the first two
        let penalty: Float = Float(penaltyAbsences) * 2.0 // 2% each

        // apply penalty to total grade
        let finalTotal = baseTotal - penalty
        return finalTotal
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
