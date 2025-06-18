//
//  HoroscopeViewCell.swift
//  HoroscopeApp
//
//  Created by Mañanas on 13/6/25.
//

import UIKit

class HoroscopeViewCell: UITableViewCell {
    
    @IBOutlet weak var horoscopeImageView: UIImageView!
    @IBOutlet weak var horoscopeNameLabel: UILabel!
    @IBOutlet weak var horoscopeDatesLabel: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!
    
    func render(horoscope: Horoscope) {
        horoscopeNameLabel.text = horoscope.name
        horoscopeDatesLabel.text = horoscope.dates
        horoscopeImageView.image = horoscope.getImage()
        favoriteImageView.isHidden = !SessionManager.isFavoriteHoroscope(id: horoscope.id)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
