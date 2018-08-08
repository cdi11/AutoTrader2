//
//  ViewController.swift
//  AutoTrader2
//
//  Created by Charlie Dill on 8/6/18.
//  Copyright © 2018 dill. All rights reserved.
//

import UIKit

class CarsCell: UITableViewCell{
    
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
}

class VehicleDetailViewController: UIViewController {
   
    
    @IBOutlet weak var textView: UITextView!
     var vehicle: Vehicle?
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.textView.text = "\(String(describing: vehicle?.id)\(vehicle?.make)\(vehicle.model)\(vehicle.type)"
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var model = CarsModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        model = CarsModel()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vehicleViewController = segue.destination as? VehicleDetailViewController else{
            return
        }
        //vehicleViewController.setVehicleData(with: model.vehicles[model.selectedIndex])
        super.prepare(for: segue, sender: sender)
    }
}
    extension ViewController : UITableViewDelegate {
        func tableView(_tableView:UITableView, didSelectRowAt indexPath: IndexPath) {
            print("User Selected row at \(indexPath.row)")
            model.selectedIndex = indexPath.row
            performSegue(withIdentifier: "showDetails", sender: self)
            
        }
    }
  

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.vehicles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let vehicleCell = tableView.dequeueReusableCell(withIdentifier: "carsCell", for: indexPath) as? CarsCell else{
            return UITableViewCell()
        }
        let vehicle = model.vehicles[indexPath.row]
        vehicleCell.makeLabel.text = "Make : " + vehicle.make
        vehicleCell.modelLabel.text = "Model : " + vehicle.model
        vehicleCell.yearLabel.text = "Year : " + String(vehicle.year)
        return vehicleCell
        
    }
}

