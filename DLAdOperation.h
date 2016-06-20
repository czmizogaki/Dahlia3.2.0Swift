//
//  DLAdOperationManager.h
//  DahliaSdkCore
//
//  Created by MMizogaki on 6/2/16.
//  Copyright © 2016 CyberZ. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

/*!
 @Class    DLAdOperation
 @abstract 広告表示に必要なデータを取得または送信を管理する
 */

@interface DLAdOperation : NSObject

#pragma mark - Callback
/*!
 @abstract  成功時のコールバック
 @return    jsonObjects:jsonを返す
 */
typedef void (^onReceiveAdInfo)(NSDictionary * _Nonnull receiveObject);
/*!
 @abstract  失敗時のコールバック
 */
typedef void (^onFailure)(void);


#pragma mark - Ad Info Reqest
/*!
 @abstract  広告情報をリクエストして受け取ったJsonを返す
 @param     placementId:ユニークなID
 @param     success:受け取ったJsonをコールバック
 @param     failure:失敗時のコールバック
 */
-(void) reqestAdInfo:(NSString* _Nonnull) placementId
             success:(_Nonnull onReceiveAdInfo) success
             failure:(_Nullable onFailure) failure;


#pragma mark - Send Imp/Chick
/*!
 @abstract  広告情報が表示されたかを送る
 @param     placementId:ユニークなID
 @param     impStatus:広告が表示されたかを判定
 @param     SessionId:リクエストして受け取ったID
 */
+(void) sendImp:(NSString* _Nonnull) placementId
      impStatus:(BOOL) impStatus
      sessionId:(NSString* _Nonnull) sessionId;
/*!
 @abstract  広告がクリックされた時に送る
 @param     placementId:ユニークなID
 @param     SessionId:リクエストして受け取ったID
 */
+(void) sendClick:(NSString* _Nonnull) placementId
        sessionId:(NSString* _Nonnull) sessionId;

@end
