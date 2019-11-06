
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class FirebaseDLUtilities{

  static Future<String> createDynamicLinkWithParams(String category) async {
    final DynamicLinkParameters parameters =
    DynamicLinkParameters(
      uriPrefix: 'https://exploreflutter.page.link',
      link: Uri.parse('https://exploreflutter.page.link/'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.explore_flutter',
      ),
      iosParameters: IosParameters(
        bundleId: 'com.example.explore-flutter',
        ipadBundleId: 'com.example.explore-flutter',
      ),
    );

    final Uri longUrl = await parameters.buildUrl();
    final ShortDynamicLink shortenedLink = await DynamicLinkParameters.shortenUrl(
      longUrl,
      DynamicLinkParametersOptions(shortDynamicLinkPathLength:ShortDynamicLinkPathLength.unguessable),
    );
    final Uri shortUrl = shortenedLink.shortUrl;
    print(shortUrl.toString());
    return shortUrl.toString();
  }

  static Future<void> retrieveDynamicLink() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
          final Uri deepLink = dynamicLink?.link;
          if (deepLink != null) {
            String phone = deepLink.queryParameters['phone'];
            String name = deepLink.queryParameters['name'];
            print(deepLink.queryParametersAll);
            print("Phone number: "+phone);
            print("Name: "+name);
          }
        },
        onError: (OnLinkErrorException e) async {
          print('onLinkError');
          print(e.message);
        }
    );

    final PendingDynamicLinkData data = await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;
    if (deepLink != null) {
      String phone = deepLink.queryParameters['phone'];
      String name = deepLink.queryParameters['name'];
      print(deepLink.queryParametersAll);
      print("Phone number: "+phone);
      print("Name: "+name);

    }
  }
}