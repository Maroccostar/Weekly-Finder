//
//  ViewController.swift
//  WeeklyFinder
//
//  Created by user on 22.01.2022.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var dataTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    @IBAction func findDay(_ sender: UIButton) {
        
        guard let day = dataTF.text, let month = monthTF.text, let year = yearTF.text else { return }
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "EEEE"
        
        guard   let date = calendar.date(from: dateComponents) else { return }
        
        let weekDay = dateFormatter.string(from: date)
        let capitalizedWeekday = weekDay.capitalized
        
        resultLabel.text = capitalizedWeekday
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

// fix bugs не выпадала цифровая клава, убрал галочку с "Connect Hardware Keyboard
