//
//  SQLiteTools.m
//  CodingDemoMe
//
//  Created by 橘子 on 16/5/15.
//  Copyright © 2016年 wolf. All rights reserved.
//

#import "CoreDataTools.h"

@implementation CoreDataTools
+(NSManagedObjectContext *)getCoreDataCachePath:(NSString *)filename{
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc]init];
    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:model];
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSURL *dataUrl = [NSURL fileURLWithPath:[path stringByAppendingPathComponent:filename]];
    
    NSError *error = nil;
    [psc addPersistentStoreWithType:NSSQLiteStoreType
                      configuration:nil
                                URL:dataUrl
                            options:nil
                              error:&error];
    [context setPersistentStoreCoordinator:psc];
    
    return context;
}
+(NSManagedObjectContext *)getCoreDataDocumentContext:(NSString *)filename{
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc]init];
    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:model];
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSURL *dataUrl = [NSURL fileURLWithPath:[path stringByAppendingPathComponent:filename]];
    
    NSError *error = nil;
    [psc addPersistentStoreWithType:NSSQLiteStoreType
                      configuration:nil
                                URL:dataUrl
                            options:nil
                              error:&error];
    [context setPersistentStoreCoordinator:psc];
    
    return context;

}
@end
