//
//  Constants.swift
//  Any Mobile Map App
//
//  Created by Jasur Salimov on 8/24/21.
//

import Foundation
import UIKit

struct Constants{
    
    static let imageName = ["Account_Icon", "bookmark_Icon", "location_Icon"]
    static let id = [ Bookmarks(a1:"Узбекистон овози,2", a2: "Ташкент, Узбекистан" ,r: nil ,t: nil), Bookmarks(a1:"Государственный Музей Искусств Узбекистана", a2: "Ташкент, Узбекистан" ,r: "rating" ,t: "Открыто до 17:00"),Bookmarks(a1:"Дом", a2: "Узбекистан, Ташкент, Ц Квартал, 2 подъезд" ,r: nil ,t: nil),Bookmarks(a1:"Участок", a2: "Узбекистан, Ташкент, Ц Квартал, 2 подъезд" ,r: "rating" ,t: "Открыто до 18:00")]
    
    
    static let mainFont = UIFont(name: "Gilroy-SemiBold", size: 17)
    static let secondaryFont = UIFont(name: "Gilroy-SemiBold", size: 13)
    
    
}



struct Bookmarks{
    
    var adress1: String?
    var adress2: String?
    var ratingIm: String?
    var time: String?
    
    init(a1: String?, a2: String?, r:String?, t:String?){
        
        if(a1 != nil){
            self.adress1 = a1!
        }
        if(a2 != nil){
            self.adress2 = a2!
        }
        if(r !=  nil){
            self.ratingIm = r!
        }
        else {
            self.ratingIm = ""
        }
        if(t != nil){
            self.time = t!
        }
        else{
            self.time = ""
        }
        
    }
    
}
