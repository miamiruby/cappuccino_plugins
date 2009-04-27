##
# Origional Author: CodingMammoth
# url: http://github.com/CodingMammoth
# irc.freenode.org
# #cappuccino
##

@implementation CalendarView: CPView
{
}

-(id)init {
	self = [super initWithFrame:CGRectMake(0, 0, 200, 200)];
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
	[dateField setTextColor:[CPColor whiteColor]];
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
		[dayOfWeek setTextColor:[CPColor whiteColor]];
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
		[dayOfWeek setTextColor:[CPColor whiteColor]];
		[dayOfWeek setFont:[CPFont boldSystemFontOfSize:11]];
		[dayOfWeek setAlignment:CPCenterTextAlignment];
		
		if (today.getDate() == i) [dayOfWeek setBackgroundColor:[CPColor grayColor]];
		
		[self addSubview:dayOfWeek];
		
		if (dayPos == 6) y = y + 20;
	}	
}
@end
