//
//  DelegatesViewController.swift
//  ClosuresVSDelegates
//
//  Created by Vladimir Ho on 13.10.2019.
//  Copyright © 2019 Viety Software. All rights reserved.
//

import UIKit

class DelegatesViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private properties

    private let animals: [Animal] = [.dog, .cat, .snake, .pig, .lion]

    // MARK: - Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        title = "Delegates"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 44.0
    }
}

// MARK: - Table View Delegates

extension DelegatesViewController: UITableViewDataSource, UITableViewDelegate {
    
    // UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalDelegatesCell", for: indexPath) as! AnimalDelegatesCell
        cell.delegate = self
        cell.configure(with: animals[indexPath.row])
        return cell
    }
    
    // UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - AnimalCellDelegate

extension DelegatesViewController: AnimalCellDelegate {
    
    func didTapNoise(for animal: Animal) {
        let alert = UIAlertController(title: "What is \(animal.name)'s noise?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "\(animal.noise) 👍", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
