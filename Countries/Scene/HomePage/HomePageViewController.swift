//
//  HomePageViewController.swift
//  Countries
//
//  Created by Sedat Dalkıran on 18.04.2022.
//

import UIKit

final class HomePageViewController: UIViewController {
    
    private var countries = [CountryData]()
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: CountryViewModelProtocol = CountryViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getCountryList()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as? DetailCardViewController
        let viewModel = DetailCardViewModel(code: sender as? String ?? "")
        viewController?.viewModel = viewModel
    }
}

extension HomePageViewController: CountryViewModelDelegate {
    func updateCountry(countries: [CountryData]?) {
        self.countries = countries ?? []
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        print("*** DATA ***")
        print(countries)
        print("*** DATA ***")
        ////
    }
    
}

extension HomePageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CountryListTableViewCell {
            cell.CountryName?.text = countries[indexPath.row].name
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
}

extension HomePageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detail", sender: countries[indexPath.row].code)
    }
}
