//
//  SongDetailCell.swift
//  ios-iTunesSearch-sk10
//
//  Created by S.Emoto on 2017/09/23.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import UIKit

class SongDetailCell: UITableViewCell {

    // MARK:- Properties
    fileprivate let songURLSession = CustomURLSession()
    
    // MARK: - IBOutlet
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var songIconImageView: UIImageView!
    
    // セルを再利用する時にnilにする
    override func prepareForReuse() {
        
        songIconImageView.image = nil
    }
    
    func setIcon(song: Song?) {
        guard let song = song else { return }
        
        // DBにイメージデータが保存されている場合は、
        // DBのイメージデータから描画する
        if let songInfo = SongInfoDao().findBy(id: song.trackId), let songIcon = songInfo.iconImage {
            let image = UIImage(data: songIcon)
            songIconImageView.image = image
        }
        
        // DBにイメージデータが保存されていない場合は
        // オンラインから取得し描画とDBへの保存を行う
        songURLSession.getBy(model: song, url: song.iconImage, view: songIconImageView)
    }
    
    func setSong(name: String) {
        songNameLabel.text = name
    }
    
    func setArtist(name: String) {
        artistNameLabel.text = name
    }

}
