//
//  ViewController.m
//  HBALNDesignPatterns
//
//  Created by PhucNT13 on 8/18/15.
//  Copyright (c) 2015 HCMUS. All rights reserved.
//

#pragma mark - Import frameworks
#import "HBALNHomeViewController.h"

#import "HBALibraryAPI.h"
#import "HBALNAlbum+HBALNTableRepresentation.h"

#import "HBALNHorizontalScroller.h"
#import "HBALNAlbumView.h"

#pragma mark - Private interface
@interface HBALNHomeViewController () <UITableViewDataSource, UITableViewDelegate, HBALNHorizontalScrollerDelegate>

// Create table view to present data
@property (strong, nonatomic) UITableView *tableData;

// Create array of album
@property (strong, nonatomic) NSArray *albums;

// Create dictionary to hold current data
@property (strong, nonatomic) NSDictionary *currentAlbumData;

// Create index to hold current index of data
@property (nonatomic) NSInteger indexAlbumData;

// Create index to hold current index of data
@property (strong, nonatomic) HBALNHorizontalScroller *scroller;

@end

#pragma mark - Class implementing
@implementation HBALNHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    [self configDataWhenControllerBecomeLoad];
}

#pragma mark Implement private methods

// Config controller when view become load
- (void)configDataWhenControllerBecomeLoad
{
    // Config scroll view
    self.scroller = [[HBALNHorizontalScroller alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 120)];
    self.scroller.backgroundColor = [UIColor colorWithRed:0.24f green:0.35f blue:0.49f alpha:1];
    self.scroller.delegate = self;
    [self.view addSubview:self.scroller];
    
    // Config background view
    self.view.backgroundColor = [UIColor colorWithRed:135.0 green:211.0 blue:124.0 alpha:1];
    
    // Config current index
    self.indexAlbumData = 0;
    
    // Get data for albums
    self.albums = [[HBALibraryAPI sharedInstance] getAlbums];
    
    // Config table view
    [self configTableView];
    
    // Show current view after load
    [self showDataForAlbumAtIndex:self.indexAlbumData];
    
    // Refresh scroll view controller after load data
    [self reloadScroller];
}

// Config table view
- (void)configTableView
{
    // Config tableview
    self.tableData = [[UITableView alloc] initWithFrame:CGRectMake(0, 120, self.view.frame.size.width, self.view.frame.size.height  - 120) style:(UITableViewStyleGrouped)];
    self.tableData.dataSource = self;
    self.tableData.delegate = self;
    self.tableData.backgroundView = nil;
    [self.view addSubview:self.tableData];
    
    // Register cell for table view
    
    // Register header cell for table view
    
    // Register footer cell for table view
}


// Reload scroller
- (void)reloadScroller
{
    self.albums = [[HBALibraryAPI sharedInstance] getAlbums];
    
    if (self.indexAlbumData < 0) {
        self.indexAlbumData = 0;
    }
    else if (self.indexAlbumData >= self.albums.count) {
        self.indexAlbumData = self.albums.count - 1;
    }
    
    [self.scroller reload];
    [self showDataForAlbumAtIndex:self.indexAlbumData];
}

//  Update infor for current AlbumData
- (void)showDataForAlbumAtIndex:(NSUInteger)index
{
    // Make sure index not out of bound albums
    if ((index >= [self.albums count])) {
        self.currentAlbumData = nil;
    } else {
        // Fetch the album
        HBALNAlbum *local_album = [self.albums objectAtIndex:index];
        self.currentAlbumData = [local_album tr_tableRepresentation];
    }
    [self.tableData reloadData];
    
}

#pragma mark UITableViewDelegate implementing

// Get number of section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// Get number of item in section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.currentAlbumData[@"titles"] count];
}

// Config cell for tableView for each index
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Defind cell identify
    static NSString *cellIdentify = @"Cell";
    
    // Get dequeueReuseableCell
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    
    if (!tableViewCell) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:cellIdentify];
    }
    
    // Config cell
    [tableViewCell.textLabel setText:self.currentAlbumData[@"titles"][indexPath.row] ];
    [tableViewCell.detailTextLabel setText:self.currentAlbumData[@"values"][indexPath.row] ];
    
    // Return cell
    return tableViewCell;
}

// TODO Check it later
#pragma mark HorizontalScrollerDelegate implementing
- (void)horizontalScroller:(HBALNHorizontalScroller *)scroller clickedAtIndex:(NSInteger)index
{
    // Update current index when item is changed
    self.indexAlbumData = index;
    
    // Show data at current index
    [self showDataForAlbumAtIndex:self.indexAlbumData];
}

- (NSInteger)numberOfViewsForHorizontalScroller:(HBALNHorizontalScroller *)scroller
{
    return self.albums.count;
}

- (UIView *)horizontalScroller:(HBALNHorizontalScroller *)scroller viewAtIndex:(NSInteger)index
{
    // Create a view for scroller
    HBALNAlbum *album = self.albums[index];
    HBALNAlbumView *albumView = [[HBALNAlbumView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) albumCover:album.coverUrl];
    
    // Return view for scroller
    return albumView;
}

@end
