///
/// Copyright 2020 Alexander Kozin
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
///     http://www.apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
/// Created by Alex Kozin
/// El Machine 🤖

import XCTest

import Any_
import WandURL

@available(visionOS, unavailable)
class REST_Retry_Tests: XCTestCase {

    func test_retry_once() {

        let e = expectation()
        e.assertForOverFulfill = true

        let id = 804244016

        //TODO: Handle Wand
        //Wand.Log.level = .verbose
        let wand = id | .get { (repo: GitHubAPI.Repo) in

            if
                repo.id == id,
                repo.name == "Foundation"
            {
                DispatchQueue.main.async {
                    e.fulfill()
                }
            }

        } |? { (retry: Retry) in

            DispatchTime.now() + 1 | {
                retry()
            }

            DispatchQueue.main.async {
                e.fulfill()
            }
        }

        waitForExpectations(timeout: .default)
    }

    func test_retry() {
        let bound = (1...11).any

        let e = expectation()
        e.assertForOverFulfill = true
        e.expectedFulfillmentCount = bound

        let id = 804244016

        //TODO: Handle Wand
        //Wand.Log.level = .verbose
        let wand = id | .get { (repo: GitHubAPI.Repo) in

            if
                repo.id == id,
                repo.name == "Foundation"
            {

                (1...bound) | {
                    DispatchQueue.main.async {
                        e.fulfill()
                    }
                } as Void

            }


        } |? .while { (retry: Retry, count: Int) in

            DispatchTime.now() + 1 | {
                retry()
            }

            DispatchQueue.main.async {
                e.fulfill()
            }

            return count < bound - 1
        }

        waitForExpectations(timeout: TimeInterval(3 * bound))
    }

    func test_retry_auto() {
        let bound = 2

        let e = expectation()
        e.assertForOverFulfill = true
        e.expectedFulfillmentCount = bound

        let id = 804244016

        //TODO: Handle Wand
        //Wand.Log.level = .verbose
        let wand = id | .get { (repo: GitHubAPI.Repo) in

            if
                repo.id == id,
                repo.name == "Foundation"
            {
                (1...bound) | {
                    DispatchQueue.main.async {
                        e.fulfill()
                    }
                } as Void
            }


        } |? Retry.auto() |? .while { (retry: Retry, count: Int) in

            DispatchQueue.main.async {
                e.fulfill()
            }

            return count < bound - 1
        }

        waitForExpectations(timeout: TimeInterval(3 * bound))
    }

    func test_retry_after() {
        let bound = 2

        let e = expectation()
        e.assertForOverFulfill = true
        e.expectedFulfillmentCount = bound

        let id = 804244016

        //TODO: Handle Wand
        //Wand.Log.level = .verbose
        let wand = id | .get { (repo: GitHubAPI.Repo) in

            if
                repo.id == id,
                repo.name == "Foundation"
            {
                (1...bound) | {
                    DispatchQueue.main.async {
                        e.fulfill()
                    }
                } as Void
            }

        } |? Retry.after(1, attempts: bound) |? .while { (retry: Retry, count: Int) in

            DispatchQueue.main.async {
                e.fulfill()
            }

            return count < bound - 1
        }

        waitForExpectations(timeout: TimeInterval(3 * bound))
    }

//    func test_retry_on_connect() {
//
//        let e = expectation()
//
//        let id = 804244016
//
//        //TODO: Handle Wand
//        //Wand.Log.level = .verbose
//        let wand = id | .get { (repo: GitHubAPI.Repo) in
//
//            if
//                repo.id == id,
//                repo.name == "Foundation"
//            {
//                DispatchQueue.main.async {
//                    e.fulfill()
//                }
//            }
//
//        } |? { (retry: Retry) in
//
//            retry.wand |? NWPath.while { path in
//
//                guard path.status == .satisfied else {
//                    return true
//                }
//
//                retry()
//                return false
//            }
//
//            return false
//        }
//
//        waitForExpectations(timeout: TimeInterval(3 * bound))
//    }
//
//    func test_retry_on_connect_attempts() {
//        let bound = 2
//
//        let e = expectation()
//        e.assertForOverFulfill = true
//        e.expectedFulfillmentCount = bound
//
//        let id = 804244016
//
//        //TODO: Handle Wand
//        //Wand.Log.level = .verbose
//        let wand = id | .get { (repo: GitHubAPI.Repo) in
//
//            if
//                repo.id == id,
//                repo.name == "Foundation"
//            {
//
//                (1...bound) | {
//                    DispatchQueue.main.async {
//                        e.fulfill()
//                    }
//                } as Void
//
//            }
//
//
//        } |? { (retry: Retry, attempt: Int) in
//
//            retry.wand |? NWPath.while { path in
//
//                guard path.status == .satisfied else {
//                    return true
//                }
//
//                retry()
//                return false
//            }
//
//            return true//count < bound - 1
//        }
//
//        waitForExpectations(timeout: TimeInterval(3 * bound))
//    }

}
