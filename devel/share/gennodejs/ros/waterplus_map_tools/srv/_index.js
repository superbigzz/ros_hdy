
"use strict";

let SaveWaypoints = require('./SaveWaypoints.js')
let GetWaypointByName = require('./GetWaypointByName.js')
let AddNewWaypoint = require('./AddNewWaypoint.js')
let GetNumOfWaypoints = require('./GetNumOfWaypoints.js')
let GetWaypointByIndex = require('./GetWaypointByIndex.js')

module.exports = {
  SaveWaypoints: SaveWaypoints,
  GetWaypointByName: GetWaypointByName,
  AddNewWaypoint: AddNewWaypoint,
  GetNumOfWaypoints: GetNumOfWaypoints,
  GetWaypointByIndex: GetWaypointByIndex,
};
