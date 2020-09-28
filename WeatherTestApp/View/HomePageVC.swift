//
//  ViewController.swift
//  WeatherTestApp
//
//  Created by Kaan Ozdemir on 28.09.2020.
//

import UIKit

enum HomePageLayout {
    case citiesLayout // Şehirler Görünümü
    case dailyWeatherLayout // Günün Hava durumu
    case timeWeatherLayout // Günün Saatlerin Göre Hava Durumu
    case dailyDetailLayout // Günlük Detay
    case weeklyWeatherLayout // Haftalık Hava Durumu
}

class HomePageVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.register(UINib(nibName: CitiesLayoutTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CitiesLayoutTableViewCell.identifier)
            tableView.register(UINib(nibName: DailyWeatherDetailTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DailyWeatherDetailTableViewCell.identifier)
            tableView.register(UINib(nibName: TimeWeatherLayoutTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TimeWeatherLayoutTableViewCell.identifier)
        }
    }
    
    let viewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        fetchCities()
        
        fetchTimeWeathers()
    }
    
    func fetchCities() {
        viewModel.fetchCities { [weak self] (status) in
            
            guard let self = self else { return }
            
            if status {
                
                if let index = self.viewModel.homePageLayoutData.firstIndex(where: {$0 == .citiesLayout}) {
                    self.reloadRow(index: index)
                }
            }
        }
    }
    
    func fetchTimeWeathers() {
        viewModel.fetchTimeWeathers { [weak self] (status) in
            guard let self = self else { return }
            
            if status {
                if let index = self.viewModel.homePageLayoutData.firstIndex(where: {$0 == .timeWeatherLayout}) {
                    self.reloadRow(index: index)
                }
            }
        }
    }

    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func reloadRow(index: Int) {
        DispatchQueue.main.async {
            self.tableView.reloadRows(at: [.init(row: index, section: 0)], with: .fade)
        }
    }
}

extension HomePageVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.homePageLayoutData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let layout = viewModel.homePageLayoutData[indexPath.row]
        switch layout {
        case .citiesLayout:
            let cell = tableView.dequeueReusableCell(withIdentifier: CitiesLayoutTableViewCell.identifier, for: indexPath) as! CitiesLayoutTableViewCell
            
            cell.cities = viewModel.cities
            cell.collectionView.reloadData()
            
            return cell
        case .dailyWeatherLayout:
            let cell = tableView.dequeueReusableCell(withIdentifier: DailyWeatherDetailTableViewCell.identifier, for: indexPath) as! DailyWeatherDetailTableViewCell
            
            return cell
        case .timeWeatherLayout:
            let cell = tableView.dequeueReusableCell(withIdentifier: TimeWeatherLayoutTableViewCell.identifier, for: indexPath) as! TimeWeatherLayoutTableViewCell
            cell.timeWeathers = viewModel.timeWeathers
            cell.collectionView.reloadData()
            return cell
        default:
            break
        }
        
        return UITableViewCell()
    }
    
    
}

extension HomePageVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let layout = viewModel.homePageLayoutData[indexPath.row]
        
        switch layout {
        case .citiesLayout:
            return 43
        case .dailyWeatherLayout:
            return 166
        case .timeWeatherLayout:
            return 93
        default:
            return 0
        }
    }
}

