//
//  NOTLiskovSubstitution.swift
//  SOLID
//
//  Created by Apple on 13.11.24.
//


//ეს მაგალითი ვასოს ამ პრინციპში არ გაურჩევია ასერომ ჩითინგი არ არი ;)



import Foundation


class Rectangle {
    
    func area() -> Double {
        return width * height
    }
}

class Square: Rectangle {
    override var width: Double {
        didSet {
            height = width
        }
    }

    override var height: Double {
        didSet {
            width = height
        }
    }
}

//თითქოს ლოგიკურია, მაგრამ მართკუთხედი და კვადრატი განსხვავებულად ფუნქციონირებენ ამაში იმას ვგულისხმობ რო როდესაც Square გამოვიძახებ სიგრძე სიგანე ერტმანეტში აიხლარტება ანუ საწყისი აღწერა დამერღვევა , უფრო უკეთ უკეტ მაგალითში ავხსნი
