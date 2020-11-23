//
//  ViewController.swift
//  NetworkTest
//
//  Created by Клим on 22.11.2020.
//

import UIKit

class ViewController: UIViewController {
     private var netData = [SWCharacter]()

    @IBOutlet weak var NetList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
    }
    
    func configureTable(){
        NetList.dataSource = self
        NetList.delegate = self
    }
    
    private func loadData(){
        let url = URL(string: "https://swapi.dev/api/people/")!
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 15
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print(error)
                return
            }
            
            guard let data = data as? Data
            else{
                //error handling
                //response.statusCode
                return
            }
            do {
                let jsonArray = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [ [String: Any?]]
                
                for object in jsonArray{
                    if let name = object["name"] as? String,
                       let height = object["height"] as? String,
                       let bYear = object["birth_year"] as? String,
                       let gender = object["gender"] as? String{
                        let hgt = Int(height)!
                        self.netData.append(SWCharacter(name: name, birthYear: bYear, gender: gender, height: hgt))
                    }
                }
            }
            catch (let jsonError) {
                print(jsonError)
            }
        }
        task.resume()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return netData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        as! NetworkCell
        let currData = netData[indexPath.row]
        cell.nameOutlet.text = currData.name
        cell.heightOutlet.text = "height: \(currData.height)"
        cell.birthOutlet.text = currData.birthYear
        cell.genderOutlet.text = currData.gender
        
        return cell
    }
    
    
    
    
    
    
    
}

