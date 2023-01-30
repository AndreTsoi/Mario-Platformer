boolean hitGroundPlayer() {
  ArrayList<FContact> contactList = player.getContacts();
  if (contactList.size() > 0) {
    
    return true;
    
  }
  return false;
  
  
}

boolean hitGroundThwomp(FThwomp f) {
  ArrayList<FContact> contactList = f.getContacts();
  for (int i = 0; i < contactList.size(); i++) {
    if (contactList.size() > 0) {
   FContact t = contactList.get(i); 
   if (!t.contains("player")) {
      return true; 
   }
  }
  }
return false;
}
