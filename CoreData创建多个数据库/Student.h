//
//  Student.h
//  CoreData创建多个数据库
//
//  Created by 609972942 on 15/12/22.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Student : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * age;

@end
