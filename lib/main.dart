import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  late WebViewPlusController _controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatGPT',
      home: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   title: const Text('Material App Bar'),
          // ),
          body: WebViewPlus(
            userAgent:
                "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36",
            // userAgent:
            //     "Mozilla/5.0 (Linux; Android 7.0; SM-G930V Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36",
            javascriptMode: JavascriptMode.unrestricted,

            onWebViewCreated: (controller) {
              _controller = controller;
              _controller.loadUrl('https://chat.openai.com/chat', headers: {
                // "accept-encoding": "gzip, deflate, br",
                // "accept-language": "es-419,es;q=0.9",
                // "cookie":
                //     r'_ga=GA1.2.1752491283.1672844500; intercom-device-id-dgkjq2bp=e53cb2db-8b3e-4990-8201-f104a4038f13; cf_clearance=oCNE4.AScosHI_GiFXeDSS0MxBx2TkD.IHYqzLJcyRY-1673581609-0-1-d737b25f.e00db4dc.c3d8ffbb-160; cf_clearance=hpgfrFvUfktF0JiG51TOgGYaNNK9.O7r6kWdwa308qQ-1675132234-0-1-f3b5e369.2f93a314.56a82b2e-160; __Host-next-auth.csrf-token=455eb0f6053cb762c376a0d2fe8908d6370aa73da2d03f0fa0c12b8841fc2cf2|b8b0d321a545e11829273e29e3d110b2843deb7163a0b322f9ebb91cd418a02e; __Secure-next-auth.callback-url=https://chat.openai.com; _cfuvid=6Yj9NNU3QgHfz1MyQtXxtNCI4vko6TunrzzlmAvmyUU-1675132234402-0-604800000; mp_d7d7628de9d5e6160010b84db960a7ee_mixpanel={"distinct_id": "user-c0LBpaZoQiV1fz7wqUPuA5wz","$device_id": "1857d4db096ca6-0edf9983b198e-26021151-1fa400-1857d4db09778b","$search_engine": "google","$initial_referrer": "https://accounts.google.com/","$initial_referring_domain": "accounts.google.com","$user_id": "user-c0LBpaZoQiV1fz7wqUPuA5wz"}; __Secure-next-auth.session-token=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..jYDfIsGBQ54Ffl58.V0zK0jOPDrxf78l68dkYt6lBrokmBir0V5knwPYAu1xkgpF6xYlPZIxcE7GOAYtRk-0sytFU_Bx-SYHZQx-gSkIQoWY57IXxkQErhnr2c8xFLZwrT2CLyyt5GdhP4T-2C7t1FFuSLvwmt9I4EtEtHT6u5bzWssijHA-IVl0h8_naShwH607ExbAannBQG0BIqmoumlNTqmk2NCM0uY_mPOSgGhh90wKI5bYGeCQPwUbLq3g_Rz3En_4xMtDfVnXMoh40wFf7KeDr0LzwJiPTyP-nCcF4UVJ6uIWEyCZ6LelyuyKNv9ejy3KYiohkKPrDKmKmOLoxqfXUPnoIvRddjYg0vcMXYXuMGXoaE_LkHvXOaKjOdfyyrn_iWz31rw1BoU_tgVWZ9qF6LIVdRUswZnKs4F-9A79pfWgrMrEy2AlQZRO7QHDhvrvU3o89i-aoGUtF5bqfFQ1vhikTUDyeaOPPiyH-jkQxdnjjE6qxyVySgvELcGbVGCdSt37nYBdbp0wCrSkOyqh3tFeCYGkuw8VbCK7NrEY6sNua89UN_V-Fp93bL96MuZt_qrADafPpuyeTE_nVVNN0hx-Fp6_ptYlX-nVkTvPrZji-qbbHznG4YAozxdk1eBz1LhzXBNpdDA2EJL-rXxCUgYbwLNAPzAt3Erl-dRYeRiRvaGo63q7N4EiX4Va4gL9rp4_9O-Q6XGx0KbQx5hu9LbPeMeDvKjVdcXwdXCIjXQ10Evzb4NiWvjTIl2KAYlKoLPG45aGvgzCCQpltcSmZ9RboGj6-4QsfqMUJQ61ob5_r5Zb4B8A1F88ciM7q-p4uGwOxtFQX8eV4iCHw_-rJPVORUv8lcZ9hnDaV1xwkbXoPXU_0v9s3RBBkoTQbINc83jTnXO5cCMsxhg47ANNOJsgJH4y6ozCpX3zqUQ2jVk7hpqdtWUAE9FPrdm_GGnu-CakjwyjGMNQmPeGCMAq8jrnESkryOH0iXuGPSoYlSe-eu4MebUOMobYHvvTMnWFU4qXtvOWs5QXq6kdGw-aCONAwTm5bPFvgZ_C2i3mfkYPJAfPBuaihXSCTw6SPxYuiRJGZ-BgFahgsBH5mYjFKxJZTeuPU13rUMCAOxAQ2-HZCAJWLnCQWGA_jVoxVyVXqkKz5ih5uzQoyxl5QBYsLotyenocBqQWhDRrLvFvmdTmD0oBaRU8hHUIVU4pUFym6y_snp5oH2i2vrXQn2cJCVue4CVFjQuVQWq9pn3OmeUQF0k9GbSNC6U-QjxauMzCY-snX6bOQImSnhYD5GT-HsuF3I9f7VLn2Jrah3o6psqfjMM9UPixLMqQAdFqxQnXo9aTWvNPvCGZrdmE4lmAsfZvSjuD81XRPkimWXmzc3dLONuqKofKVvdWd8nxcSq1PLS6OhVanRh5_wEU_wd5vss9SoUcqhaek2HfpjCbImEJcJEjnbCTsNM_W5BhXmtXjXxDPNMuYTssssS5J1X74_wzr9oaXWxV4AzcMQR9ZTOkZX3mXGbxLf6SR-LhBMWN93s-RmQzC4Q5tOzTjGHez_xeKgDb-5fkwzM9nggbAkvgAuUOcN0gHiJIvhsXph00BbAbVqnurO72_chM5n8Zk32rIr5HM3K7TcIhaNP8kNm4ruP23TXEmjb3R5wlXiYTioNVMW3az_24_rxxk5Hv2-Wo1jPzlWYM-3hlnxg5ik9COPUIKowVRyNZ7JmaChBddQ24Fp1s5L8jfbHYRozMjQ2Pp-RmMoP7qoqnQOfyK5bRlVI4AE5vTf72ps-VfVNFskbdd2PiI6lZ1nGNvjhMCD9xlVdrOEpn4j_1Z8C_xSxfTA-AzASggbY1YucCwJ6ClI7ru69AjtZIRM-WA6f3_yKCj9YMK2pAheou4iuqxaQpmeddLmE0bSenKXGQ0miga7Od3YF-UOB1iBx9sSnnOWU_rczkydY0CiHih8vJP8pngp277JAzSqQnqWvPm03Ttp4okRcY0jaWBMUZfj4058XlbDe93LViCFLgN5A6KClVnOfcXwW7Zteb2oamP6-o5CO4ObxpuqN_vc5ygejo59a6i-KdQjo4XQfqHgLIzzx-At_KdgFWUepRoYSkH_wQCsQIWGhzfzhvZfxRm-4n6O2noQcWsUrfsXtHkTWaEE5ZFmY0aqCBbVK71GruFJY78ESREzB5FLEnKR8ylX1aGxS99bUWoi1MjJr5VsFzJ7rLZDcfTdAf9vwHfrdru5gRCMhc7RD8LVTUzegi83y0CQPziyUFXFiOTKpylOw5QU89Z-ydKsYi1TnkheqqnaKnBJubbeRMbCAcPBJI4NE8wrrfJPKA8oDwiL_Da23uxtkcPvLQX.2bvSf-2IpTJC_Ald0EdvhA; __cf_bm=cqYu5wRmLfu1Xu9DNnCND8Mv9gQV.Pae25mmD0rjYXM-1675139379-0-AVMyn7YLfscy7EkKGaRDqiMLs0o4afsn9RaYHNR5/9ZDY6xaMR8Geo5+cxHtCtgicLqMKePYezl8sRYOMM5DKko=',
              });
            },
            onPageFinished: (value) {
              _controller.webViewController.runJavascript("""
      // document.body.style.width = '400px';
      // document.body.style.height = '600px';
      var meta = document.createElement('meta');
      meta.name = "viewport";
      meta.content = "width=device-width,initial-scale=0.9";
      document.getElementsByTagName('head')[0].appendChild(meta);
              """);
            },
          ),
        ),
      ),
    );
  }
}
