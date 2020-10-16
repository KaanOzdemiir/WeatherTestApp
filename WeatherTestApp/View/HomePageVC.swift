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
            tableView.register(UINib(nibName: DailyDetailLayoutTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DailyDetailLayoutTableViewCell.identifier)
            tableView.register(UINib(nibName: WeaklyWeatherLayoutTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: WeaklyWeatherLayoutTableViewCell.identifier)
        }
    }
    
    let viewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if viewModel.shouldPresentCitySelection {
            performSegue(withIdentifier: "SegueCitySelectionVC", sender: nil)
            return
        }
        
        fecthAllRequiredDatas()
    }
    
    func fecthAllRequiredDatas() {
        fetchCities()
        
        fetchWeatherForecast()
                
        fetchWeaklyWeathers()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueCitySelectionVC" {
            let navVC = segue.destination as? UINavigationController
            let vc = navVC?.viewControllers.first as? CitySelectionVC
            
            vc?.viewModel.isSelectionDone.subscribe(onNext: { [weak self] (status) in
                
                if status {
                    self?.viewModel.fetchSelectedCities(completionHandler: { [weak self] (status) in
                        
                        if status {
                            self?.viewModel.currentSelectedCity = self?.viewModel.cities.first
                            self?.fecthAllRequiredDatas()
                        }
                    })
                }
            })
            .disposed(by: viewModel.disposeBag)
        }
    }
    
    func fetchWeatherForecast() {
        viewModel.fetchWeatherForecast { [weak self] (state) in
            guard let self = self else { return }
            switch state {
            case .success(let response):
                print("🟢 Hava durumu verileri hazır!")
                self.viewModel.weatherForecastResponse = response
                self.tableView.reloadData()
                break
                
            case .failed(let error):
                print("🔴 Hata oluştu:", error.localizedDescription)
                break
            }
        }
    }
    
    func fetchWeaklyWeathers() {
        viewModel.fetchWeaklyWeathers { [weak self] (status) in
            guard let self = self else { return }
            
            if status {
                
                if let index = self.viewModel.homePageLayoutData.firstIndex(where: {$0 == .weeklyWeatherLayout}) {
                    self.reloadRow(index: index)
                }
            }
        }
    }
    
    func fetchCities() {
        viewModel.fetchSelectedCities { [weak self] (status) in
            guard let self = self else { return }
            
            if status {
                
                if let index = self.viewModel.homePageLayoutData.firstIndex(where: {$0 == .citiesLayout}) {
                    self.reloadRow(index: index)
                }
            }else{
                self.performSegue(withIdentifier: "SegueCitySelectionVC", sender: nil)
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
            
            cell.delegate = self
            cell.cities = viewModel.cities
            cell.collectionView.reloadData()
            
            return cell
        case .dailyWeatherLayout:
            let cell = tableView.dequeueReusableCell(withIdentifier: DailyWeatherDetailTableViewCell.identifier, for: indexPath) as! DailyWeatherDetailTableViewCell
            cell.setCell(with: viewModel.weatherForecastResponse)
            return cell
        case .timeWeatherLayout:
            let cell = tableView.dequeueReusableCell(withIdentifier: TimeWeatherLayoutTableViewCell.identifier, for: indexPath) as! TimeWeatherLayoutTableViewCell
            cell.todayWeatherForecastByTime = viewModel.todayWeatherForecastByTime
            cell.collectionView.reloadData()
            return cell
        case .dailyDetailLayout:
            let cell = tableView.dequeueReusableCell(withIdentifier: DailyDetailLayoutTableViewCell.identifier, for: indexPath) as! DailyDetailLayoutTableViewCell
            
            cell.setCell(with: viewModel.weatherForecastResponse)
            
            // UV Response içinde hangisi?
            
            return cell
        case .weeklyWeatherLayout:
            let cell = tableView.dequeueReusableCell(withIdentifier: WeaklyWeatherLayoutTableViewCell.identifier, for: indexPath) as! WeaklyWeatherLayoutTableViewCell
            cell.weaklyAvarageForecastByDay = viewModel.weaklyAvarageForecastByDay.sorted(by: {$0.dt! < $1.dt!})
            
            // Haftalık Veriler
            cell.tableView.reloadData()

            return cell
        }
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
        case .dailyDetailLayout:
            return 153
        case .weeklyWeatherLayout:
            return 432
        default:
            return 0
        }
    }
}

extension HomePageVC: CitiesLayoutTableViewCellDelegate {
    func didSelect(selectedCity: CityData) {
        viewModel.currentSelectedCity = selectedCity
        fetchWeatherForecast()
    }
}

struct AvarageForeCast {
    var dt: Int?
    var day: String?
    var icon: String?
    var maxTemp: Double?
    var minTemp: Double?
}
