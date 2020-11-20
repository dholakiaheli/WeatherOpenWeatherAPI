//
//  WeatherListTableViewController.swift
//  Weather
//
//  Created by Heli Bavishi on 11/18/20.
//

import UIKit

class WeatherListTableViewController: UITableViewController {

     var city: TopLevelDictionary?
    
    @IBOutlet weak var cityNameSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityNameSearchBar.delegate = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)

        cell.textLabel?.text = city?.name
        cell.detailTextLabel?.text = city?.sys.country

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let destination = segue.destination as? WeatherDetailViewController else { return }
            
            let cityNameToSend = self.city
            destination.city = cityNameToSend
        }
    }
}

//MARK: - SearchBar Delegate

extension WeatherListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        
        WeatherController.fetchWeather(searchTerm: searchTerm) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedCity):
                    self.city = fetchedCity
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}//END of class
