//
//  RestaurantsData.swift
//  AppLaunchTask
//
//  Created by Ganga Durgarao Kothapalli on 24/08/22.
//

import Foundation
import UIKit


struct RestaurantsData{
    
    
     var data: [Restaurant] = []
    let dishName:[String] = ["FoodOne","FoodTwo","FoodThree","PizzaOne","PizzaTwo","PizzaThree","PizzaFour","FoodOne"]
    let dishImages:[String] = ["food_icon_1","food_icon_2","food_icon_3","pizza_1","pizza_2","pizza_3","pizza_4","food_icon_1"]
    let sectionOne:[String] = ["(1)","Max Safety","PRO","Cuisines","Pure Veg","New Arraivals","Fast Delivery","Sort","More"]
    
    
    init(){
        getData()
    }
    
    mutating func getData(){
        data.append(Restaurant(image: UIImage(named: "kfc"), name: "KFC", category: "Burger, Fast Food, Biryani", rating: "4.0\u{2605}", price: "250 for one", time: "28 min", offer: "20 % OFF"))
        data.append(Restaurant(image: UIImage(named: "icecream"), name: "NIC Natural Ice Cream", category: "Ice Cream, Desserts", rating: "4.7\u{2605}", price: "100 for one", time: "20 min", offer: "50 % OFF"))
        data.append(Restaurant(image: UIImage(named: "bawarchi"), name: "RedChillies Food Court", category: "North Indian, Chinese", rating: "3.8\u{2605}", price: "100 for one", time: "30 min", offer: "50 % OFF"))
        data.append(Restaurant(image: UIImage(named: "pizzadad"), name: "Pizza Hut", category: "Pizza, Fast Food, Dessert,", rating: "3.7\u{2605}", price: "250 for one", time: "30 min", offer: "20 % OFF"))
        data.append(Restaurant(image: UIImage(named: "hungry"), name: "Paradise Biryani", category: "North Indian, Chinese", rating: "4.0\u{2605}", price: "200 for one", time: "40 min", offer: "50 % OFF"))
        data.append(Restaurant(image: UIImage(named: "secondThree"), name: "Bob's Cafe", category: "South Indian, North Indian, Chinese", rating: "4.1\u{2605}", price: "250 for one", time: "20 min", offer: "30 % OFF"))
        data.append(Restaurant(image: UIImage(named: "pizzadad"), name: "Burger King", category: "Burger Fast, Food", rating: "4.2\u{2605}", price: "300 for one", time: "30 min", offer: "30 % OFF"))
        data.append(Restaurant(image: UIImage(named: "hungry"), name: "Celebrations Restaurant", category: "Biryani, North India", rating: "3.9\u{2605}", price: "250 for one", time: "30 min", offer: "50 % OFF"))
        data.append(Restaurant(image: UIImage(named: "pizzadad"), name: "Domino's Pizza", category: "Pizza, Food", rating: "4.5\u{2605}", price: "300 for one", time: "15 min", offer: "30 % OFF"))
        
        
    }
    
}
