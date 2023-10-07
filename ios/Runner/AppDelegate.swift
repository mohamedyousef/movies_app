import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController

      let channel = FlutterMethodChannel(
          name: "com.http",
          binaryMessenger: controller.binaryMessenger
      )
      
      channel.setMethodCallHandler({
           (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          self.handleMethodCall(call: call, result: result)
      })
      

      
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
 
    
    func handleMethodCall(call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "GET" {
            guard let arguments = call.arguments as? [String: Any],
                  let url = arguments["url"] as? String,
                  let headers = arguments["headers"] as? [String: String] else {
                result(FlutterError(code: "400", message: "Invalid arguments", details: nil))
                return
            }

            let requestOptions = NetworkService.RequestOptions(
                url: url,
                headers: headers,
                method: "GET"
            )
            
            
            NetworkService.enqueue(requestOptions, completion: {  response in
                     
                let responseDetails: [String: Any] = [
                    "statusCode": response.statusCode,
                    "data": response.data
                ]
                result(responseDetails)
            },onFailure:{
                result(FlutterError(code: "100", message:"", details: ""));
            })
            
   

         }
     else {
            result(FlutterMethodNotImplemented)
        }
    }
    
    
   

    
  
}
