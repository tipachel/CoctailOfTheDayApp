//
//  RecipeViewController.swift
//  CoctailOfTheDayApp
//
//  Created by Tipachel on 26.11.2021.
//

import UIKit

class RecipeViewController: UIViewController {
    
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var cocktailImageView: UIImageView!
    @IBOutlet var cocktailNameLabel: UILabel!
    @IBOutlet var recipeLabel: UILabel!
    
    var drink: Drink?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        configuration()
    }
    
    func configuration() {

        guard let cocktail = drink else {return}

        cocktailNameLabel.text = cocktail.strDrink
        recipeLabel.text = """
Instuctions: \(cocktail.strInstructions)
"""
        
        activityIndicator.stopAnimating()
        
    }
}
//extension RecipeViewController {
//
//    }
//}
