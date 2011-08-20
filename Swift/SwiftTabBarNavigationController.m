//
//  SwiftTabBarNavigationController.m
//  Swift
//
//  Created by Errol on 8/17/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "SwiftTabBarNavigationController.h"


@implementation SwiftTabBarNavigationController

@synthesize bicSearch,ibanSearch, aboutSwift, aboutSepa;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //do nothing
    }
    return self;
}

- (void)dealloc
{
    [bicSearch release];
    [ibanSearch release];
    [aboutSwift release];
    [aboutSepa release];
    
    [backItem1 release];
    [backItem2 release];
    [backItem3 release];
    [backItem4 release];
    
    [navBicSearch release];
    [navIbanSearch release];
    [navSwift release];
    [navSepa release];

    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    unichar backArrowCode = 0x25C0;
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage  *buttonImage1 = [UIImage imageNamed:@"backbutton.png"];
    [button1 setImage:buttonImage1 forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [button1 setFrame:CGRectMake(0, 0, buttonImage1.size.width, buttonImage1.size.height)];
    backItem1 = [[UIBarButtonItem alloc] initWithCustomView:button1];
    
//    backItem1 = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithCharacters:&backArrowCode length:1] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    backItem2 = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithCharacters:&backArrowCode length:1] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    backItem3 = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithCharacters:&backArrowCode length:1] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    backItem4 = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithCharacters:&backArrowCode length:1] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    
    // BIC SEARCH
    self.bicSearch = [[BicSearchViewController alloc] initWithNibName:@"BicSearchViewController" bundle:nil];
    navBicSearch = [[UINavigationController alloc] initWithRootViewController:bicSearch];
    navBicSearch.navigationBar.barStyle = UIBarStyleBlackOpaque;
    navBicSearch.navigationBar.topItem.titleView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"swift_topbar_icon.png"]] autorelease];    
    
    // IBAN SEARCH
    self.ibanSearch = [[IbanSearchViewController alloc] initWithNibName:@"IbanSearchViewController" bundle:nil];
    navIbanSearch = [[UINavigationController alloc] initWithRootViewController:ibanSearch];
    navIbanSearch.navigationBar.barStyle = UIBarStyleBlackOpaque;
    navIbanSearch.navigationBar.topItem.titleView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"swift_topbar_icon.png"]] autorelease];    
    
    // ABOUT SWIFT
    self.aboutSwift = [[AboutSwiftViewController alloc] initWithNibName:@"AboutSwiftViewController" bundle:nil];
    navSwift = [[UINavigationController alloc] initWithRootViewController:aboutSwift];
    navSwift.navigationBar.barStyle = UIBarStyleBlackOpaque;
    navSwift.navigationBar.topItem.titleView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"swift_topbar_icon.png"]] autorelease];    
    
    // ABOUT SEPA
    self.aboutSepa = [[AboutSepaViewController alloc] initWithNibName:@"AboutSepaViewController" bundle:nil];
    navSepa = [[UINavigationController alloc] initWithRootViewController:aboutSepa];
    navSepa.navigationBar.barStyle = UIBarStyleBlackOpaque;
    navSepa.navigationBar.topItem.titleView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"swift_topbar_icon.png"]] autorelease];    
    
    // LOAD VIEW CONTROLLERS
    self.viewControllers = [[[NSArray alloc] initWithObjects:navBicSearch, navIbanSearch, navSwift, navSepa, nil] autorelease];
    
    [navBicSearch.navigationBar.topItem     setLeftBarButtonItem:backItem1];
    [navIbanSearch.navigationBar.topItem    setLeftBarButtonItem:backItem2];
    [navSwift.navigationBar.topItem         setLeftBarButtonItem:backItem3];
    [navSepa.navigationBar.topItem          setLeftBarButtonItem:backItem4];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark Actions (Button)
-(IBAction) backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark Actions (Method)
-(void)selectTab:(NSUInteger)tabIndex {
    
    
    [self setSelectedIndex:tabIndex];
}
@end
