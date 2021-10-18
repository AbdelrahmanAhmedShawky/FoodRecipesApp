# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def myPods
  pod 'Moya'
  pod 'Moya/RxSwift'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxOptional'
  pod 'Swinject'
  pod 'SwinjectAutoregistration'
  pod 'Then'
  pod 'Kingfisher'
  pod 'SwiftLint'
  pod 'SpreadsheetView'
  pod 'IQKeyboardManagerSwift'
end

target 'FoodRecipesApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for FoodRecipesApp
   myPods
   
  target 'FoodRecipesAppTests' do
    inherit! :search_paths
    # Pods for testing
    myPods
    pod 'RxTest'
    pod 'RxBlocking'
    
  end
  
  target 'FoodRecipesAppUITests' do
    # Pods for testing
  end
  
end
