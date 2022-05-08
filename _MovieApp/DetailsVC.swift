//
//  DetailsVC.swift
//  _MovieApp
//
//  Created by Youssef Hilaly on 22/01/1401 AP.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    var movie:Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movie?.title
        if let rating = movie?.rating{
            ratingLabel.text = "\(String(describing:rating))"
        }
        if let releaseYear = movie?.releaseYear{
            releaseYearLabel.text = "\(String(describing: releaseYear))"
        }
        let url = URL(string: (movie?.image)!)
        movieImageView.sd_setImage(with: url,completed : nil)
        

        // Do any additional setup after loading the view.
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
