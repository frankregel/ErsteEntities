//
//  ViewController.m
//  ErsteEntities
//
//  Created by Frank Regel on 16.05.14.
//  Copyright (c) 2014 appanatics. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)fetchAllTodoEntities:(id)sender
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;
    
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:@"Todo"];
    
    NSError *error;
    NSArray *allTodos = [managedObjectContext executeFetchRequest:fetch error:&error];
    
    if (error)
    {
        NSLog(@"Fehler: %@", error);
        abort();
    }
    
    NSLog(@"lastObject: %@", [allTodos lastObject]);
    
    for (NSManagedObject *object in allTodos)
    
    {
        NSLog(@"Todo timestamp= %@, todo= %@", [object valueForKey:@"timestamp"], [object valueForKey:@"todo"]);
        
    }
     NSLog(@"lastObject: %@", [allTodos lastObject]);
}

- (IBAction)createTodo:(id)sender
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;
    NSManagedObject *todo = [NSEntityDescription insertNewObjectForEntityForName:@"Todo" inManagedObjectContext:managedObjectContext];
    [todo setValue:[NSDate date] forKey:@"timestamp"];
    [todo setValue:@"Milch kaufen" forKey:@"todo"];
    
    [appDelegate saveContext];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
