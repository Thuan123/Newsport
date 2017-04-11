package com.newsport.utils;

import java.util.Comparator;

public class SortComparator implements Comparator<Sort> {

	@Override
	public int compare(Sort o1, Sort o2) {
		// TODO Auto-generated method stub
		int count1 = o1.getCount();
		int count2 = o2.getCount();
		if (count1 < count2) {
			return 1;
		} else if (count1 == count2) {
			return 0;
		} else {
			return -1;
		}
	}
}
