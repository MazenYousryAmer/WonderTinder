//
//  Utils.swift
//  WonderTinder
//
//  Created by Mazen Amer on 15/07/2023.
//

import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG
import UIKit

func MD5(string: String) -> Data {
    let length = Int(CC_MD5_DIGEST_LENGTH)
    let messageData = string.data(using:.utf8)!
    var digestData = Data(count: length)

    _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
        messageData.withUnsafeBytes { messageBytes -> UInt8 in
            if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                let messageLength = CC_LONG(messageData.count)
                CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
            }
            return 0
        }
    }
    return digestData
}

 func MD5Hex(string: String) -> String {
    let md5Data = MD5(string: string)
    return md5Data.map { String(format: "%02hhx", $0) }.joined()
}


extension UIImageView {
    
    func downloadImage(from url: URL) {
        
        if URLCache.shared.cachedResponse(for: URLRequest(url: url)) != nil {
            print("load image from cache")
            let data = URLCache.shared.cachedResponse(for: URLRequest(url: url))?.data
            self.image = UIImage(data: data ?? Data())
        } else {
            
            print("downloading image")
            NetworkManager().request(url: url, completion: {[weak self] image , error in
                guard let image = image else {
                    return
                }
                DispatchQueue.main.async {
                    self?.image = image
                }
            })
        }
        

    }
}
