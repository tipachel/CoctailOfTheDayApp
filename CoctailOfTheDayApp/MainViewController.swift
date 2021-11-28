//
//  ViewController.swift
//  CoctailOfTheDayApp
//
//  Created by Tipachel on 26.11.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var descriptionLabel: UILabel!
    
    private let json = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
    private var drink: Cocktail?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = """
    This App helps you choose a cocktail
    and shows how to make it.
    Tap the button to get some:)
    """
    }
    
    
    @IBAction func getCocktailButtonPressed(_ sender: Any) {
        getDrink()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let recipeVC = segue.destination as? RecipeViewController else { return }
        recipeVC.drinks = drink
    }
}

extension MainViewController {
    
    private func getDrink() {
        
        guard let url = URL(string: json ) else {return}
        URLSession.shared.dataTask(with: url) {data , _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Unexpectable error")
                return
            }
            
            do {
                let cocktail = try JSONDecoder().decode( Cocktail.self, from: data)
                
                print("Succes!!! \(cocktail)")
                
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
