
class ImageService {
  List<String> list = [];

  List<String> getImages()  {
    int i = 1;
    while(i<20){
      list.add("https://picsum.photos/700/1280/?blur=1?image=$i");
      i++;
    }
    return list;
  }
}
