//
//  SQLiteTools.h
//  CodingDemoMe
//
//  Created by 橘子 on 16/5/15.
//  Copyright © 2016年 wolf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@interface CoreDataTools : NSObject
+(NSManagedObjectContext *)getCoreDataDocumentContext:(NSString *)filename;
+(NSManagedObjectContext *)getCoreDataCacheContext:(NSString *)filename;

@end
