//
//  ViewController.swift
//  DispatchGroup
//
//  Created by Frank Huang on 2018/11/4.
//  Copyright © 2018 Frank. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Dispatch group in async
        asyncGlobalQueue()
        asyncGlobalQueue2()
        asyncMainQueue()

        // Dispatch group in sync
        syncGlobalQueue()
        syncCurrentQueue()
    }
}

// MARK: - DispatchGroup

extension ViewController {

    func asyncGlobalQueue() {

        print("[async in global queue] start")

        let group = DispatchGroup()

        group.enter()

        DispatchQueue.global().async {
            print("[async in global queue] Task1 is in main thread: \(Thread.isMainThread)")
            group.leave()
        }

        group.enter()
        DispatchQueue.global().async {
            print("[async in global queue] Task2 is in main thread: \(Thread.isMainThread)")
            group.leave()
        }

        group.enter()
        DispatchQueue.global().async {
            print("[async in global queue] Task3 is in main thread: \(Thread.isMainThread)")
            group.leave()
        }

        group.enter()
        DispatchQueue.global().async {
            print("[async in global queue] Task4 is in main thread: \(Thread.isMainThread)")
            group.leave()
        }

        group.enter()
        DispatchQueue.global().async {
            print("[async in global queue] Task5 is in main thread: \(Thread.isMainThread)")
            group.leave()
        }

        group.notify(queue: .main) {
            print("[async in global queue] Tasks all finished")
            print("[async in global queue] end")
        }
    }

    func asyncGlobalQueue2() {

        print("[async in global queue 2] start")

        let group = DispatchGroup()

        group.enter()

        DispatchQueue.global().async {
            print("[async in global queue 2] Task1 is in main thread: \(Thread.isMainThread)")
            print("[async in global queue 2] Task2 is in main thread: \(Thread.isMainThread)")
            group.leave()
        }

        group.enter()
        DispatchQueue.global().async {
            print("[async in global queue 2] Task3 is in main thread: \(Thread.isMainThread)")
            print("[async in global queue 2] Task4 is in main thread: \(Thread.isMainThread)")
            print("[async in global queue 2] Task5 is in main thread: \(Thread.isMainThread)")
            group.leave()
        }

        group.notify(queue: .main) {
            print("[async in global queue 2] Tasks all finished")
            print("[async in global queue 2] end")
        }
    }

    func asyncMainQueue() {

        print("[async in main queue] start")

        let group = DispatchGroup()

        group.enter()

        DispatchQueue.main.async {
            print("[async in main queue] Task1 is in main thread: \(Thread.isMainThread)")
            print("[async in main queue] Task2 is in main thread: \(Thread.isMainThread)")
            group.leave()
        }

        group.enter()
        DispatchQueue.main.async {
            print("[async in main queue] Task3 is in main thread: \(Thread.isMainThread)")
            print("[async in main queue] Task4 is in main thread: \(Thread.isMainThread)")
            print("[async in main queue] Task5 is in main thread: \(Thread.isMainThread)")
            group.leave()
        }

        group.notify(queue: .main) {
            print("[async in main queue] Tasks all finished")
            print("[async in main queue] end")
        }
    }

    func syncGlobalQueue() {

        print("[sync in global queue] start")

        let group = DispatchGroup()

        group.enter()

        DispatchQueue.global().sync {
            print("[sync in global queue] Task1 is in main thread: \(Thread.isMainThread)")
            print("[sync in global queue] Task2 is in main thread: \(Thread.isMainThread)")
            print("[sync in global queue] Task3 is in main thread: \(Thread.isMainThread)")
            group.leave()
        }

        group.enter()
        DispatchQueue.global().sync {
            print("[sync in global queue] Task4 is in main thread: \(Thread.isMainThread)")
            print("[sync in global queue] Task5 is in main thread: \(Thread.isMainThread)")
            group.leave()
        }

        group.notify(queue: .main) {
            print("[sync in global queue] Tasks all finished")
            print("[sync in global queue] end")
        }
    }

    func syncCurrentQueue() {

        print("[sync in current queue] start")

        let group = DispatchGroup()

        group.enter()
        print("[sync in current queue] Task1 is in main thread: \(Thread.isMainThread)")
        group.leave()

        group.enter()
        print("[sync in current queue] Task2 is in main thread: \(Thread.isMainThread)")
        group.leave()

        group.enter()
        print("[sync in current queue] Task3 is in main thread: \(Thread.isMainThread)")
        group.leave()

        group.enter()
        print("[sync in current queue] Task4 is in main thread: \(Thread.isMainThread)")
        group.leave()

        group.enter()
        print("[sync in current queue] Task5 is in main thread: \(Thread.isMainThread)")
        group.leave()

        group.notify(queue: .main) {
            print("[sync in current queue] Tasks all finished")
            print("[sync in current queue] end")
        }
    }
}

