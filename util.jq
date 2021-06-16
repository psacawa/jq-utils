# def rec_type:
#   if .|type=="object" then
#     .|with_entries({key: .key, value: .value|rec_type})
#   elif .|type=="array" then 
#     map (.|rec_type)
#   else
#     .|type
#   end;



# wyemituj posortowaną listę wartości wraz z liczbą ich pojawień 
# TODO 15/06/20 psacawa: wdróż zachowane $path
def wyst($path): 
    group_by(.)
  | map({key: .[0], value: length})
  | sort_by(.value)
  | reverse
  | from_entries;

def wyst: 
  wyst(.);

def rg_key(pattern; flags): 
  with_entries(select(.key| test(pattern; flags)));

def rg_key(pattern): 
  rg_key(pattern; "");
