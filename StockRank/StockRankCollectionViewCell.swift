//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by HyunSoo on 2023/10/05.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var rankLable: UILabel!
    @IBOutlet weak var companyIconImageView: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyPrice: UILabel!
    @IBOutlet weak var diffLable: UILabel!
    
    
    func configure(_ stock: StockModel) {
        rankLable.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: stock.imageName)
        companyName.text = stock.name
        companyPrice.text = "\(convertToCurrencyFormat(price: stock.price))원"
        diffLable.text = "\(stock.diff)%"
        if stock.diff > 0 {
            diffLable.textColor = UIColor.systemRed
        } else {
            diffLable.textColor = UIColor.systemBlue
        }
    }
    
    func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter.string(from: NSNumber(value: price))!
    }
}
