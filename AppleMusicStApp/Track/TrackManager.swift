//
//  TrackManager.swift
//  AppleMusicStApp
//
//  Created by joonwon lee on 2020/01/12.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import UIKit
import AVFoundation

class TrackManager {
    // TODO: 프로퍼티 정의하기 - 트랙들, 앨범들, 오늘의 곡
    var tracks: [AVPlayerItem] = []
    var albums: [Album] = []
    var todaysTrack: AVPlayerItem?
    
    // TODO: 생성자 정의하기
    init() {
        let tracks = loadTracks()
        self.tracks = tracks
        self.albums = loadAlbums(tracks: tracks)
        self.todaysTrack = self.tracks.randomElement()
        //컬렉션 임의의 요소
    }

    // TODO: 트랙 로드하기
    func loadTracks() -> [AVPlayerItem] {
        //파일 읽어서 AVPlayerItem 만들기
        let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil) ?? []
        //파일의 url 가져오기
        
//        var items: [AVPlayerItem] = []
        //mp3 파일 실행을 위해 저장할 AVPlayerItem Array 생성
        
//        for url in urls {
//            let item = AVPlayerItem(url: url)
//            items.append(item)
//            //urls를 순회하며 각 요소를 AVPlayerItem 요소로 변환하고 items Array에 저장
//        }
        
        let items = urls.map{AVPlayerItem(url:$0)}
        //urls의 요소들을 AVPlayerItem으로 변환하여 items에 반환
        
        return items
    }
    
    // TODO: 인덱스에 맞는 트랙 로드하기
    func track(at index: Int) -> Track? {
        
        let playerItem = tracks[index]
        return playerItem.convertToTrack()
    }

    // TODO: 앨범 로딩메소드 구현
    func loadAlbums(tracks: [AVPlayerItem]) -> [Album] {
        let trackList:[Track] = tracks.compactMap{ $0.convertToTrack() }
        let albumDics = Dictionary(grouping: trackList, by: { (track) in track.albumName })
        //Dictionary를 통해 앨범을 이름별로 트랙을 나눈 후, 그룹화 진행
        
        var albums: [Album] = []
        for (key, value) in albumDics {
            let title = key
            let tracks = value
            let album = Album(title: title, tracks: tracks)
            albums.append(album)
        } //앨범 딕셔너리를 통해 key와 value를 지정하고 albums Array에 저장
        
        return albums
    }

    // TODO: 오늘의 트랙 랜덤으로 선책
    func loadOtherTodaysTrack() {
        self.todaysTrack = self.tracks.randomElement()
    }
}
