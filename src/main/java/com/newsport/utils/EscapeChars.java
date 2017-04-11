package com.newsport.utils;

import java.text.CharacterIterator;
import java.text.StringCharacterIterator;

public class EscapeChars {
	 public static String forXML(String aText){
		    final StringBuilder result = new StringBuilder();
		    final StringCharacterIterator iterator = new StringCharacterIterator(aText);
		    char character =  iterator.current();
		    while (character != CharacterIterator.DONE ){
		      if (character == '<') {
		        result.append("&lt;");
		      }
		      else if (character == '>') {
		        result.append("&gt;");
		      }
		      else if (character == '\"') {
		        result.append("&quot;");
		      }
		      else if (character == '\'') {
		        result.append("&#039;");
		      }
		      else if (character == '&') {
		         result.append("&amp;");
		      }
		      else {
		        result.append(character);
		      }
		      character = iterator.next();
		    }
		    return result.toString();
		  }
}
