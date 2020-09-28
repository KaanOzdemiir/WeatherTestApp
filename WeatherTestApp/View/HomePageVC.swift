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
        }
    }
    
    var homePageLayoutData: [HomePageLayout] = [
        .citiesLayout,
        .dailyWeatherLayout,
//        .timeWeatherLayout,
//        .dailyDetailLayout,
//        .weeklyWeatherLayout
    ]
    
    let viewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        viewModel.fetchCities { [weak self] (status) in
            
            guard let self = self else { return }
            
            if status {
                self.reloadTableView()
            }
        }
    }

    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension HomePageVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homePageLayoutData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let layout = homePageLayoutData[indexPath.row]
        switch layout {
        case .citiesLayout:
            let cell = tableView.dequeueReusableCell(withIdentifier: CitiesLayoutTableViewCell.identifier, for: indexPath) as! CitiesLayoutTableViewCell
            
            cell.cities = viewModel.cities
            cell.collectionView.reloadData()
            
            return cell
        case .dailyWeatherLayout:
            let cell = tableView.dequeueReusableCell(withIdentifier: DailyWeatherDetailTableViewCell.identifier, for: indexPath) as! DailyWeatherDetailTableViewCell
            
            return cell
        default:
            break
        }
        
        return UITableViewCell()
    }
    
    
}

extension HomePageVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let layout = homePageLayoutData[indexPath.row]
        
        switch layout {
        case .citiesLayout:
            return 43
        case .dailyWeatherLayout:
            return 166
        default:
            return 0
        }
    }
}

