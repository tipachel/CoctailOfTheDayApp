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
    @IBOutlet var getCocktailButton: UIButton!
    
    private let json = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
    var drink: Drink?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCocktailButton.isHidden = true
        descriptionLabel.text = """
    This App helps you choose a cocktail
    and shows how to make it.
    Tap the button to get some:)
    """

    }
    override func viewWillAppear(_ animated: Bool) {
        fetchData(from: json)
        
    }
    
    private func fetchData(from url: String?){
        NetworkManager.shared.fetchData(from: url) { drink in
            self.drink = drink.drinks[0]
            self.getCocktailButton.isHidden = false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let recipeVC = segue.destination as? RecipeViewController else { return }
        recipeVC.drink = drink
    }
    @IBAction override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        fetchData(from: json)
    }

}



