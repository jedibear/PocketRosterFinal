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
    

/****************************
 *                          *
 *      Club Sports         *
 *                          *
 ****************************
 */

    
//club
#define mensRugbyStartingURL   @"http://athletics.bowdoin.edu/sports/mrugby/index";
#endif
