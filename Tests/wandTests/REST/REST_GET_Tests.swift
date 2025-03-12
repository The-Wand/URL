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

import WandURL
import Wand

@available(visionOS, unavailable)
class REST_GET_Tests: XCTestCase {

    @available(iOS 16.0, *)
    func test_Argument_to_REST_Codable() {
        let e = expectation()

        let id = 804244016
        id | .get { (repo: GitHubAPI.Repo) in

            if
                repo.id == id,
                repo.name == "Foundation"
            {
                e.fulfill()
            }

        }

        waitForExpectations(timeout: .default * 2)
    }

    @available(iOS 16.0, *)
    func test_Path_to_REST_Codable() {
        let e = expectation()

        let id = 42
        let path = "https://api.github.com/repositories/\(id)"
        path | .get { (repo: GitHubAPI.Repo) in

            if repo.id == id {
                e.fulfill()
            }

        } | { (e: Error) in
            print(e)
        }

        waitForExpectations(timeout: .default * 2)
    }

}
