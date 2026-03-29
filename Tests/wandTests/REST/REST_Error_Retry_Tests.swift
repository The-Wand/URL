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

        } | { (retry: @escaping Retry) in

            DispatchTime.now() + 1 | {
                retry()
            }

            DispatchQueue.main.async {
                e.fulfill()
            }
            return false
        }

        waitForExpectations(timeout: .default)
    }

    func test_retry() {
        let bound =  (1...11).any

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


        } | { (retry: @escaping Retry, count: Int) in

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

    func test_autoretry() {
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
                    print("FILL")
                    DispatchQueue.main.async {
                        e.fulfill()
                    }
                } as Void

            }


        } | Core.autoretry() | { (retry: @escaping Retry, count: Int) in

            DispatchQueue.main.async {
                e.fulfill()
            }

            return count < bound - 1
        }

        waitForExpectations(timeout: TimeInterval(3 * bound))
    }

}


