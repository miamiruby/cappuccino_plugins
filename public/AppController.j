/*
 * AppController.j
 *
 * Created by Francisco Tolmasky.
 */

@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
    CPCollectionView listCollectionView ;
    CPTextField myBox;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
	//background window below toolbar
	
    //[self showWindowWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask name:@"Main Window"];
	[self showMainWindow:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask name:@"Main Window"];
    //normal window
	//[self showWindowWithContentRect:CGRectMake(600.0, 100.0, 400.0, 300.0) styleMask:CPTitledWindowMask | CPResizableWindowMask | CPClosableWindowMask name:@"Standard Window"];
    //black hud
	//[self showWindowWithContentRect:CGRectMake(100.0, 100.0, 400.0, 300.0) styleMask:CPTitledWindowMask | CPResizableWindowMask | CPHUDBackgroundWindowMask name:@"HUD Window"];

	//[self showArticleWindow:CGRectMake(600.0, 100.0, 400.0, 300.0) styleMask:CPTitledWindowMask | CPResizableWindowMask | CPClosableWindowMask title:@"Article Title" body:@"Article Body"];
    

    // Uncomment the following line to turn on the standard menu bar.
    [CPMenu setMenuBarVisible:YES];
}

- (void)showArticleWindow:(CGRect)aContentRect styleMask:(unsigned)aStyleMask title:(CPString)aTitle body:(CPString)aBody
{
    var theWindow = [[CPWindow alloc] initWithContentRect:aContentRect styleMask:aStyleMask],
        contentView = [theWindow contentView];
        
    [theWindow setTitle:aTitle];
    
    [theWindow orderFront:self];
    
    var label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];

    [label setStringValue:aBody];
    [label setTextColor:aStyleMask & CPHUDBackgroundWindowMask ? [CPColor whiteColor] : [CPColor blackColor]];
    [label setFont:[CPFont boldSystemFontOfSize:14.0]];

    [label sizeToFit];

    [label setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin];
    //[label setFrameOrigin:CGPointMake((CGRectGetWidth([contentView bounds]) - CGRectGetWidth([label frame])) / 2.0, 80.0)];
    
    [contentView addSubview:label];
    
    var toggleToolbarButton = [[CPButton alloc] initWithFrame:CGRectMake((CGRectGetWidth([contentView bounds]) - 100.0) / 2.0, CGRectGetMaxY([label frame]) + 10.0, 100.0, 18.0)];
    
    [toggleToolbarButton setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin];
    [toggleToolbarButton setTitle:@"Toggle Toolbar"];
    [toggleToolbarButton setTarget:theWindow];
    [toggleToolbarButton setAction:@selector(toggleToolbarShown:)];
    
    //[contentView addSubview:toggleToolbarButton];
    
    var toggleFullBridgeButton = [[CPButton alloc] initWithFrame:CGRectMake(150.0, CGRectGetMaxY([toggleToolbarButton frame]) + 10.0, 100.0, 18.0)];

    [toggleFullBridgeButton setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin];
    [toggleFullBridgeButton setTitle:@"Toggle Full Bridge"];
    [toggleFullBridgeButton setTarget:theWindow];
    [toggleFullBridgeButton setAction:@selector(toggleToolbarShown:)];
    
    //[contentView addSubview:toggleFullBridgeButton];
    
    //var toolbar = [[CPToolbar alloc] initWithIdentifier:@"Toolbar"];
    
    //[toolbar setDelegate:self];
    //[theWindow setToolbar:toolbar];
}
- (void)showMainWindow:(CGRect)aContentRect styleMask:(unsigned)aStyleMask name:(CPString)aName
{
    var theWindow = [[CPWindow alloc] initWithContentRect:aContentRect styleMask:aStyleMask],
        contentView = [theWindow contentView];


	        
    //[theWindow setTitle:@"Window"];
    
    [theWindow orderFront:self];
    

	var calendar = [[CalendarView alloc] loadCalendar];
	[contentView addSubview:calendar];
	//[[theWindow contentView] addSubview:[CalendarView alloc] init];
		
    var label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];

    //[label setStringValue:@"Mainwindow"];
    [label setTextColor:aStyleMask & CPHUDBackgroundWindowMask ? [CPColor whiteColor] : [CPColor blackColor]];
    [label setFont:[CPFont boldSystemFontOfSize:12.0]];

    [label sizeToFit];

    [label setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin];
   // [label setFrameOrigin:CGPointMake((CGRectGetWidth([contentView bounds]) - CGRectGetWidth([label frame])) / 2.0, 80.0)];
    
    [contentView addSubview:label];
    
    var toggleToolbarButton = [[CPButton alloc] initWithFrame:CGRectMake((CGRectGetWidth([contentView bounds]) - 100.0) / 2.0, CGRectGetMaxY([label frame]) + 10.0, 100.0, 18.0)];
    
    [toggleToolbarButton setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin];
    [toggleToolbarButton setTitle:@"Toggle Toolbar"];
    [toggleToolbarButton setTarget:theWindow];
    [toggleToolbarButton setAction:@selector(toggleToolbarShown:)];
    
    //[contentView addSubview:toggleToolbarButton];
    
    var toggleFullBridgeButton = [[CPButton alloc] initWithFrame:CGRectMake(150.0, CGRectGetMaxY([toggleToolbarButton frame]) + 10.0, 100.0, 18.0)];

    [toggleFullBridgeButton setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin];
    [toggleFullBridgeButton setTitle:@"Toggle Full Bridge"];
    [toggleFullBridgeButton setTarget:theWindow];
    [toggleFullBridgeButton setAction:@selector(toggleToolbarShown:)];
    
    //[contentView addSubview:toggleFullBridgeButton];
    
    var toolbar = [[CPToolbar alloc] initWithIdentifier:@"Toolbar"];
    
    [toolbar setDelegate:self];
    [theWindow setToolbar:toolbar];


	var myBox = [[CPTextField alloc] initWithFrame:CGRectMake(10, 30, 140.0, 24)] ;
	[myBox setBezeled:YES];
	[myBox setBezelStyle:CPTextFieldSquareBezel];
	[myBox setPlaceholderString:@"Enter text"];
	[myBox setEditable:YES];
	//[myBox setStringValue:@"code"];
	//[myBox setObjectValue:@"code"];
	
	[contentView addSubview:myBox];
	
    // create the button
    //var searchButton = [[CPButton alloc] initWithFrame:CGRectMake(200, 30, 150, 18)];
	var searchButton = [[CPButton alloc] initWithFrame:CGRectMake(200, 30, 150, 24)];
	//[searchButton sizeToFit]
    [searchButton setFont: [CPFont boldSystemFontOfSize: 12.0]] ;
    [searchButton setTitle: @"New Twitter search"] ;
    //[searchButton setAction:@selector(newSearch:)] ;
    [searchButton setAction:@selector(getArticles:)] ;
	[contentView addSubview:searchButton] ;



	
	/*
	var articlesButton = [[CPButton alloc] initWithFrame:CGRectMake(200, 70, 150, 20)];
    [articlesButton setFont: [CPFont boldSystemFontOfSize: 12.0]] ;
    [articlesButton setTitle: @"Get Articles"] ;
    [articlesButton setAction:@selector(getArticles:)] ;
    [contentView addSubview:articlesButton] ;
	*/

    
    // create the search results area
    var searchResultsArea = [[CPScrollView alloc] initWithFrame:CGRectMake(10.0, 70.0, CGRectGetWidth([contentView bounds]), CGRectGetHeight([contentView bounds]) - 40.0)];
    [searchResultsArea setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable] ;
    [searchResultsArea setAutohidesScrollers:YES] ;
    
    var searchResultItem = [[CPCollectionViewItem alloc] init] ;
    [searchResultItem setView:[[SearchResultCell alloc] initWithFrame:CGRectMakeZero()]] ;
    
    listCollectionView = [[CPCollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([contentView bounds]), 60.0)];
    
    [listCollectionView setDelegate:self] ;
    [listCollectionView setItemPrototype:searchResultItem] ;
    
    [listCollectionView setMinItemSize:CGSizeMake(CGRectGetWidth([contentView bounds]) - 20.0, 60.0)] ;
    [listCollectionView setMaxItemSize:CGSizeMake(CGRectGetWidth([contentView bounds]) - 20.0, 60.0)] ;
    [listCollectionView setAutoresizingMask:CPViewWidthSizable] ;
    
    [searchResultsArea setDocumentView:listCollectionView] ;
    
    [contentView addSubview:searchResultsArea] ;
    

}
- (void)getArticles:(id)sender
{
	var request = [CPURLRequest requestWithURL:"http://localhost:3000/articles.js"] ;
	twitterConnection = [CPJSONPConnection connectionWithRequest:request callback:"callback" delegate:self] ;

}

 
- (void)newSearch:(id)sender
{
	var userInput = [myBox stringValue];
    
    if (userInput)
    {
        var request = [CPURLRequest requestWithURL:"http://search.twitter.com/search.json?q=" + encodeURIComponent(userInput)] ;
        twitterConnection = [CPJSONPConnection connectionWithRequest:request callback:"callback" delegate:self] ;
    }
	
}
 
- (void)connection:(CPJSONPConnection)aConnection didReceiveData:(CPString)data
{
	//alert("got data");
	console.log(data);
	[self showArticleWindows:data.results] ;
    //[self showSearchResults:data.results] ;
}
 
- (void)connection:(CPJSONPConnection)aConnection didFailWithError:(CPString)error
{
    alert(error) ;
}
 
- (void)showArticleWindows:(CPArray)results
{
	console.log(results["0"]);
	
	for (i=0;i < results.length;i++) {
		console.log(results[i]);
		[self showArticleWindow:CGRectMake(600.0, 100.0, 400.0, 300.0) styleMask:CPTitledWindowMask | CPResizableWindowMask | CPClosableWindowMask title:results[i].article.title body:results[i].article.body];

	}

        
    
    

	//for (Object results : result) {
	//	console.log(result);
	//}
	//[self showArticleWindow:CGRectMake(600.0, 100.0, 400.0, 300.0) styleMask:CPTitledWindowMask | CPResizableWindowMask | CPClosableWindowMask title:anObject.article.title body:anObject.article.body];
	//[theWindow showArticleWindow:CGRectMake(600.0, 100.0, 400.0, 300.0) styleMask:CPTitledWindowMask | CPResizableWindowMask | CPClosableWindowMask title:anObject.article.title body:anObject.article.body];
	
    //[listCollectionView setContent:results] ;
    //var stringValue = "@" + anObject.article.title + " : " ;
    //stringValue+= anObject.article.body ;
}

- (void)showSearchResults:(CPArray)results
{
    [listCollectionView setContent:results] ;

}

- (void)showWindowWithContentRect:(CGRect)aContentRect styleMask:(unsigned)aStyleMask name:(CPString)aName
{
    var theWindow = [[CPWindow alloc] initWithContentRect:aContentRect styleMask:aStyleMask],
        contentView = [theWindow contentView];
        
    [theWindow setTitle:@"Window"];
    
    [theWindow orderFront:self];
    
    var label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];

    [label setStringValue:aName];
    [label setTextColor:aStyleMask & CPHUDBackgroundWindowMask ? [CPColor whiteColor] : [CPColor blackColor]];
    [label setFont:[CPFont boldSystemFontOfSize:24.0]];

    [label sizeToFit];

    [label setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin];
    [label setFrameOrigin:CGPointMake((CGRectGetWidth([contentView bounds]) - CGRectGetWidth([label frame])) / 2.0, 80.0)];
    
    [contentView addSubview:label];
    
    var toggleToolbarButton = [[CPButton alloc] initWithFrame:CGRectMake((CGRectGetWidth([contentView bounds]) - 100.0) / 2.0, CGRectGetMaxY([label frame]) + 10.0, 100.0, 18.0)];
    
    [toggleToolbarButton setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin];
    [toggleToolbarButton setTitle:@"Toggle Toolbar"];
    [toggleToolbarButton setTarget:theWindow];
    [toggleToolbarButton setAction:@selector(toggleToolbarShown:)];
    
    [contentView addSubview:toggleToolbarButton];
    
    var toggleFullBridgeButton = [[CPButton alloc] initWithFrame:CGRectMake(150.0, CGRectGetMaxY([toggleToolbarButton frame]) + 10.0, 100.0, 18.0)];

    [toggleFullBridgeButton setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin];
    [toggleFullBridgeButton setTitle:@"Toggle Full Bridge"];
    [toggleFullBridgeButton setTarget:theWindow];
    [toggleFullBridgeButton setAction:@selector(toggleToolbarShown:)];
    
    [contentView addSubview:toggleFullBridgeButton];
    
    var toolbar = [[CPToolbar alloc] initWithIdentifier:@"Toolbar"];
    
    [toolbar setDelegate:self];
    [theWindow setToolbar:toolbar];
}

@end



var PopUpButtonToolbarItemIdentifier    = @"PopUpButtonToolbarItemIdentifier",
    SliderToolbarItemIdentifier         = @"SliderToolbarItemIdentifier",
    ButtonToolbarItemIdentifier         = @"ButtonToolbarItemIdentifier";

@implementation AppController (Toolbar)

- (CPArray)toolbarAllowedItemIdentifiers:(CPToolbar)aToolbar
{
    return [
        PopUpButtonToolbarItemIdentifier, SliderToolbarItemIdentifier,
        ButtonToolbarItemIdentifier,
        CPToolbarSeparatorItemIdentifier, CPToolbarSpaceItemIdentifier, CPToolbarFlexibleSpaceItemIdentifier];
}

- (CPArray)toolbarDefaultItemIdentifiers:(CPToolbar)aToolbar
{
    return [
        
        ButtonToolbarItemIdentifier,
        
        CPToolbarSeparatorItemIdentifier,
        
        CPToolbarSpaceItemIdentifier,
        
        PopUpButtonToolbarItemIdentifier, SliderToolbarItemIdentifier,
        
        CPToolbarSpaceItemIdentifier
        ];
}

- (CPToolbarItem)toolbar:(CPToolbar)aToolbar itemForItemIdentifier:(CPString)anItemIdentifier willBeInsertedIntoToolbar:(BOOL)aFlag
{
    var toolbarItem = [[CPToolbarItem alloc] initWithItemIdentifier:anItemIdentifier];
    
    [toolbarItem setTarget:self];
    [toolbarItem setMinSize:CGSizeMake(32.0, 32.0)];
    [toolbarItem setMaxSize:CGSizeMake(32.0, 32.0)];

    if (anItemIdentifier === PopUpButtonToolbarItemIdentifier)
    {
        [toolbarItem setMinSize:CGSizeMake(120.0, 20.0)];
        [toolbarItem setMaxSize:CGSizeMake(120.0, 20.0)];
    
        var popUpButton = [[CPPopUpButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 120.0, 20.0) pullsDown:NO];
        
        [popUpButton addItemWithTitle:@"Option 11111"];
        [popUpButton addItemWithTitle:@"Option 2"];
        [popUpButton addItemWithTitle:@"Option 3"];
        
        [toolbarItem setView:popUpButton];
        
        [toolbarItem setTarget:nil];
        [toolbarItem setLabel:@"Pop Up Button"];
    }

    else if (anItemIdentifier === SliderToolbarItemIdentifier)
    {
        [toolbarItem setMinSize:CGSizeMake(120.0, 20.0)];
        [toolbarItem setMaxSize:CGSizeMake(120.0, 20.0)];
    
        var slider = [[CPSlider alloc] initWithFrame:CGRectMake(0.0, 0.0, 120.0, 20.0) ];
        
        [toolbarItem setView:slider];
        
        [toolbarItem setTarget:nil];
        [toolbarItem setLabel:@"Slider"];
    }
    
    else if (anItemIdentifier === ButtonToolbarItemIdentifier)
    {
        var image = [[CPImage alloc] initWithContentsOfFile:@"Resources/Cappuccino.png" size:CGSizeMake(32.0, 32.0)],
            alternateImage = [[CPImage alloc] initWithContentsOfFile:@"Resources/CappuccinoAlternate.png" size:CGSizeMake(32.0, 32.0)];
        
        [toolbarItem setLabel:@"Standard"];
        [toolbarItem setImage:image];
        [toolbarItem setAlternateImage:alternateImage];
    }
    
    return toolbarItem;
}

@end
@implementation SearchResultCell : CPView
{
    CPTextField _label ;
}
 
- (void)setRepresentedObject:(JSObject)anObject
{
    if (!_label)
    {
        _label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()] ;
        //[_label setFont:[CPFont systemFontOfSize:12.0]];
        [_label setTextColor:[CPColor blackColor]] ;
        [self addSubview:_label];
    }

	//[self showArticleWindow:CGRectMake(600.0, 100.0, 400.0, 300.0) styleMask:CPTitledWindowMask | CPResizableWindowMask | CPClosableWindowMask title:anObject.article.title body:anObject.article.body];
	//[theWindow showArticleWindow:CGRectMake(600.0, 100.0, 400.0, 300.0) styleMask:CPTitledWindowMask | CPResizableWindowMask | CPClosableWindowMask title:anObject.article.title body:anObject.article.body];
	//console.log(self.parent);
	//console.log(anObject.article.title);
    var stringValue = "@" + anObject.article.title + " : " ;
    stringValue+= anObject.article.body ;
    //stringValue+= " (http://twitter.com/" + anObject.from_user + "/status/" + anObject.id + ")" ;
    
    [_label setStringValue:stringValue] ;
    [_label setFrameSize:CGSizeMake(600.0, 60.0)] ;
    [_label setFrameOrigin:CGPointMake(10, 0)] ;
    [_label setLineBreakMode:CPLineBreakByWordWrapping] ;
}
 
- (void)setSelected:(BOOL)isSelected
{
    [self setBackgroundColor:isSelected ? [CPColor blueColor] : nil] ;
    [_label setTextColor:isSelected ? [CPColor whiteColor] : [CPColor blackColor]] ;
}
@end

@implementation CalendarView: CPView
{
}

-(id)loadCalendar {
	self = [super initWithFrame:CGRectMake(400, 0, 200, 200)];
	//calenderView = [self contentView];
	//self = [super initWithFrame:CGRectMake(400, 0, 200, 200) styleMask:CPTitledWindowMask | CPResizableWindowMask | CPClosableWindowMask];
	//self = [[CPWindow alloc] initWithFrame:CGRectMake(400, 0, 200, 200)];
	//[self orderFront:self];
	//self = [[CPWindow alloc] initWithFrame:CGRectMake(600.0, 100.0, 400.0, 300.0) styleMask:CPTitledWindowMask | CPResizableWindowMask | CPClosableWindowMask name:@"Calender"];
	//calenderView = [self contentView]];
	//[calenderView orderFront:self];
	/*
    var theWindow = [[CPWindow alloc] initWithContentRect:aContentRect styleMask:aStyleMask],
        contentView = [theWindow contentView];
        
    [theWindow setTitle:aTitle];
    
    [theWindow orderFront:self];
*/
	
	if (self) {
		[self loadData];
	}
	return self;
}

-(void)loadData {
	var subviews = [self subviews], count = [subviews count]; while(count--) [subviews[count] removeFromSuperview]; // remove all subviews
	
	var sdays = [[CPArray alloc] init];
	[sdays addObject:@"mon"];
	[sdays addObject:@"tue"];
	[sdays addObject:@"wed"];
	[sdays addObject:@"thu"];
	[sdays addObject:@"fri"];
	[sdays addObject:@"sat"];
	[sdays addObject:@"sun"];
	
	var ldays = [[CPArray alloc] init];
	[ldays addObject:@"monday"];
	[ldays addObject:@"tuesday"];
	[ldays addObject:@"wednesday"];
	[ldays addObject:@"thursday"];
	[ldays addObject:@"friday"];
	[ldays addObject:@"saturday"];
	[ldays addObject:@"sunday"];
	
	var lmonths = [[CPArray alloc] init];
	[lmonths addObject:@"january"];
	[lmonths addObject:@"february"];
	[lmonths addObject:@"march"];
	[lmonths addObject:@"april"];
	[lmonths addObject:@"may"];
	[lmonths addObject:@"june"];
	[lmonths addObject:@"july"];
	[lmonths addObject:@"august"];
	[lmonths addObject:@"september"];
	[lmonths addObject:@"october"];
	[lmonths addObject:@"november"];
	[lmonths addObject:@"december"];
					
	var today = new Date();
	var daysInMonth = 32 - new Date(today.getYear() + 1900, today.getMonth(), 32).getDate();	
	var now = new Date()
	var tmpDate = new Date();

	var i = tmpDate.getTime() + (86400000); /* Tellen er 1 dag bij */
	tmpDate.setTime(i);
	var tomorrow = new Date();
	tomorrow.setFullYear(tmpDate.getYear()+1900, tmpDate.getMonth(), tmpDate.getDate());
	tomorrow.setUTCHours(0);
	tomorrow.setUTCMinutes(0);
	tomorrow.setUTCSeconds(0);
	tomorrow.setUTCMilliseconds(0);

	var interv = ((tomorrow.getTime() - now.getTime())/1000);
	[CPTimer scheduledTimerWithTimeInterval:interv target:self	selector:@selector(loadData)  userInfo:NULL  repeats:NO];
	
	var dateField = [[CPTextField alloc] initWithFrame:CGRectMake(05,05,240,30)];
	[dateField setBezeled:NO];
	[dateField setBezelStyle:CPTextFieldSquareBezel];
	[dateField setBordered:NO];
	[dateField setEditable:NO];
	
	var str = "";
	if (today.getDay() == 0) str = [ldays objectAtIndex:6];
	else str = [ldays objectAtIndex:today.getDay()-1];
	
	str = str + " " + today.getDate();
	str = str + " " + [lmonths objectAtIndex:today.getMonth()];
	str = str + " " + (today.getYear() + 1900);
	[dateField setStringValue:str];
	[dateField setTextColor:[CPColor blackColor]];
	[dateField setFont:[CPFont boldSystemFontOfSize:13]];
	[dateField setAlignment:CPCenterTextAlignment];
	[self addSubview:dateField];
	
	var i = 0;
	for (i = 0; i < 7; i++) {
		var dayOfWeek = [[CPTextField alloc] initWithFrame:CGRectMake(20 + i*30,30,30,20)];
		[dayOfWeek setBezeled:NO];
		[dayOfWeek setBezelStyle:CPTextFieldSquareBezel];
		[dayOfWeek setBordered:NO];
		[dayOfWeek setEditable:NO];
		[dayOfWeek setStringValue:[sdays objectAtIndex:i]];
		[dayOfWeek setTextColor:[CPColor blackColor]];
		[dayOfWeek setFont:[CPFont boldSystemFontOfSize:11]];
		[dayOfWeek setAlignment:CPCenterTextAlignment];
		[self addSubview:dayOfWeek];
	}

	var y = 50;

	for (i = 1; i <= daysInMonth; i++) {
		var nu = new Date();
		nu.setFullYear(today.getYear() + 1900, today.getMonth(),i);
		
		var dayPos = nu.getDay() - 1;
		if (dayPos == -1) dayPos = 6; //sunday
					
		var dayOfWeek = [[CPTextField alloc] initWithFrame:CGRectMake(22 + dayPos*30,y,26,20)];
		[dayOfWeek setBezeled:NO];
		[dayOfWeek setBezelStyle:CPTextFieldSquareBezel];
		[dayOfWeek setBordered:NO];
		[dayOfWeek setEditable:NO];
		[dayOfWeek setStringValue:i];
		[dayOfWeek setTextColor:[CPColor blackColor]];
		[dayOfWeek setFont:[CPFont boldSystemFontOfSize:11]];
		[dayOfWeek setAlignment:CPCenterTextAlignment];
		
		if (today.getDate() == i) [dayOfWeek setBackgroundColor:[CPColor grayColor]];
		
		[self addSubview:dayOfWeek];
		
		if (dayPos == 6) y = y + 20;
	}	
}
@end

