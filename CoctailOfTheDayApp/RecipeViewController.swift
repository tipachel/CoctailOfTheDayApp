//
//  RecipeViewController.swift
//  CoctailOfTheDayApp
//
//  Created by Tipachel on 26.11.2021.
//

import UIKit

class RecipeViewController: UIViewController {
    
    var drinks: Cocktail!
    
    private var drink: Drink!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var cocktailImageView: UIImageView!
    @IBOutlet var cocktailNameLabel: UILabel!
    @IBOutlet var recipeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        getRecipe()
        configuration()
        
    }

}
extension RecipeViewController {
    
    private func getRecipe() {
        
        var recipe: Drink?
        for cocktail in drinks.drinks {
            recipe = cocktail
        }
        drink = recipe
        
    }
}
extension RecipeViewController {
    private func configuration() {
        guard let cocktail = drink else {return}
        cocktailNameLabel.text = cocktail.strDrink
    }
}
