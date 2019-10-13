//
//  ClosuresViewController.swift
//  ClosuresVSDelegates
//
//  Created by Vladimir Ho on 13.10.2019.
//  Copyright © 2019 Viety Software. All rights reserved.
//

import UIKit

class ClosuresViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private properties
    
    private let animals: [Animal] = [.dog, .cat, .snake, .pig, .lion]
    
    // MARK: - Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        title = "Closures"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 44.0
    }
    
    private func showAlert(for animal: Animal) {
        let alert = UIAlertController(title: "What is \(animal.name)'s noise?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "\(animal.noise) 👍", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

// MARK: - Table View Delegates

extension ClosuresViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalClosuresCell", for: indexPath) as! AnimalClosuresCell
        cell.didTapNoise = showAlert
        
        // OR
        /*cell.didTapNoise = { [weak self] animal in
            guard let self = self else { return }
            let alert = UIAlertController(title: "What is \(animal.name)'s noise?", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "\(animal.noise) 👍", style: .default, handler: nil))
            self.present(alert, animated: true)
        }*/
        
        cell.configure(with: animals[indexPath.row])
        return cell
    }
}
