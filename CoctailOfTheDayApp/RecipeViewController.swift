//
//  RecipeViewController.swift
//  CoctailOfTheDayApp
//
//  Created by Tipachel on 26.11.2021.
//

import UIKit

class RecipeViewController: UIViewController {
    
    
    @IBOutlet var cocktailImageView: UIImageView!
    @IBOutlet var cocktailNameLabel: UILabel!
    @IBOutlet var recipeLabel: UILabel!
    
    @IBOutlet var strLabel1: UILabel!
    @IBOutlet var strLabel2: UILabel!
    @IBOutlet var strLabel3: UILabel!
    @IBOutlet var strLabel4: UILabel!
    @IBOutlet var strLabel5: UILabel!
    @IBOutlet var strLabel6: UILabel!
    @IBOutlet var strLabel7: UILabel!
    @IBOutlet var strLabel8: UILabel!
    @IBOutlet var strLabel9: UILabel!
    @IBOutlet var strLabel10: UILabel!
    @IBOutlet var strLabel11: UILabel!
    @IBOutlet var strLabel12: UILabel!
    @IBOutlet var strLabel13: UILabel!
    @IBOutlet var strLabel14: UILabel!
    @IBOutlet var strLabel15: UILabel!
    
    var drink: Drink?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strLabel1.isHidden = true
        strLabel2.isHidden = true
        strLabel3.isHidden = true
        strLabel4.isHidden = true
        strLabel5.isHidden = true
        strLabel6.isHidden = true
        strLabel7.isHidden = true
        strLabel8.isHidden = true
        strLabel9.isHidden = true
        strLabel10.isHidden = true
        strLabel11.isHidden = true
        strLabel12.isHidden = true
        strLabel13.isHidden = true
        strLabel14.isHidden = true
        strLabel15.isHidden = true
        
        
        configuration()
        fetchImage()
    }
    
    
    
    
    func configuration() {
        
        guard let cocktail = drink else {return}
        self.drink = cocktail
        
        cocktailNameLabel.text = cocktail.strDrink
        recipeLabel.text = """
Instuctions: \(cocktail.strInstructions)
Glass: \(cocktail.strGlass)
Alcohol: \(cocktail.strAlcoholic)
"""
        
        if let ingridient1 = cocktail.strIngredient1,
           let measure1 = cocktail.strMeasure1{
            strLabel1.text = measure1 + ingridient1
            strLabel1.isHidden = false
        }
        if let ingridient2 = cocktail.strIngredient2,
           let measure2 = cocktail.strMeasure2{
            strLabel2.text = measure2 + ingridient2
            strLabel2.isHidden = false
        }
        if let ingridient3 = cocktail.strIngredient3,
           let measure3 = cocktail.strMeasure3{
            strLabel3.text = measure3 + ingridient3
            strLabel3.isHidden = false
        }
        if let ingridient4 = cocktail.strIngredient4,
           let measure4 = cocktail.strMeasure4{
            strLabel4.text = measure4 + ingridient4
            strLabel4.isHidden = false
        }
        if let ingridient5 = cocktail.strIngredient5,
           let measure5 = cocktail.strMeasure5{
            strLabel5.text = measure5 + ingridient5
            strLabel5.isHidden = false
        }
        if let ingridient6 = cocktail.strIngredient6,
           let measure6 = cocktail.strMeasure6{
            strLabel6.text = measure6 + ingridient6
            strLabel6.isHidden = false
        }
        if let ingridient7 = cocktail.strIngredient7,
           let measure7 = cocktail.strMeasure7{
            strLabel7.text = measure7 + ingridient7
            strLabel7.isHidden = false
        }
        if let ingridient8 = cocktail.strIngredient8,
           let measure8 = cocktail.strMeasure8{
            strLabel8.text = measure8 + ingridient8
            strLabel8.isHidden = false
        }
        if let ingridient9 = cocktail.strIngredient9,
           let measure9 = cocktail.strMeasure9{
            strLabel9.text = measure9 + ingridient9
            strLabel9.isHidden = false
        }
        if let ingridient10 = cocktail.strIngredient10,
           let measure10 = cocktail.strMeasure10{
            strLabel10.text = measure10 + ingridient10
            strLabel10.isHidden = false
        }
        if let ingridient11 = cocktail.strIngredient11,
           let measure11 = cocktail.strMeasure11{
            strLabel11.text = measure11 + ingridient11
            strLabel11.isHidden = false
        }
        if let ingridient12 = cocktail.strIngredient12,
           let measure12 = cocktail.strMeasure12{
            strLabel12.text = measure12 + ingridient12
            strLabel12.isHidden = false
        }
        if let ingridient13 = cocktail.strIngredient13,
           let measure13 = cocktail.strMeasure13{
            strLabel13.text = measure13 + ingridient13
            strLabel13.isHidden = false
        }
        if let ingridient14 = cocktail.strIngredient14,
           let measure14 = cocktail.strMeasure14{
            strLabel14.text = measure14 + ingridient14
            strLabel14.isHidden = false
        }
        if let ingridient15 = cocktail.strIngredient15,
           let measure15 = cocktail.strMeasure15{
            strLabel15.text = measure15 + ingridient15
            strLabel15.isHidden = false
        }
        
    }
    func fetchImage() {
        
        guard let cocktail = drink else { return }
        guard let url = URL(string: cocktail.strDrinkThumb) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard  let data = data, let response = response else {
                print(error?.localizedDescription ?? "unexpectable error")
                return
            }
            print(response)
            
            guard let image = UIImage(data: data) else {return}
            DispatchQueue.main.async {
                self.cocktailImageView.image = image
            }
        }.resume()
        
        
        
    }
}


