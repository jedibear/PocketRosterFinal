/*
 *  teams.h
 *  Pocket Roster
 *
 *  Created by James P. Garvey on 11/16/13.
 *  Copyright (c) 2013 Pocket Roster. All rights reserved.
 *
 *
 *  this file contains the definitions for the starting conditions for
 *  all of the teams in the program
 *
 */

#ifndef Pocket_Roster_teams_h
#define Pocket_Roster_teams_h


/************************
 *                      *
 *  Mens Varsity Sports *
 *                      *
 ************************
 */

//mens varsity sport URLS
#define mensSoccerStartingURL   @"http://athletics.bowdoin.edu/sports/msoc/index";
#define footballStartingURL   @"http://athletics.bowdoin.edu/sports/fball/index";
#define mensXCountryStartingURL   @"http://athletics.bowdoin.edu/sports/mxc/index";
#define mensGolfStartingURL   @"http://athletics.bowdoin.edu/sports/mgolf/index";
#define mensSailingStartingURL   @"http://athletics.bowdoin.edu/sports/sailing/index";
#define mensTennisStartingURL   @"http://athletics.bowdoin.edu/sports/mten/index";
#define mensSwimmingStartingURL   @"http://athletics.bowdoin.edu/sports/mswimdive/index";
#define mensIceHockeyStartingURL   @"http://athletics.bowdoin.edu/sports/mice/index";
#define mensBasketballStartingURL   @"http://athletics.bowdoin.edu/sports/mbkb/index";
#define mensSquashStartingURL   @"http://athletics.bowdoin.edu/sports/msquash/index";
#define mensLacrosseStartingURL   @"http://athletics.bowdoin.edu/sports/mlax/index";
#define mensTrackStartingURL   @"http://athletics.bowdoin.edu/sports/mtrack/index";
#define baseballStartingURL   @"http://athletics.bowdoin.edu/sports/bsb/index";

//mens longForm definitions
#define mensSoccerLongForm   YES;
#define footballLongForm   YES;
#define mensXCountryLongForm   NO;
#define mensGolfLongForm   NO;
#define mensSailingLongForm   NO;
#define mensTennisLongForm   YES;
#define mensSwimmingLongForm   NO;
#define mensIceHockeyLongForm   YES;
#define mensBasketballLongForm   YES;
#define mensTrackLongForm   NO;
#define mensSquashLongForm   YES;
#define mensLacrosseLongForm   YES;
#define baseballLongForm   YES;

//mens teamName definitions
#define mensSoccerName   @"Soccer";
#define footballName   @"Football";
#define mensXCountryName   @"Cross Country";
#define mensGolfName   @"Golf";
#define mensSailingName   @"Sailing";
#define mensTennisName   @"Tennis";
#define mensSwimmingName   @"Swimming & Diving";
#define mensIceHockeyName   @"Hockey";
#define mensBasketballName   @"Basketball";
#define mensIndoorTrackName   @"Indoor Track";
#define mensTrackName   @"Track";
#define mensSquashName   @"Squash";
#define mensLacrosseName   @"Lacrosse";
#define baseballName   @"Baseball";

//mens backgroundImagePath definitions
#define mensSoccerBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"MSoccer" ofType:@"jpg"]
#define footballBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"MFootball" ofType:@"jpg"]
#define mensXCountryBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"MCrossCountry" ofType:@"jpg"]
#define mensGolfBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"MGolf" ofType:@"jpg"]
#define mensSailingBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"MSailing" ofType:@"jpg"]
#define mensTennisBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"MTennis" ofType:@"jpg"]
#define mensSwimmingBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"MSwimming" ofType:@"jpg"]
#define mensIceHockeyBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"MHockey" ofType:@"jpg"]
#define mensSquashBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"MSquash" ofType:@"jpg"]
#define mensLacrosseBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"BLax" ofType:@"jpg"]
#define mensBasketballBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"MBasketball" ofType:@"jpg"]
#define mensTrackBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"MTrack" ofType:@"jpg"]
#define baseballBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"MBaseball" ofType:@"jpg"]

//mens backgroundImagePath For Schedule definitions
#define mensSoccerBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"MSoccerSchedule" ofType:@"jpg"]
#define footballBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"MFootballSchedule" ofType:@"jpg"]
#define mensXCountryBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"MCrossCountrySchedule" ofType:@"jpg"]
#define mensGolfBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"MGolfSchedule" ofType:@"jpg"]
#define mensSailingBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"MSailingSchedule" ofType:@"jpg"]
#define mensTennisBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"MTennisSchedule" ofType:@"jpg"]
#define mensSwimmingBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"MSwimmingSchedule" ofType:@"jpg"]
#define mensIceHockeyBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"MHockeySchedule" ofType:@"jpg"]
#define mensSquashBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"MSquashSchedule" ofType:@"jpg"]
#define mensLacrosseBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"BLaxSchedule" ofType:@"jpg"]
#define mensBasketballBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"MBasketballSchedule" ofType:@"jpg"]
#define mensTrackBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"MTrackSchedule" ofType:@"jpg"]
#define baseballBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"MBaseballSchedule" ofType:@"jpg"]

//mens backgroundImagePath For Photo TableView definitions
#define mensSoccerBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"MSoccerPhoto" ofType:@"jpg"]
#define footballBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"MFootballPhoto" ofType:@"jpg"]
#define mensXCountryBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"MCrossCountryPhoto" ofType:@"jpg"]
#define mensGolfBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"MGolfPhoto" ofType:@"jpg"]
#define mensSailingBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"MSailingPhoto" ofType:@"jpg"]
#define mensTennisBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"MTennisPhoto" ofType:@"jpg"]
#define mensSwimmingBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"MSwimmingPhoto" ofType:@"jpg"]
#define mensIceHockeyBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"MHockeyPhoto" ofType:@"jpg"]
#define mensSquashBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"MSquashPhoto" ofType:@"jpg"]
#define mensLacrosseBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"BLaxPhoto" ofType:@"jpg"]
#define mensBasketballBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"MBasketballPhoto" ofType:@"jpg"]
#define mensTrackBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"MTrackPhoto" ofType:@"jpg"]
#define baseballBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"MBaseballPhoto" ofType:@"jpg"]



/****************************
 *                          *
 *  Womens Varsity Sports   *
 *                          *
 ****************************
 */

    
//womens varsity sport URLS
#define womensRugbyStartingURL  @"http://athletics.bowdoin.edu/sports/wrugby/index";
#define womensSoccerStartingURL   @"http://athletics.bowdoin.edu/sports/wsoc/index";
#define womensXCountryStartingURL   @"http://athletics.bowdoin.edu/sports/wxc/index";
#define womensGolfStartingURL   @"http://athletics.bowdoin.edu/sports/wgolf/index";
#define womensSailingStartingURL   @"http://athletics.bowdoin.edu/sports/sailing/index";
#define womensTennisStartingURL   @"http://athletics.bowdoin.edu/sports/wten/index";
#define fieldhockeyStartingURL   @"http://athletics.bowdoin.edu/sports/fh/index";
#define womensVolleyballStartingURL   @"http://athletics.bowdoin.edu/sports/wvball/index";
#define womensSwimmingStartingURL   @"http://athletics.bowdoin.edu/sports/wswimdive/index";
#define womensIceHockeyStartingURL   @"http://athletics.bowdoin.edu/sports/wice/index";
#define womensBasketballStartingURL   @"http://athletics.bowdoin.edu/sports/wbkb/index";
#define womensSquashStartingURL   @"http://athletics.bowdoin.edu/sports/wsquash/index";
#define womensNordicStartingURL   @"http://athletics.bowdoin.edu/sports/nordicski/index";
#define womensLacrosseStartingURL   @"http://athletics.bowdoin.edu/sports/wlax/index";
#define womensTrackStartingURL    @"http://athletics.bowdoin.edu/sports/wtrack/index";
#define softballStartingURL    @"http://athletics.bowdoin.edu/sports/sball/index";

//womens longForm definitions
#define womensSoccerLongForm   YES;
#define womensRugbyLongForm   NO;
#define womensXCountryLongForm   NO;
#define womensGolfLongForm   NO;
#define womensSailingLongForm   NO;
#define womensTennisLongForm   YES;
#define fieldhockeyLongForm   YES;
#define womensVolleyballLongForm   YES;
#define womensSwimmingLongForm   NO;
#define womensIceHockeyLongForm   YES;
#define womensBasketballLongForm   YES;
#define womensTrackLongForm   NO;
#define womensSquashLongForm   YES;
#define womensNordicSkiing   NO;
#define womensLacrosseLongForm   YES;
#define softballLongForm   YES;

//womens teamName definitions
#define womensSoccerName   @"Soccer";
#define womensRugbyName   @"Rugby";
#define womensXCountryName   @"Cross Country";
#define womensGolfName   @"Golf";
#define fieldhockeyName   @"Field Hockey";
#define womensVolleyballName   @"Volleyball";
#define womensSailingName   @"Sailing";
#define womensTennisName   @"Tennis";
#define womensSwimmingName   @"Swimming & Diving";
#define womensIceHockeyName   @"Hockey";
#define womensBasketballName   @"Basketball";
#define womensIndoorTrackName   @"Indoor Track";
#define womensNordicSkiingName   @"Nordic Skiing";
#define womensTrackName   @"Track";
#define womensSquashName   @"Squash";
#define womensLacrosseName   @"Lacrosse";
#define softballName   @"Softball";

//womens backgroundImagePath definitions
#define womensSoccerBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"WSoccer" ofType:@"jpg"]
#define womensRugbyBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"WRugby" ofType:@"jpg"]
#define fieldHockeyBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"WFieldHockey" ofType:@"jpg"]
#define womensVolleyballBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"WRugby" ofType:@"jpg"]
#define womensXCountryBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"WCrossCountry" ofType:@"jpg"]
#define womensGolfBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"WGolf" ofType:@"jpg"]
#define womensSailingBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"WSailing" ofType:@"jpg"]
#define womensTennisBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"WTennis" ofType:@"jpg"]
#define womensSwimmingBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"WSwimming" ofType:@"jpg"]
#define womensIceHockeyBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"WHockey" ofType:@"jpg"]
#define womensSquashBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"WSquash" ofType:@"jpg"]
#define womensLacrosseBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"WLax" ofType:@"jpg"]
#define womensBasketballBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"WBasketball" ofType:@"jpg"]
#define womensTrackBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"WTrack" ofType:@"jpg"]
#define softballBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"WSoftball" ofType:@"jpg"]
#define womensNordicSkiingBackgroundImagePath [[NSBundle mainBundle]pathForResource:@"WSkiing" ofType:@"jpg"]

//womens backgroundImagePath For Schedule Table View definitions
#define womensSoccerBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"WSoccerSchedule" ofType:@"jpg"]
#define womensRugbyBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"WRugbySchedule" ofType:@"jpg"]
#define fieldHockeyBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"WFieldHockeySchedule" ofType:@"jpg"]
#define womensVolleyballBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"WRugbySchedule" ofType:@"jpg"]
#define womensXCountryBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"WCrossCountrySchedule" ofType:@"jpg"]
#define womensGolfBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"WGolfSchedule" ofType:@"jpg"]
#define womensSailingBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"WSailingSchedule" ofType:@"jpg"]
#define womensTennisBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"WTennisSchedule" ofType:@"jpg"]
#define womensSwimmingBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"WSwimmingSchedule" ofType:@"jpg"]
#define womensIceHockeyBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"WHockeySchedule" ofType:@"jpg"]
#define womensSquashBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"WSquashSchedule" ofType:@"jpg"]
#define womensLacrosseBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"WLaxSchedule" ofType:@"jpg"]
#define womensBasketballBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"WBasketballSchedule" ofType:@"jpg"]
#define womensTrackBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"WTrackSchedule" ofType:@"jpg"]
#define softballBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"WSoftballSchedule" ofType:@"jpg"]
#define womensNordicSkiingBackgroundScheduleImagePath [[NSBundle mainBundle]pathForResource:@"WSkiingSchedule" ofType:@"jpg"]

//womens backgroundImagePath for Photo Table View definitions
#define womensSoccerBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"WSoccerPhoto" ofType:@"jpg"]
#define womensRugbyBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"WRugbyPhoto" ofType:@"jpg"]
#define fieldHockeyBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"WFieldHockeyPhoto" ofType:@"jpg"]
#define womensVolleyballBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"WRugbyPhoto" ofType:@"jpg"]
#define womensXCountryBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"WCrossCountryPhoto" ofType:@"jpg"]
#define womensGolfBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"WGolfPhoto" ofType:@"jpg"]
#define womensSailingBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"WSailingPhoto" ofType:@"jpg"]
#define womensTennisBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"WTennisPhoto" ofType:@"jpg"]
#define womensSwimmingBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"WSwimmingPhoto" ofType:@"jpg"]
#define womensIceHockeyBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"WHockeyPhoto" ofType:@"jpg"]
#define womensSquashBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"WSquashPhoto" ofType:@"jpg"]
#define womensLacrosseBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"WLaxPhoto" ofType:@"jpg"]
#define womensBasketballBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"WBasketballPhoto" ofType:@"jpg"]
#define womensTrackBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"WTrackPhoto" ofType:@"jpg"]
#define softballBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"WSoftballPhoto" ofType:@"jpg"]
#define womensNordicSkiingBackgroundPhotoImagePath [[NSBundle mainBundle]pathForResource:@"WSkiingPhoto" ofType:@"jpg"]


/****************************
 *                          *
 *      Club Sports         *
 *                          *
 ****************************
 */

    
//club
#define mensRugbyStartingURL   @"http://athletics.bowdoin.edu/sports/mrugby/2013-14/schedule";
#define womensCrewStartingURL   @"http://athletics.bowdoin.edu/sports/rowing/2013-14/schedule";
#define mensCrewStartingURL   @"http://athletics.bowdoin.edu/sports/rowing/2013-14/schedule";
//#define womensWaterPoloStartingURL   @"http://athletics.bowdoin.edu/sports/mrugby/index";
//#define mensWaterPoloStartingURL   @"http://athletics.bowdoin.edu/sports/mrugby/index";




#endif
