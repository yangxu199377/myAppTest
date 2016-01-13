//
//  ViewController.m
//  CoreData创建多个数据库
//
//  Created by 609972942 on 15/12/22.
//  Copyrigh
//  t (c) 2015年 ios. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "Teacher.h"

@interface ViewController ()
{
    NSManagedObjectContext *_studentContext;
    NSManagedObjectContext *_teacherContext;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _studentContext =[self creatContentWithModelName:@"Student"];
    _teacherContext = [self creatContentWithModelName:@"Teacher"];
    
}

- (NSManagedObjectContext *)creatContentWithModelName:(NSString *)modelName{
    
    
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc]init];
    
    NSURL *modelUrl = [[NSBundle mainBundle] URLForResource:modelName withExtension:@"momd"];
    
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelUrl];
    
    NSPersistentStoreCoordinator *persistent = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:model];
    
    NSString *doc = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite",modelName]];
    
    NSLog(@"%@",doc);
    
    [persistent addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:doc] options:nil error:nil];
    
    [context setPersistentStoreCoordinator:persistent];
    
    return context;
}


- (IBAction)add:(UIButton *)sender {
    
    Student *s = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:_studentContext];
    [s setName:@"zhangsan"];
    [s setAge:@15];
    
    NSError *serror = nil;
    
    [_studentContext save:&serror];
    if (serror) {
        NSLog(@"%@",serror);
    }
    
    
    Teacher *t = [NSEntityDescription insertNewObjectForEntityForName:@"Teacher" inManagedObjectContext:_teacherContext];
    [t setName:@"laohuang"];
    [t setHeight:@170.0];
    
    NSError *terror = nil;
    
    [_teacherContext save:&terror];
    if (terror) {
        NSLog(@"%@",terror);
    }
}

- (IBAction)read:(UIButton *)sender {
    
}


@end
