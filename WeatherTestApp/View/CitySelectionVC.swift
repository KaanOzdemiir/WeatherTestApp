//
//  CitySelectionVC.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 29.09.2020.
//

import UIKit

class CitySelectionVC: UIViewController {
    
    let viewModel = CitySelectionViewModel()
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.register(UINib(nibName: AddCityTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: AddCityTableViewCell.identifier)
        }
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
        let selectedCities = viewModel.cities.filter({$0.isSelected})
        UserVariables.selectedCitiesJSONString = selectedCities.toJSONString() ?? ""
        
        if selectedCities.count >= 3 {
            dismiss(animated: true)
            viewModel.isSelectionDone.onNext(true)
        }else{
            let alertController = UIAlertController(title: "Uyarı!", message: "Lütfen en az 3 adet şehir seçiniz.", preferredStyle: .alert)

            alertController.addAction(UIAlertAction(title: "Tamam", style: .default))
            present(alertController, animated: true)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        fetchCities()
    }
    
    
    
    func fetchCities() {
        viewModel.fetchCities(params: [:]) { [weak self] (state) in
            guard let self = self else { return }
            switch state {
            case .success(let grouppedCities):
                print("🟢 Şehirler çekildi!")
                self.viewModel.groppedCities = grouppedCities
                self.tableView.reloadData()
            case .failed(let error):
                print("🔴 Hata oluştu:", error.localizedDescription)
            }
        }
    }
}

extension CitySelectionVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.groppedCities.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.groppedCities[section].sectionObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AddCityTableViewCell.identifier, for: indexPath) as! AddCityTableViewCell
        
        let city = viewModel.groppedCities[indexPath.section].sectionObjects[indexPath.row]
        cell.label.text = city.name
        
        if city.isSelected {
            cell.addButton.setTitle("Eklendi", for: .normal)
            cell.addButton.setTitleColor(.green, for: .normal)
            
            
        }else{
            cell.addButton.setTitle("Ekle", for: .normal)
            cell.addButton.setTitleColor(#colorLiteral(red: 0.4588235294, green: 0.01176470588, blue: 0.9921568627, alpha: 1), for: .normal)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = viewModel.groppedCities[section]
        return section.sectionName
    }
    
    
}

extension CitySelectionVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cities = viewModel.groppedCities[indexPath.section].sectionObjects
        let city = cities[indexPath.row]
        city.isSelected = !city.isSelected
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
}
