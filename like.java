import java.util.*;

public class like {
	public static void main(String args[])
	{
		System.out.println(likeString(args[0], args[1]));
	}

	public static ArrayList<String> likeString(String str1, String str2)
	{
		System.out.println(str1 + " , " + str2);
		if(str1.length() == 0)
		{
			if( str2.length() == 0 ) {
				ArrayList<String> arr =  new ArrayList<String> ();
				arr.add("T");
				arr.add("Nil");
				System.out.println(arr);
				return  arr;
			}
		} else if(str2.length() > 0) {
			if(str1.substring(0,1).equals("_") || str1.substring(0,1).equals(str2.substring(0,1))) {
				return likeString( str1.substring(1,str1.length()), str2.substring(1,str2.length()));
			} else if(str1.substring(0,1).equals("%")) {
					ArrayList<String> recursed = likeString( str1.substring(1,str1.length()), str2 );
					if(recursed.get(0).equals("T")) {
						System.out.println(recursed);
						return recursed;
					} else {
						recursed = likeString(str1, str2.substring(1,str2.length()));
						recursed.set(1, str2.substring(0,1) + recursed.get(1));
						System.out.println(recursed);
						return recursed;
					}
			}

		} else if (str1.substring(0,1).equals("%") && str1.length() == 1) {
				ArrayList<String> arr =  new ArrayList<String> ();
				arr.add("T");
				arr.add("Nil");
				System.out.println(arr);
				return  arr;
		}
		ArrayList<String> arr =  new ArrayList<String>();
		arr.add("Nil");
		arr.add("Nil");
		System.out.println(arr);
		return arr;
	}

}
