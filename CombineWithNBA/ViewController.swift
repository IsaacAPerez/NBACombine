//
//  ViewController.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 2/16/22.
//

import UIKit
import Combine

struct NBATeams: Codable {
    let data: [NBATeam]
    let meta: NBAMeta
    
}

struct NBAMeta: Codable {
    let total_pages: Int
    let current_page: Int
    let next_page: Bool?
    let per_page: Int
    let total_count: Int
    
}

class NBACell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var NBATableView: UITableView!
    
    
    var teams: [NBATeam]?
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NBATableView.dataSource = self
        NBATableView.register(NBACell.self, forCellReuseIdentifier: "cell")
        NBATableView.layer.cornerRadius = 10
        NBATableView.layer.borderColor = UIColor( red: 153/255, green: 153/255, blue:0/255, alpha: 1.0 ).cgColor
        NBATableView.layer.borderWidth = 2.0
        
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.balldontlie.io/api/v1/teams/")!)
        .receive(on: DispatchQueue.main, options: .none)
       .map { $0.data }
       .decode(type: NBATeams.self, decoder: JSONDecoder())
       .eraseToAnyPublisher()
       .sink(receiveCompletion: { completion in
           switch completion {
           case .finished:
               print("finished")
               self.NBATableView.reloadData()
           case .failure(let error):
               print(String(describing: error))
           }
       }, receiveValue: { posts in
           //print(posts.full_name)
           self.teams = posts.data
       })
       .store(in: &cancellables)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        teams?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NBACell else {
            fatalError()
        }
        if let teams = teams {
            cell.textLabel?.text = teams[indexPath.row].full_name
            if teams[indexPath.row].conference != "East" {
                cell.textLabel?.textColor = .red
            } else {
                cell.textLabel?.textColor = .blue
            }
        }

        return cell
    }


}

