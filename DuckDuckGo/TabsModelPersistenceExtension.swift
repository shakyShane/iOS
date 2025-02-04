//
//  TabsModelPersistenceExtension.swift
//  DuckDuckGo
//
//  Copyright © 2017 DuckDuckGo. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation

extension TabsModel {

    private struct Constants {
        static let key = "com.duckduckgo.opentabs"
    }

    public static func get() -> TabsModel? {
        guard let data = UserDefaults.app.object(forKey: Constants.key) as? Data else { return nil }
        return try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? TabsModel
    }

    public static func clear() {
         UserDefaults.app.removeObject(forKey: Constants.key)
    }

    func save() {
        guard let data = try? NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false) else { return }
        UserDefaults.app.set(data, forKey: Constants.key)
    }
    
}
