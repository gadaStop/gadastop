//Do not use Global variable as you can
//write the function name and find it by command-f or control-f
//readText
//indexText
//hexChange
//messageDigest

String[] readText(BufferedReader reader) {
  
  int i=0;
  int readableCache=1;
  String[] readCache = new String[20];
  
  while (readableCache==1) {

    try {
      readCache[i] = reader.readLine();
    } 
    catch (IOException e) {
      e.printStackTrace();
      readCache[i] = null;
    }
    if (readCache[i] == null) readableCache=0;
    i++;
  }

  while (readCache[i]!=null) {
    String indexTextCache[] = split(readCache[i], ":");
    readCache[i]=trim(indexTextCache[1]);
    i++;
  }
  
  return readCache;
}


//change byte[] to string, for sha/aes
String hexChange(byte[] message) {
  String messageString="";
  for (int i=0; i<message.length; i++) messageString+=(hex(message[i], 2));
  messageString = messageString.toLowerCase();
  return messageString;
}

//use algoritm as md5, SHA-256
byte[] messageDigest(String message, String algorithm) {
  try {
    java.security.MessageDigest md = java.security.MessageDigest.getInstance(algorithm);
    md.update(message.getBytes());
    return md.digest();
  } 
  catch(java.security.NoSuchAlgorithmException e) {
    return null;
  }
}

void connectServer(Client myClient, String ip, int port) {
  myClient = new Client(this, ip, port);
}

void sendServer(String messageSend, Client myClient) {
  myClient.write(messageSend+":"+hexChange(messageDigest(messageSend, "md5")).substring(0,4)+"||");
}

//for OS X, using native exit 'command-q'
void ThinkDifferent() {
  /*
  log.flush();
  log.close();
  */
  exit();
}