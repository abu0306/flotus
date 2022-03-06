import Flutter
import UIKit
import Wlib

public class SwiftFlotusPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flotus", binaryMessenger: registrar.messenger())
        let instance = SwiftFlotusPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let method = call.method
        let args:Dictionary<String, AnyObject> = call.arguments as! Dictionary<String, AnyObject>;
        
        
        switch method {
        case "genAddress":
            let arg = args["pk"] as! String
            let arg2 = args["t"] as! String
            let res = WlibGenAddress(arg, arg2)
            return  result(res)
            
        case "genFromString":
            let arg = args["ad"] as! String
            let res = WlibAddressFromString(arg)
            return  result(res)
        case "messageCid":
            let arg = args["msg"] as! String
            let res = WlibMessageCid(arg)
            return  result(res)
        case "genCid":
            let arg = args["msg"] as! String
            let res = WlibGenCid(arg)
            return  result(res)
        case "secpPrivateToPublic":
            let arg = args["ck"] as! String
            let res = WlibSecpPrivateToPublic(arg)
            return  result(res)
        case "secpSign":
            let arg = args["ck"] as! String
            let arg2 = args["msg"] as! String
            let res = WlibSecpSign(arg, arg2)
            return  result(res)
            
        case "genConstructorParamV3":
            let input = args["input"] as! String
            let res = WlibGenConstructorParamV3(input)
            return  result(res)
        case "genProposeForSendParamV3":
            let to = args["to"] as! String
            let value = args["value"] as! String
            let res = WlibGenProposeForSendParamV3(to,value)
            return  result(res)
        case "genProposalForWithdrawBalanceV3":
            let miner = args["miner"] as! String
            let value = args["value"] as! String
            let res = WlibGenProposalForWithdrawBalanceV3(miner,value)
            return  result(res)
        case "genProposalForChangeOwnerV3":
            let sel = args["self"] as! String
            let miner = args["miner"] as! String
            let value = args["value"] as! String
            let res = WlibGenProposalForChangeOwnerV3(sel,miner,value)
            return  result(res)
        case "genProposalForChangeWorkerAddress":
            let miner = args["miner"] as! String
            let value = args["value"] as! String
            let res = WlibGenProposalForChangeWorkerAddress(miner,value)
            return  result(res)
        case "genConfirmUpdateWorkerKey":
            let miner = args["miner"] as! String
            let res = WlibGenConfirmUpdateWorkerKey(miner)
            return  result(res)
        case "genApprovalV3":
            let tx = args["tx"] as! String
            let res = WlibGenApprovalV3(tx)
            return  result(res)
        case "validateAddress":
            let address = args["address"] as! String
            let res = WlibValidateAddress(address)
            return  result(res)
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}

