import Foundation

struct Constants {
    
    static let URLBASE = "https://api.edamam.com/api/"
    static let endPoint = "nutrition-data?app_id=6caa93b7&app_key=f66d4dcdb28f641da29c5c322aee7904&nutrition-type=cooking"
    static let foodDataHeader = ["Quantity","Unit","Food","Calories","Weight"]
    static let totalHeader = ["Calories",
                              "Fat",
                              "Cholesterol",
                              "Sodium",
                              "Protein",
                              "Vitamin",
                              "Calcium",
                              "Iron",
                              "Potassium"]
}
