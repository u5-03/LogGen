// Ref: https://kuwk.jp/blog/spreadsheet2json/
// Display dialog for downloading.
function toJSON() {
  // load dialog template
  var dl_html = HtmlService.createTemplateFromFile("dl_dialog").evaluate();

  // display dialog
  SpreadsheetApp.getUi().showModalDialog(dl_html, "Download json file");
}

// fetch data
function getData() {
  var eventData = getEventSheetData();
  var json = {
    "eventData": eventData,
  }
  // format as json format and return
  return JSON.stringify(json, null, '\t'); 
}

function getEventSheetData() {
    // sheet to fetch data（specify sheet 'View'）
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName('Event');

  // Set max counts of row(horizontal axis) and column(vertical axis) to variable
  var maxRow = sheet.getLastRow();
  var maxColumn = sheet.getLastColumn();

  // key for JSON
  var keys = [];

  // array to contain data
  var data = [];

  // column number to start getting values
  var startColumn = 2
  // row number to start getting values
  var startRow = 3

  // fetch key name in 'startColumn' row from 'startColumn'
  for (var x = startColumn; x <= maxColumn; x++) {
    keys.push(sheet.getRange(startRow, x).getValue());
  }

  // fetch data
  // fetch data from 'startRow' + 1 row
  for (var y = startRow + 1; y <= maxRow; y++) {
    var json = {};
    var parameters = [];
    for (var x = startColumn; x <= maxColumn; x++) {
      // Parameter variables
      if ([6, 7, 8, 9, 10].includes(x)) {
        parameters.push({
          "key": keys[x - startColumn],
          "shouldShow": sheet.getRange(y, x).getValue().toString() != ""
        });
      } else {
        json[keys[x - startColumn]] = sheet.getRange(y, x).getValue();
      }
    }
    json["variables"] = parameters;
    // set data
    data.push(json);
  }
  return data;
}

// execute when reading spreadsheet
function onOpen() {
  // add 'Output JSON' menu to menubar
  var spreadsheet = SpreadsheetApp.getActiveSpreadsheet();
  var entries = [
  {
    name : "Output json",
    functionName : "toJSON"
  }
  ];
  spreadsheet.addMenu("JSON", entries);
};