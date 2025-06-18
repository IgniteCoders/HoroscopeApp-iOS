//
//  DetailViewController.swift
//  HoroscopeApp
//
//  Created by Mañanas on 16/6/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var horoscopeImageView: UIImageView!
    @IBOutlet weak var horoscopeNameLabel: UILabel!
    @IBOutlet weak var horoscopeDatesLabel: UILabel!
    
    @IBOutlet weak var favoriteMenu: UIBarButtonItem!
    
    var horoscope: Horoscope!
    var isFavorite: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = horoscope.name
        
        horoscopeNameLabel.text = horoscope.name
        horoscopeDatesLabel.text = horoscope.dates
        horoscopeImageView.image = horoscope.getImage()
        
        isFavorite = SessionManager.isFavoriteHoroscope(id: horoscope.id)
        
        setFavoriteImage()
    }
    
    func setFavoriteImage() {
        favoriteMenu.image = isFavorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
    }
    
    @IBAction func setFavorite(_ sender: Any) {
        isFavorite = !isFavorite
        if isFavorite {
            SessionManager.setFavoriteHoroscope(id: horoscope.id)
        } else {
            SessionManager.setFavoriteHoroscope(id: "")
        }
        setFavoriteImage()
    }
    
    @IBAction func share(_ sender: Any) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
