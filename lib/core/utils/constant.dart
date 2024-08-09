// storing all constants so if i want to change
// so i didn't have to change from all file that were using the value
// and to keep things organized

class Constants {

  // api url
  static const baseURL = "https://api.themoviedb.org/3/";
  static const imageURL = "https://image.tmdb.org/t/p/original/";
  static const genreURL = "https://api.themoviedb.org/3/genre/movie/list?language=en";
  
  // api token
  // never hardcoded any private or personal infomation
  static const accessToken = String.fromEnvironment("ACCESS_TOKEN");
  static const accountId = String.fromEnvironment("ACCOUNT_ID");

  // local storage constants
  static const watchList = "watchList";
  static const favorite = "favorite";
  static const image = "images";
  static const genre = "genres";
}