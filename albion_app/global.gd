extends Node

const language = "PT-BR"

const name_tag = "LocalizedNames"
const desc_tag = "LocalizedDescriptions"
const uniq_tag = "UniqueName"
const dict_tiers = {"Todos":"T",
					"T1":"T1",
					"T2":"T2",
					"T3":"T3",
					"T4":"T4",
					"T5":"T5",
					"T6":"T6",
					"T7":"T7",
					"T8":"T8"}
const dict_levels = {"Todos":"T",
					"Nv 0":"0",
					"Nv 1":"@1",
					"Nv 2":"@2",
					"Nv 3":"@3"}
const colors = {1:"a9a7a4",
				2:"9b968f",
				3:"7fad8a",
				4:"5791a5",
				5:"bd6464",
				6:"c49036",
				7:"d5d34b",
				8:"ffffff"}
const tier_roman = {1: "I",
					2: "II",
					3: "III",
					4: "IV",
					5: "V",
					6: "VI",
					7: "VII",
					8: "VIII"}
					
const URL_PRICES = "https://www.albion-online-data.com/api/v1/stats/Prices/"
	
	
func number_format(val, _decimals = 0, _dec_point = ".", _thousands_sep = ","):
  var number = float(val)

  if(!_dec_point || !_thousands_sep):
    _dec_point = '.'
    _thousands_sep = ','
  
  var roundedNumber = str(round( abs( number ) * float('1e' + str(_decimals)) ))
  var numbersString = roundedNumber
  var decimalsString = ""
  if(_decimals > 0):
    numbersString = roundedNumber.left(roundedNumber.length()-_decimals)
    decimalsString = roundedNumber.right(roundedNumber.length()-_decimals)
    
  var formattedNumber = ""
  
  while(numbersString.length() > 3):
    formattedNumber += _thousands_sep + numbersString.right(numbersString.length()-3)
    numbersString = numbersString.substr(0, numbersString.length()-3);
  
  var ret = ""
  if(number < 0):
    ret += "-"
  ret += numbersString + formattedNumber
  if(decimalsString != ""):
    ret += (_dec_point + decimalsString)
    
  return ret