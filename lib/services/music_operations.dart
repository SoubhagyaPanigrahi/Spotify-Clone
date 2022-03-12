import 'package:spotifyclone/models/music.dart';

class MusicOperations {
  MusicOperations._() {}
  static List<Music> getMusic() {
    return <Music>[
      Music(
          'September',
          'https://i.ytimg.com/vi/wqL9kT_QtrA/maxresdefault.jpg',
          "I'll start a Family with u",
          "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/4b/16/d9/4b16d9a0-760f-de0c-73ec-a889795832b0/mzaf_16512218297215635528.plus.aac.p.m4a"),
      Music(
          'Leave Before You Love Me',
          'https://upload.wikimedia.org/wikipedia/en/c/ca/Marshmello_-_Leave_Before_You_Love_Me.png',
          "Mess with your heart",
          "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview126/v4/0f/d7/b4/0fd7b484-b9f8-ae82-9055-5210b25ef13a/mzaf_8385020090715269162.plus.aac.p.m4a"),
      Music(
          'Chand Baaliyan',
          'https://djyoungstar.me/siteuploads/thumb/sft6/2879_4.jpg',
          "Mai toh tere peeche ho liya",
          "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview116/v4/3d/59/d2/3d59d218-6ff4-f77c-22bc-9eceba7fdccc/mzaf_4374757629058758941.plus.aac.p.m4a"),
      Music(
          'Kya Baat Ay',
          'https://c-cl.cdn.smule.com/rs-s89/sing_google/performance/cover/db/b1/87811448-0323-4ca5-8f18-26eed925d9d2.jpg',
          "Kya Baat",
          "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/bc/0f/1b/bc0f1b57-3458-72bc-c4a4-932063114ee6/mzaf_3585865851567202465.plus.aac.p.m4a"),
    ];
  }
}
