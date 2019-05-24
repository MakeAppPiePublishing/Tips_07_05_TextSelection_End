 //
//  ViewController.swift
//  07_05_SelectingText
//
 //
 //  A Demo for iOS Development Tips Weekly
 //  by Steven Lipton (C)2018, All rights reserved
 //  For videos go to http://bit.ly/TipsLinkedInLearning
 //  For code go to http://bit.ly/AppPieGithub
 //

import UIKit

let textAttributes = [NSAttributedString.Key.font: UIFont(name: "Georgia", size: 20.0)!]
let highlightAttributes = [NSAttributedString.Key.font: UIFont(name: "GillSans-Bold", size: 20.0)!, NSAttributedString.Key.backgroundColor:UIColor.yellow.withAlphaComponent(0.30)]



class ViewController: UIViewController {
    @IBOutlet weak var selectedTextLabel: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    @IBAction func didSelectText(_ sender: UIButton) {
        let selectedRange = textView.selectedRange
        let selectedText  = NSString(string: textView.text)
        selectedTextLabel.text = selectedText.substring(with: selectedRange)
    }
    
    @IBAction func didBoldFont(_ sender: UIButton){
        let selectedRange = textView.selectedRange
        let mutAttributed = NSMutableAttributedString(attributedString: textView.attributedText)
        mutAttributed.addAttributes(highlightAttributes, range: selectedRange)
        textView.attributedText = mutAttributed
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.allowsEditingTextAttributes = true
        textView.attributedText = initalText()
        // Do any additional setup after loading the view.
    }
    
    func initalText() -> NSAttributedString {
        let pizzaText:String =  """
        Pizza Margherita - Street Food Nationalized
        The legend goes that King Umberto and Queen Margherita of Italy got tired of The royal food, which was always French. Looking for both something new and something Italian, while in Naples they ordered a local pizzeria to make them pizza, which was up till then poor people's food.  The Queen loved a pizza of tomatoes, fresh mozzarella and basil so much the restaurant named the pizza after her. That the pizza was the colors of the Italian flag may not be a coinicidence. To this day to sell a true Neapolitan pizza, you must be certified by an association of pizza restaurants in Naples for the process and quality of ingredients.
        New York Pizza - Pizza Comes to America
        The first known Pizza restaurant in the United States was in New York’s Little Italy. Gennaro Lombardi in 1905 opened his restaurant, but used a coal Oven instead of a wood burning one, since coal was chaeper than wood in New york. New York Pizza breaks several traditions from its Italian ancestor. Most importantly it is sold in large slices, which meant whole pizzas were made larger than the traditional 14inch/35cm diameter. To make a larger pizza, a  higher gluten recipe is used for the crust, and the pizza is tossed in the air with a spinning motion.
        Chicago Deep Dish - No more flat crust for you!(have a beer)
        In 1943, Ike Sewell changed the crust from the thin flatbread to a deep pan, adding traditional Italian/New York  ingredients. Sewell and his cook and eventual manager Rudy Malnati added a layer of sausage to the pan. Some believe the longer cooking time of 20 minutes to 45 minutes of the deep dish meant more beverage consumption, and a higher profit for the restaurant. Deep dish pizza caught on in Chicago, with many competitors in the area. With the 2 inch of deeper pizza crust, the order of ingredients can change between competitors, with a crust ranging in texture from cracker like to bread like and the cheese on top or on the sauce on top. Rudy's son Lou took the recipe north to the Chicago Surburb of Lincolnwood to start his own chain Other chicago restaurants starting copying the pan idea, making changes of thier own.
        Hawaiian Pizza -  Non-Italian Ingredients
        The so-called Hawaiian pizza is not Hawaiian -- It's Canadian. Greek immigrant to Canada added Hawaiian brand canned pineapple and Canadian bacon to a pizza in his small restaurant in western Ontario Canada. This is the one of the earliest pizzas without traditional Italian ingredients, and as late as 2017, a few months before the orginator's death this was controversial, with purists angry about pineapple on a pizza. On one notable occaision, The President of Iceland started a diplomatic incident between Canada and Iceland with his statement he would make pineapple on pizza illegal.
"""
        return NSAttributedString(string: pizzaText, attributes: [NSAttributedString.Key.font: UIFont(name: "Georgia", size: 20.0)!])
    }
    
}
