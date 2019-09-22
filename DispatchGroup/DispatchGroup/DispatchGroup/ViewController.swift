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

        // Custom queue in sync
        syncCustomQueue()
        syncCustomQueue2()

        // Dispatch group in async
        asyncGlobalQueue()
        asyncGlobalQueue2()
        asyncMainQueue()

        // Dispatch group in sync
        syncGlobalQueue()
        syncCurrentQueue()

        // Multiple dispatch group in async
        multipleDispatchQueue()
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

    func syncCustomQueue() {

        print("[sync in custom queue] start")

        let queue = DispatchQueue(label: "My Queue") // Default is a serial queue

        queue.sync {
            print("[sync in custom queue] Task1 is in main thread: \(Thread.isMainThread)") // true, false is async
            print("[sync in custom queue] Task2 is in main thread: \(Thread.isMainThread)") // true, false is async
        }

        queue.sync {
            print("[sync in custom queue] Task3 is in main thread: \(Thread.isMainThread)") // true, false is async
            print("[sync in custom queue] Task4 is in main thread: \(Thread.isMainThread)") // true, false is async
            print("[sync in custom queue] Task5 is in main thread: \(Thread.isMainThread)") // true, false is async
        }

        print("Main thread running")
    }

    func syncCustomQueue2() {

        // The result is same as syncCustomQueue
        print("[sync in custom queue2] start")

        let queue = DispatchQueue(label: "My Queue", attributes: .concurrent) // is a concurrent queue

        queue.sync {
            print("[sync in custom queue2] Task1 is in main thread: \(Thread.isMainThread)") // true, false is async
            print("[sync in custom queue2] Task2 is in main thread: \(Thread.isMainThread)") // true, false is async
        }

        queue.sync {
            print("[sync in custom queue2] Task3 is in main thread: \(Thread.isMainThread)") // true, false is async
            print("[sync in custom queue2] Task4 is in main thread: \(Thread.isMainThread)") // true, false is async
            print("[sync in custom queue2] Task5 is in main thread: \(Thread.isMainThread)") // true, false is async
        }

        print("Main thread running")
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

    func multipleDispatchQueue() {

        print("[multiple dispatch queue1] start")

        let group1 = DispatchGroup()

        group1.enter()

        DispatchQueue.global().async {
            print("[multiple dispatch queue1] Task1 is in main thread: \(Thread.isMainThread)")
            print("[multiple dispatch queue1] Task2 is in main thread: \(Thread.isMainThread)")
            group1.leave()
        }

        group1.enter()
        DispatchQueue.global().async {
            print("[multiple dispatch queue1] Task3 is in main thread: \(Thread.isMainThread)")
            print("[multiple dispatch queue1] Task4 is in main thread: \(Thread.isMainThread)")
            print("[multiple dispatch queue1] Task5 is in main thread: \(Thread.isMainThread)")
            group1.leave()
        }

        group1.notify(queue: .main) {
            print("[multiple dispatch queue1] Tasks all finished")
            print("[multiple dispatch queue1] end")
        }

        print("[multiple dispatch queue2] start")

        let group2 = DispatchGroup()

        group2.enter()

        DispatchQueue.global().async {
            print("[multiple dispatch queue2] Task1 is in main thread: \(Thread.isMainThread)")
            print("[multiple dispatch queue2] Task2 is in main thread: \(Thread.isMainThread)")
            group2.leave()
        }

        group2.enter()
        DispatchQueue.global().async {
            print("[multiple dispatch queue2] Task3 is in main thread: \(Thread.isMainThread)")
            print("[multiple dispatch queue2] Task4 is in main thread: \(Thread.isMainThread)")
            print("[multiple dispatch queue2] Task5 is in main thread: \(Thread.isMainThread)")
            group2.leave()
        }

        group2.notify(queue: .main) {
            print("[multiple dispatch queue2] Tasks all finished")
            print("[multiple dispatch queue2] end")
        }
    }
}

