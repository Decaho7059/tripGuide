'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "532a15e0184a208717549267a76135b4",
"assets/AssetManifest.bin.json": "3e7145d6ab485829731b54af9987277e",
"assets/AssetManifest.json": "acdd97b2f5b937a02cf7e382128539c9",
"assets/FontManifest.json": "f3ad4815fe0f2e26a7e1d83bf9aaee9d",
"assets/fonts/MaterialIcons-Regular.otf": "66fcf71f934b3ab6f972a24a0edb6810",
"assets/fonts/Poppins-SemiBold.ttf": "6f1520d107205975713ba09df778f93f",
"assets/images/assinie.jpg": "d3fa4e1ae51ac34a9c2669e0ce7850be",
"assets/images/avatar/boy.png": "ba2762f12e661ba475ea9635553b2b83",
"assets/images/avatar/gaara.png": "0f59099c280be55c386c884ab8ac068d",
"assets/images/avatar/girl.png": "acc9b99774ecb8c37ba168cd025587c2",
"assets/images/avatar/hinata.png": "e0209b193e6b1744f3e721df069af32c",
"assets/images/avatar/itachi.png": "36a4927f33e43491b7c5e7ff0228f7b3",
"assets/images/avatar/kurama.png": "b9ceba3f8118ff7aca906386d3a67f72",
"assets/images/avatar/madara.png": "e67ada123a4601ef0e36d766cbcafcd9",
"assets/images/avatar/nagato.png": "8fe949d29445f46ca58c53e1c402842b",
"assets/images/avatar/orochimaru.png": "7c3a50e08d26132c98649d7babc7dafb",
"assets/images/avatar/pain.png": "6184e43b01ddbcc7e47df31157923ae8",
"assets/images/filter.png": "e92bc6978f4e15ed6aa588497bf1a341",
"assets/images/newton.gif": "9272875ba226e7a56eac77a26088bcf9",
"assets/images/Pays/argentinaFlag.png": "1a0faba450709190ae728d67e34444bd",
"assets/images/Pays/australiaFlag.png": "0a9addfabe1b87243b56084ac6e0ee14",
"assets/images/Pays/austriaFlag.png": "3015ddf74e62951a7c8dc525701323c3",
"assets/images/Pays/brazilFlag.png": "09f610ed3b81c9be330300512a75fa56",
"assets/images/Pays/canadaFlag.png": "690c895952d06922d192dc15b91e087c",
"assets/images/Pays/civFlag.png": "26677a6953408685b97301fc3f258d22",
"assets/images/Pays/czechFlag.png": "4991c84e0408ff291d5bde6d7d04316f",
"assets/images/Pays/egyptFlag.png": "768ff456d57281d705169b28c2620eeb",
"assets/images/Pays/ethiopiaFlag.png": "6e1b21d8243ed55462e04625f1d5bc5c",
"assets/images/Pays/franceFlag.png": "56503190deeb3e8aebf9c50016a5fd52",
"assets/images/Pays/ghanaFlag.png": "d8523cfc506e4af6c6a68ee71f2fe115",
"assets/images/Pays/greeceFlag.png": "2dae2ccd0c8269dd4d762dd71dce0bb8",
"assets/images/Pays/indonesiaFlag.png": "1318901ec5e14fc70f3171a6a22324db",
"assets/images/Pays/italyFlag.png": "9d72a05e9cdd2a95a9d667f49287af70",
"assets/images/Pays/japanFlag.png": "626d5b026617072af383baeaf537a30b",
"assets/images/Pays/jordanFlag.png": "eecbba522b917e892d512942381e480f",
"assets/images/Pays/kenyaFlag.png": "19ef526cb196af95efb6d1cbcade9313",
"assets/images/Pays/mexicoFlag.png": "ee57ab6af0aa0abf7680c3701aad7889",
"assets/images/Pays/moroccoFlag.png": "0202894833c07021ce518f56cb778d4c",
"assets/images/Pays/namibiaFlag.png": "4ff8263c4138901649d345d179741012",
"assets/images/Pays/nigeriaFlag.png": "2f39677d22503ac9b90761ec6ca3eb77",
"assets/images/Pays/portugalFlag.png": "1159cd70f5e2c2048afb7d73f01d0970",
"assets/images/Pays/qatarFlag.png": "95219ae452b07b0c251cfad33f8a9547",
"assets/images/Pays/senegalFlag.png": "99806f0ecf65db8884100ffa5697c979",
"assets/images/Pays/southafricaFlag.png": "c0955b8cb214440bb4e3190050d5dba0",
"assets/images/Pays/southkoreaFlag.png": "1e587358944ac64fc7837ee62c2256f0",
"assets/images/Pays/spainFlag.png": "a2fd66ed395c05bcd2d1b4e4b470570d",
"assets/images/Pays/swedenFlag.png": "a4d98244c398dedea20a854423f535bf",
"assets/images/Pays/switzerlandFlag.png": "4326b61d290ec933bfa9dc3686deaf43",
"assets/images/Pays/thailandFlag.png": "2c70830759b6870655f7120ce3a8009d",
"assets/images/Pays/tunisiaFlag.png": "47682ac9f40de62e94934a3bb26b2e3e",
"assets/images/Pays/turkeyFlag.png": "d63c0258ee8689fc1b34127e769c8a4f",
"assets/images/Pays/uarabemirateFlag.png": "e97d6342b3f7a128b9ecd999c0f7feb7",
"assets/images/Pays/ukFlag.png": "3a33ad981766151b423422d84a28c313",
"assets/images/Pays/usaFlag.png": "a0686f877898b1ac0843c750222ac8aa",
"assets/images/villes/abidjan1.jpg": "da1e34f827ef59a5baddf84c0117b510",
"assets/images/villes/abidjan2.jpg": "67fbe218f6dcd4b1a0c2e6e8814d157d",
"assets/images/villes/accra1.jpg": "612d72b181af741382cd50e7d3767e68",
"assets/images/villes/accra2.jpg": "5d80efd34e839acc584a556b546529a0",
"assets/images/villes/addis1.jpg": "0b8bde2e584202ae8e12012d96d3a4ca",
"assets/images/villes/addis2.jpg": "3742a53f5de235249bad7a121b3b01ca",
"assets/images/villes/amman1.jpg": "527caeeb08bf0a21481d7f41c111eec4",
"assets/images/villes/amman2.jpg": "563e1939e901a6c15168c2b7cc18bcd9",
"assets/images/villes/assinie1.jpg": "72b684e3f6afd8ed18092a34c936a995",
"assets/images/villes/bali.jpg": "524cae369f1b5e972145186d6d497fb7",
"assets/images/villes/bali1.jpg": "ddef9b60fc3b5032e4463031a2001234",
"assets/images/villes/bangkok1.jpg": "be14986c67cc1982e13f07de132d94aa",
"assets/images/villes/bangkok2.jpg": "cb729a3b3daa71f5ed94dc4dab270656",
"assets/images/villes/brazil.jpg": "bebde50af06ec05d142feb44bbb7193e",
"assets/images/villes/buenosaires1.jpg": "0bc80623768ca2bbc7a9d1d743710809",
"assets/images/villes/buenosaires2.jpg": "c466412e9a782005603636649df962bc",
"assets/images/villes/cairo1.jpg": "cc0ca8ee614f1b0a1a16d37da2e09039",
"assets/images/villes/cairo2.jpg": "35f4b493835da41586c22259941dad4d",
"assets/images/villes/capetown1.jpg": "272584342f290686422850a1ed5b7685",
"assets/images/villes/capetown2.jpg": "5ef95d9d6ccc63b14b23b72606ec2229",
"assets/images/villes/casablanca1.jpg": "74dd54b6d9a7fdd07f6d3d321504199f",
"assets/images/villes/casablanca2.jpg": "d6dd6b9cf093327e1698295428a502ec",
"assets/images/villes/casablanca3.jpg": "beb7300254d30476b77e69928373e1f1",
"assets/images/villes/dakar1.jpg": "d80e04e4a2811e955a6f8297bc29521c",
"assets/images/villes/dakar2.jpg": "8d50cda22ff88648b08a3b4e22ef5783",
"assets/images/villes/doha1.jpg": "b9e04d135f060a9e5ace13588e00075e",
"assets/images/villes/doha2.jpg": "6a9f58fff082be772755a8b3a8718c5d",
"assets/images/villes/dubai1.jpg": "b5d907aa766b7338a91fc4c11b2913ef",
"assets/images/villes/dubai2.jpg": "547bd3ac9346ee7d8689f70fbb37e19e",
"assets/images/villes/france.jpg": "7e7ab260235bbd2563649bed598d730b",
"assets/images/villes/istanbul1.jpg": "61c6365d92659b41de5f282a65b97560",
"assets/images/villes/istanbul2.jpg": "8d4b40054acac49d9d5cd8201fadb996",
"assets/images/villes/lagos1.jpg": "e559ec6e1d434e4a55da4f169bd136eb",
"assets/images/villes/lagos2.jpg": "ec14d3ef3068d3c91f8c38884d2e364b",
"assets/images/villes/lisbon1.jpg": "b822edff48736bbadcc42f7b46297c65",
"assets/images/villes/lisbon2.jpg": "c742679219318787303567f9270a6bc3",
"assets/images/villes/london1.jpg": "bf470113f5ddcb7df5ee3853965e582c",
"assets/images/villes/london2.jpg": "49b9f235d0981c9aa06d34778dff8945",
"assets/images/villes/losangeles1.jpg": "20775f5bb8978a12c1c78e9fc9bec294",
"assets/images/villes/losangeles2.jpg": "714830199907d46b3f696baf3ebbca5e",
"assets/images/villes/madrid1.jpg": "a874ac6794b482f2158db3ff8489c543",
"assets/images/villes/madrid2.jpg": "d7b3176c6561f04da4c7102b525f2fb0",
"assets/images/villes/marrakech1.jpg": "a15b9ce6be2cccd85cf9312dc0736fc6",
"assets/images/villes/marrakech2.jpg": "5ce7e72bdbee0353587c3fb30bffc417",
"assets/images/villes/mexicocity1.jpg": "e4254352fd7fdbbd12e72bf4d4691d9e",
"assets/images/villes/mexicocity2.jpg": "9a64b8848905dc3414e57c86da8f9286",
"assets/images/villes/montreal1.jpg": "63319f87596aedab92484157d0382c51",
"assets/images/villes/montreal2.jpg": "3d3475e8088ed4386116b021343abea9",
"assets/images/villes/nairobi1.jpg": "e69130d8f547830df3f65ba06da0f2bd",
"assets/images/villes/nairobi2.jpg": "144d4734dad8ee271efb18368c6b936d",
"assets/images/villes/NY1.jpg": "b54a435d7aee94b0466cd7a330c15f21",
"assets/images/villes/NY2.jpg": "6a351ea106a6765d6afd7b86d717afa0",
"assets/images/villes/paris1.jpg": "1f411e07d57b877788a85d7f1f31fb26",
"assets/images/villes/prague1.jpg": "89ffabf313ff11d12adb738492db7135",
"assets/images/villes/prague2.jpg": "377bf5a9672439ddac802fedf6c1f580",
"assets/images/villes/rio1.jpg": "18c0bd7e3c0f42414360fe81c04364fa",
"assets/images/villes/rio2.jpg": "583f0663e54d9966de981603c42bfa4e",
"assets/images/villes/rome1.jpg": "c85fde5a49803b10cc6d97deb8bcd506",
"assets/images/villes/rome2.jpg": "3e6e3a5fec0ea2b235985b1a97e4cae4",
"assets/images/villes/santorini1.jpg": "c54ba6fe3b4fcfee4d4d641c1101c584",
"assets/images/villes/santorini2.jpg": "7260ad9579d002742fca407b4a730ff3",
"assets/images/villes/seoul1.jpg": "dce1798a32284ce51fae5e2fc7c76a0d",
"assets/images/villes/seoul2.jpg": "0bc9cbc1276758cb6927bd7d781a92cc",
"assets/images/villes/stockholm1.jpg": "3fcb3114679aae316d4b4e33da4969c3",
"assets/images/villes/stockholm2.jpg": "36c1475d15e30a248cb0cdc1af7fe081",
"assets/images/villes/sydney1.jpg": "52acabfab1dccc80a5643d6db009b1d9",
"assets/images/villes/sydney2.jpg": "cba5c2a7603882c1abdfc8474e758267",
"assets/images/villes/tokyo1.jpg": "6de796a47cb8d36a6e25c931f9008730",
"assets/images/villes/tokyo2.jpg": "9ed00eec9e01da94b9d58381d3a580ab",
"assets/images/villes/toronto1.jpg": "a77acdde5ec1442b4ceca65a0dbefc90",
"assets/images/villes/toronto2.jpg": "8835f5501156d0ac025f9d0420a818c0",
"assets/images/villes/tunis1.jpg": "047a2bdf374f56d24fa7a076d3bcf753",
"assets/images/villes/tunis2.jpg": "2e75fde14f2ea936841ebb7b698c02f3",
"assets/images/villes/vienna1.jpg": "2258973cacc052292e82eff3c3602b75",
"assets/images/villes/vienna2.jpg": "1b9c1a23892d68ef75118eec13bc3a2d",
"assets/images/villes/vienna3.jpg": "ce693199b39af1c8e4aaaadb2097d533",
"assets/images/villes/windhoek1.jpg": "0ba37850d6c14f7cd5f3f7b66e756677",
"assets/images/villes/windhoek2.jpg": "17e4e58f64545a407b41691343814b37",
"assets/images/villes/zurich1.jpg": "37a8cf6bfea263d32bcaaa10fd982120",
"assets/images/villes/zurich2.jpg": "d9ca1568b7c6aab8fd6dc231be8a05b5",
"assets/images/world.gif": "b11507283dc99473c99ebcf64c9f6537",
"assets/NOTICES": "3271529d91c088c82462416568d84561",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "5447425a8a82e07123221f60faf95310",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "e13babf36ed6e33cde2e384f5c76dbe9",
"/": "e13babf36ed6e33cde2e384f5c76dbe9",
"main.dart.js": "f03d2eb48dadfab9363e6c9ab95e0c7c",
"manifest.json": "1866d3f5d135ee0fa3599bd10590bc24",
"version.json": "abae9893a9b6734e5cde0d53bd167195"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
