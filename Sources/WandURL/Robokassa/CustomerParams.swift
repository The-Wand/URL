///
/// Copyright © 2020-2024 El Machine 🤖
/// https://el-machine.com/
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
/// 1) LICENSE file
/// 2) https://apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
/// Created by Alex Kozin
/// 2020 El Machine

#if canImport(Foundation)
import Foundation

//import WandURL
import Wand


/**
 * Объект данных о покупателе.
 */
public
struct CustomerParams: Codable {

        /**
         *
         * Язык общения с клиентом (в соответствии с ISO 3166-1). Определяет на каком языке будет страница
         * Robokassa, на которую попадёт покупатель. Если параметр не передан, то используются региональные
         * настройки браузера покупателя. Для значений отличных от ru или en используется английский язык.
         */
        var culture: Locale?

        /**
         * Если параметр передан, то email покупателя автоматически подставляется в платёжную форму Robokassa.
         */
        var email: String?

        /**
         * Передача этого параметра (Ip конечного пользователя) желательна для усиления безопасности,
         * предотвращению фрода и противодействию мошенникам.
         */
        var ip: String?

    public
    init(culture: Locale? = nil, email: String? = nil, ip: String? = nil) {
        self.culture = culture
        self.email = email
        self.ip = ip
    }

//        @Suppress("DEPRECATION")
//        private constructor(parcel: Parcel) : this() {
//            parcel.run {
//                culture = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
//                    readSerializable(Culture::class.java.classLoader, Culture::class.java)
//                } else {
//                    readSerializable() as? Culture
//                }
//                email = readString()
//                ip = readString()
//            }
//        }
//
//        override fun writeToParcel(parcel: Parcel, flags: Int) {
//            parcel.run {
//                writeSerializable(culture)
//                writeString(email)
//                writeString(ip)
//            }
//        }
//
//        override fun describeContents(): Int {
//            return 0
//        }
//
//        @Throws(RoboSdkException::class)
//        override fun checkRequiredFields() {
//            check(email.isNullOrEmpty() || android.util.Patterns.EMAIL_ADDRESS.matcher(email).matches()) { "Email has invalid format" }
//        }
//
//        companion object CREATOR : Parcelable.Creator<CustomerParams> {
//            override fun createFromParcel(parcel: Parcel): CustomerParams {
//                return CustomerParams(parcel)
//            }
//
//            override fun newArray(size: Int): Array<CustomerParams?> {
//                return arrayOfNulls(size)
//            }
//        }

}

#endif
