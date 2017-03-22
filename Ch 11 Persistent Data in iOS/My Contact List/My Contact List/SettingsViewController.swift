//
//  SettingsViewController.swift
//  My Contact List
//
//  Created by Iversen, Jakob H on 1/18/17.
//  Copyright © 2017 Leaning Mobile Apps. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let sortOrderItems: Array<String> = ["ContactName", "City", "Birthday"]
    
    @IBOutlet weak var pckSortField: UIPickerView!
    @IBOutlet weak var swAscending: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        pckSortField.dataSource = self
        pckSortField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
          //set the UI based on values in UserDefaults

          let settings = UserDefaults.standard
          swAscending.setOn(settings.bool(forKey: Constants.kSortDirectionAscending), animated: true)
          let sortField = settings.string(forKey: Constants.kSortField)
          var i = 0
          for field in sortOrderItems {
                if(field == sortField){
                      pckSortField.selectRow(i, inComponent: 0, animated: false)
                    }
                i += 1
              }
        pckSortField.reloadComponent(0)

    }
    
    @IBAction func sortDirectionChanged(_ sender: Any) {
        let settings = UserDefaults.standard
          settings.set(swAscending.isOn, forKey: Constants.kSortDirectionAscending)
          settings.synchronize()

    }
    
    // MARK: UIPickerViewDelegate Methods
    
    // Returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Returns the # of rows in the picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sortOrderItems.count
    }
    
    //Sets the value that is shown for each row in the picker
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)
        -> String? {
            return sortOrderItems[row]
    }
    
    //If the user chooses from the pickerview, it calls this function;
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Chosen item: \(sortOrderItems[row])")
        let sortField = sortOrderItems[row]
          let settings = UserDefaults.standard
          settings.set(sortField, forKey: Constants.kSortField)
          settings.synchronize()

    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
