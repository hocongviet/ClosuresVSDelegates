//
//  AnimalDelegatesCell.swift
//  ClosuresVSDelegates
//
//  Created by Vladimir Ho on 13.10.2019.
//  Copyright © 2019 Viety Software. All rights reserved.
//

import UIKit

protocol AnimalCellDelegate: class {
    func didTapNoise(for animal: Animal)
}

class AnimalDelegatesCell: UITableViewCell {
    
    // MARK: - Delegate
    
    weak var delegate: AnimalCellDelegate?
    
    // MARK: - IBOutlet

    @IBOutlet weak var emoji: UILabel!
    @IBOutlet weak var name: UILabel!
    
    // MARK: - Private property
    
    private var animal: Animal?
    
    // MARK: - Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: - Configure
    
    func configure(with animal: Animal) {
        self.animal = animal
        emoji.text = animal.emoji
        name.text = animal.name
    }
    
    // MARK: - IBAction

    @IBAction func noiseAction(_ sender: Any) {
        guard let animal = animal else { return }
        delegate?.didTapNoise(for: animal)
    }
}
