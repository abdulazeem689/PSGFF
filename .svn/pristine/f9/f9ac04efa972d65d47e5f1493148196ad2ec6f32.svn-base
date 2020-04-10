//
//  HelpingMethods.swift
//  PSGFF
//
//  Created by Abdul Azeem on 16/01/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit

class HelpingMethods {
    
    //Modify Parsed Data Arr into required form.
    func modifyingParsedData(parsedTrendingArr: [TrendingData])->[Any]{
        var trendingArr = [Any]()
        var videoArr = [TrendingData]()
        var index = 0
        for data in parsedTrendingArr{
            if data.flag == "0"{
                if !videoArr.isEmpty{
                    trendingArr.append(videoArr)
                    videoArr = []
                }
                trendingArr.append(data)
            }else {
                videoArr.append(data)
                if index == parsedTrendingArr.count - 1 {
                    trendingArr.append(videoArr)
                }
            }
            index += 1
        }
        return trendingArr
    }
}
