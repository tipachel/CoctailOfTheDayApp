//
//  ViewController.swift
//  CoctailOfTheDayApp
//
//  Created by Tipachel on 26.11.2021.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {
    
    @IBOutlet var descriptionLabel: UILabel!
    
    private let json = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
    private var drinks: Cocktail?
    var drink: Drink?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = """
    This App helps you choose a cocktail
    and shows how to make it.
    Tap the button to get some:)
    """
    }
    
    private func fetchData(from url: String?){
        NetworkManager.shared.fetchData(from: url) { drink in
            self.drinks = drink
        }
    }
    
    private func getRecipe(){
        guard let test = drinks else { return }
        var recipe: Drink?
        
        for cocktail in test.drinks {
            recipe = cocktail
        }
        drink = recipe
    }
    
    @IBAction func getCocktailButtonPressed(_ sender: Any) {
        fetchData(from: json)
        getRecipe()
        
   
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let recipeVC = segue.destination as? RecipeViewController else { return }
        recipeVC.drink = drink
    }
}

