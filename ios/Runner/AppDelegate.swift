import UIKit
import Flutter
import StoreKit
 
@main
@objc class AppDelegate: FlutterAppDelegate, SKPaymentTransactionObserver {
  private var flutterResult: FlutterResult?
 
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    print("AppDelegate: application did finish launching")
       self.clearPendingTransactions()
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "restore_purchase_channel", binaryMessenger: controller.binaryMessenger)
 
    channel.setMethodCallHandler { [weak self] (call, result) in
      print("AppDelegate: received method call: \(call.method)")
      
      if call.method == "restorePurchases" {
        print("AppDelegate: starting restore purchases flow")
        self?.flutterResult = result
        SKPaymentQueue.default().add(self!)
        SKPaymentQueue.default().restoreCompletedTransactions()
      } else if call.method == "purchaseProduct" {
        print("AppDelegate: starting purchase flow")
        guard let args = call.arguments as? [String: Any],
              let productId = args["productId"] as? String else {
          result(FlutterError(code: "INVALID_ARGUMENTS", message: "Product ID is required", details: nil))
          return
        }
        
        self?.flutterResult = result
        SKPaymentQueue.default().add(self!)
        self?.purchaseProduct(productId: productId)
      }
    }
 
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
 
  // MARK: - Purchase Product
  private func purchaseProduct(productId: String) {
  
    let productIdentifiers: Set<String> = [productId]
    let request = SKProductsRequest(productIdentifiers: productIdentifiers)
    request.delegate = self
    request.start()
  }
 
  // MARK: - SKPaymentTransactionObserver (Required method)
  func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
    print("AppDelegate: payment queue updated with \(transactions.count) transactions")
    for transaction in transactions {
      print("AppDelegate: transaction state: \(transaction.transactionState.rawValue)")
      switch transaction.transactionState {
      case .purchased:
        print("AppDelegate: transaction \(transaction.payment.productIdentifier) purchased")
        self.handlePurchased(transaction: transaction)
        SKPaymentQueue.default().finishTransaction(transaction)
       
      case .restored:
        print("AppDelegate: transaction \(transaction.payment.productIdentifier) restored")
        SKPaymentQueue.default().finishTransaction(transaction)
      case .failed:
        print("AppDelegate: transaction failed with error: \(String(describing: transaction.error))")
        self.handleFailed(transaction: transaction)
        SKPaymentQueue.default().finishTransaction(transaction)
      case .deferred, .purchasing:
        print("AppDelegate: transaction in progress")
        break
      @unknown default:
        print("AppDelegate: unknown transaction state")
        break
      }
    }
  }
 
  // MARK: - Clear Pending Transactions
private func clearPendingTransactions() {
  SKPaymentQueue.default().add(self)
  
  let pendingTransactions = SKPaymentQueue.default().transactions
  print("AppDelegate: found \(pendingTransactions.count) pending transactions on launch")
  
  for transaction in pendingTransactions {
    print("AppDelegate: clearing pending transaction: \(transaction.payment.productIdentifier)")
    SKPaymentQueue.default().finishTransaction(transaction)
  }
  
  SKPaymentQueue.default().remove(self)
}
 
  // MARK: - Handle Purchase Success
  private func handlePurchased(transaction: SKPaymentTransaction) {
    let receiptData = try? Data(contentsOf: Bundle.main.appStoreReceiptURL!)
    let base64Receipt = receiptData?.base64EncodedString() ?? ""
    
    let purchaseData: [String: Any] = [
      "status": "success",
      "productId": transaction.payment.productIdentifier,
      "transactionId": transaction.transactionIdentifier ?? "",
      "receipt": base64Receipt,
      "purchaseDate": Int(transaction.transactionDate?.timeIntervalSince1970 ?? 0),
      "deviceType": "2"
    ]
    
    print("AppDelegate: purchase successful: \(purchaseData)")
    flutterResult?(purchaseData)
    flutterResult = nil
    SKPaymentQueue.default().remove(self)
  }
 
  // MARK: - Handle Purchase Failed
  private func handleFailed(transaction: SKPaymentTransaction) {
    let errorMessage = transaction.error?.localizedDescription ?? "Unknown error"
    let errorCode = (transaction.error as? SKError)?.code.rawValue ?? -1
    
    let errorData: [String: Any] = [
      "status": "error",
      "message": errorMessage,
      "errorCode": errorCode
    ]
    
    print("AppDelegate: purchase failed: \(errorData)")
    flutterResult?(errorData)
    flutterResult = nil
    SKPaymentQueue.default().remove(self)
  }
 
  // MARK: - Restore Methods
  func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
    print("AppDelegate: restore completed transactions finished")
    var restored = [[String: Any]]()
    for transaction in queue.transactions {
      if transaction.transactionState == .restored {
        print("AppDelegate: restored transaction for product: \(transaction.payment.productIdentifier)")
        let receiptData = try? Data(contentsOf: Bundle.main.appStoreReceiptURL!)
        let base64Receipt = receiptData?.base64EncodedString() ?? ""
        
        restored.append([
          "productId": transaction.payment.productIdentifier,
          "transactionId": transaction.transactionIdentifier ?? "",
          "receipt": base64Receipt,
          "price": "0",
          "deviceType": "2",
          "purchaseDate": Int(transaction.transactionDate?.timeIntervalSince1970 ?? 0)
        ])
      }
    }
 
    print("AppDelegate: restored \(restored.count) purchases: \(restored)")
    flutterResult?(["status": "success", "restored": restored])
    flutterResult = nil
    SKPaymentQueue.default().remove(self)
  }
 
  func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
    print("AppDelegate: restore failed with error: \(error.localizedDescription)")
    flutterResult?(["status": "error", "message": error.localizedDescription])
    flutterResult = nil
    SKPaymentQueue.default().remove(self)
  }
}
 
// MARK: - SKProductsRequestDelegate
extension AppDelegate: SKProductsRequestDelegate {
  func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
    print("AppDelegate: received products response")
    
    if let product = response.products.first {
      print("AppDelegate: found product: \(product.productIdentifier)")
      let payment = SKPayment(product: product)
      SKPaymentQueue.default().add(payment)
    } else {
      print("AppDelegate: product not found")
      flutterResult?(FlutterError(code: "PRODUCT_NOT_FOUND", message: "Product not found", details: nil))
      flutterResult = nil
      SKPaymentQueue.default().remove(self)
    }
  }
  
  func request(_ request: SKRequest, didFailWithError error: Error) {
    print("AppDelegate: products request failed: \(error.localizedDescription)")
    flutterResult?(FlutterError(code: "PRODUCTS_REQUEST_FAILED", message: error.localizedDescription, details: nil))
    flutterResult = nil
    SKPaymentQueue.default().remove(self)
  }
}