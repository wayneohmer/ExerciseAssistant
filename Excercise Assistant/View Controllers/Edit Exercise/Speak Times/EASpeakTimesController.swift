//
//  P9SSpeakTimesController.swift
//  pre90sec
//
//  Created by Wayne Ohmer on 12/19/16.
//  Copyright © 2016 Wayne Ohmer. All rights reserved.
//

import UIKit

private let reuseIdentifier = "EASpeakTimesCell"

class EASSpeakTimesController: UICollectionViewController {

    var exercise = EAExercise()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return self.exercise.time.absoluteSec
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EASpeakTimesCell
    
        cell.numberLabel.text = "\(indexPath.item)"
        var thisTime = EATime()
        thisTime.absoluteSec = indexPath.item
        if  self.exercise.spokenTimes.contains(thisTime) {
            cell.numberLabel.backgroundColor = UIColor.white
            cell.numberLabel.textColor = UIColor.black
        } else {
            cell.numberLabel.backgroundColor = UIColor.black
            cell.numberLabel.textColor = UIColor.white
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var thisTime = EATime()
        thisTime.absoluteSec = indexPath.item
        if self.exercise.spokenTimes.contains(thisTime) {
            self.exercise.spokenTimes.remove(thisTime)
        } else {
            exercise.spokenTimes.update(with: thisTime)
        }
        self.collectionView?.reloadData()
    }

}
