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
    
    @IBOutlet weak var horoscopeLuckTextView: UITextView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    @IBOutlet weak var favoriteMenu: UIBarButtonItem!
    
    var horoscope: Horoscope!
    var isFavorite: Bool = false
    
    var horoscopeLuck: String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = horoscope.name
        
        horoscopeNameLabel.text = horoscope.name
        horoscopeDatesLabel.text = horoscope.dates
        horoscopeImageView.image = horoscope.getImage()
        
        isFavorite = SessionManager.isFavoriteHoroscope(id: horoscope.id)
        
        setFavoriteImage()
        
        getHoroscopeLuck(period: "daily")
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
        if let text = horoscopeLuck {
            let textToShare = [ text ]
            let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
            
            activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
            
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func didChangePeriod(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            getHoroscopeLuck(period: "daily")
        case 1:
            getHoroscopeLuck(period: "weekly")
        default:
            getHoroscopeLuck(period: "monthly")
        }
    }
    
    func getHoroscopeLuck(period: String) {
        loadingView.isHidden = false
        guard let url = URL(string: "https://horoscope-app-api.vercel.app/api/v1/get-horoscope/\(period)?sign=\(horoscope.id)&day=TODAY") else {
            self.loadingView.isHidden = true
            return // ERROR
        }
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                /*if let str = String(data: data, encoding: .utf8) {
                    print("Successfully decoded: \(str)")
                }*/
                
                guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    DispatchQueue.main.async {
                        self.loadingView.isHidden = true
                    }
                    return // ERROR
                }
                
                let jsonData = json["data"] as? [String: String]
                
                horoscopeLuck = jsonData?["horoscope_data"] ?? ""
                
                DispatchQueue.main.async {
                    self.horoscopeLuckTextView.text = self.horoscopeLuck
                    self.loadingView.isHidden = true
                }
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingView.isHidden = true
                }
            }
        }
        
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
