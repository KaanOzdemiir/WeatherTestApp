//
//  CityWeatherVC.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 3.10.2020.
//

import UIKit

class CityWeatherVC: UIViewController {
    
    let viewModel = CityWeatherViewModel()
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "SegueCitySelectionVC", sender: nil)
    }
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.register(UINib(nibName: CityWeatherTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CityWeatherTableViewCell.identifier)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        fetchSelectedCitiesForecasts()
    }
    
    func fetchSelectedCitiesForecasts() {
        viewModel.fetchSelectedCitiesWeatherForecast { [weak self] (response) in
            guard let self = self else { return }
            switch response{
            case .success(let weatherForecasts):
                print("🟢 (fetchSelectedCitiesForecasts) Hava durumu verileri hazır!")
                self.tableView.reloadData()
            case .failed(let error):
                print("🔴 (fetchSelectedCitiesForecasts) Hata oluştu:", error.localizedDescription)
            }
        }
    }
}

extension CityWeatherVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cityWeatherForecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityWeatherTableViewCell.identifier) as! CityWeatherTableViewCell
        
        let weatherForecast = viewModel.cityWeatherForecasts[indexPath.row]
        cell.setCell(with: weatherForecast)

        return cell
    }
    
    
}

extension CityWeatherVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Sil"
    }
}
