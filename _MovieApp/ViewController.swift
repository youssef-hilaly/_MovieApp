//
//  ViewController.swift
//  _MovieApp
//
//  Created by Youssef Hilaly on 20/01/1401 AP.
//

import UIKit
import SDWebImage;

class ViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (moviesArray?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.titleLabel.text =  moviesArray?[indexPath.row].title
        
        let url = URL(string: moviesArray![indexPath.row].image)
        cell.movieImageView.sd_setImage(with: url,completed : nil)
        
        return cell
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    var moviesArray:[Movie]?
    override func viewDidLoad() {
        super.viewDidLoad()
        	
        moviesArray = [Movie]()
        let url = URL(string: "https://api.androidhive.info/json/movies.json")
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request){[weak self](data,response,error) in
            
            print("data has arrived successfully")
            do{
                guard let validData = data else { return }
                
                let movies = try JSONDecoder().decode(Movies.self, from: validData)
               
                self?.moviesArray = movies
            
                // use reloadData
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("here")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        
        vc.movie = moviesArray?[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }


}

