import 'package:flutter/foundation.dart';

class FakeDatabase {
  static List<Map<String, dynamic>> menuItems = [
    {
      'item': 'ES KOPI LATTE',
      'price': 20000,
      'image': 'https://images.ctfassets.net/v601h1fyjgba/4GLzOncHIe8rq3xY099cZ/dd17ce72ebb6fb01659c763fe64953db/Iced_Latte.jpg',
      'category': 'minuman'
    },
    {
      'item': 'NASI GORENG',
      'price': 15000,
      'image': 'https://awsimages.detik.net.id/community/media/visual/2023/10/08/resep-nasi-goreng-kecap-manis_43.jpeg?w=1200',
      'category': 'makanan'
    },
    {
      'item': 'SATE AYAM',
      'price': 25000,
      'image': 'https://www.sasa.co.id/medias/page_medias/cara_bikin_sate_ayam_empuk.jpg',
      'category': 'makanan'
    },
    {
      'item': 'GADO-GADO',
      'price': 18000,
      'image': 'https://asset-a.grid.id/crop/0x0:0x0/x/photo/2019/08/29/1093597743.jpg',
      'category': 'makanan'
    },
    {
      'item': 'MIE GORENG',
      'price': 16000,
      'image': 'https://allofresh.id/blog/wp-content/uploads/2023/09/cara-membuat-mie-goreng-4-1-scaled.jpg',
      'category': 'makanan'
    },
    {
      'item': 'AYAM GEPREK',
      'price': 22000,
      'image': 'https://siarindomedia.com/wp-content/uploads/2024/03/1914-Resep-Ayam-Geprek-Krispy.jpg',
      'category': 'makanan'
    },
    {
      'item': 'BAKSO',
      'price': 15000,
      'image': 'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2023/07/25041221/ini-resep-kuah-bakso-sap-yang-mudah-dibuat-di-rumah.jpg',
      'category': 'makanan'
    },
    {
      'item': 'SOTO BETAWI',
      'price': 23000,
      'image': 'https://www.unileverfoodsolutions.co.id/dam/global-ufs/mcos/SEA/calcmenu/recipes/ID-recipes/soups/soto-betawi/main-header.jpg',
      'category': 'makanan'
    },
    {
      'item': 'PEMPEK PALEMBANG',
      'price': 20000,
      'image': 'https://lingkar.news/wp-content/uploads/2023/03/Aneka-Resep-Pempek-Makanan-Tradisional-Khas-Palembang.jpg',
      'category': 'makanan'
    },
    {
      'item': 'NASI UDUK',
      'price': 17000,
      'image': 'https://cdn1-production-images-kly.akamaized.net/bdMMdUeRIi2EGRbRMlFvpgjreVk=/1x60:700x454/800x450/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3264167/original/045475800_1602402228-1212646998.jpg',
      'category': 'makanan'
    },
    {
      'item': 'SOP BUNTUT',
      'price': 35000,
      'image': 'https://asset.kompas.com/crops/4lfNYrSA_CWYWm09D1NkXo6tOfI=/139x96:939x629/750x500/data/photo/2022/09/27/63329597320d8.jpg',
      'category': 'makanan'
    },
    {
      'item': 'RENDANG',
      'price': 40000,
      'image': 'https://www.astronauts.id/blog/wp-content/uploads/2023/03/Resep-Rendang-Daging-Sapi-Untuk-Lebaran-Gurih-dan-Nikmat-1024x683.jpg',
      'category': 'makanan'
    },
    {
      'item': 'NASI PADANG',
      'price': 25000,
      'image': 'https://assets-pergikuliner.com/4o-dKncqKNS6QQbFDqM52WkrK0o=/fit-in/1366x768/smart/filters:no_upscale()/https://assets-pergikuliner.com/uploads/bootsy/image/12013/picture-1537766225.jpeg',
      'category': 'makanan'
    },
    {
      'item': 'MIE ACEH',
      'price': 20000,
      'image': 'https://asset.kompas.com/crops/7tBNI9-TCa-oOq8tQTahf0ua1fg=/0x0:968x645/750x500/data/photo/2021/01/27/6010ce2cc1805.jpg',
      'category': 'makanan'
    },
    {
      'item': 'SIOMAY',
      'price': 15000,
      'image': 'https://cdn0-production-images-kly.akamaized.net/yUSiIJX-YgVUTf4QG7BCL-bnuDU=/1200x900/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/824632/original/070745900_1425891327-siomay.jpg',
      'category': 'makanan'
    },
    {
      'item': 'LOTEK',
      'price': 18000,
      'image': 'https://www.masakapahariini.com/wp-content/uploads/2021/02/Lotek-Bandung-Sederhana.jpg',
      'category': 'makanan'
    },
    {
      'item': 'ES CENDOL',
      'price': 12000,
      'image': 'https://www.sasa.co.id/medias/page_medias/es_cendol_nangka.jpg',
      'category': 'minuman'
    },
    {
      'item': 'ES CAMPUR',
      'price': 17000,
      'image': 'https://cdn0-production-images-kly.akamaized.net/qSxIa6DhH4tSfPQdtDo-0vS-6R8=/0x2180:3999x4434/1200x675/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3981507/original/061819300_1648783740-shutterstock_1969134643.jpg',
      'category': 'minuman'
    },
    {
      'item': 'JUS ALPUKAT',
      'price': 11000,
      'image': 'https://images.tokopedia.net/img/cache/700/VqbcmM/2022/8/4/39bb8a03-913e-4ba6-91ca-05ccbdffb727.jpg',
      'category': 'minuman'
    },
    {
      'item': 'KOPI HITAM',
      'price': 7000,
      'image': 'https://res.cloudinary.com/dk0z4ums3/image/upload/v1594099345/attached_image/ini-manfaat-konsumsi-kopi-hitam-dan-efek-sampingnya-untuk-kesehatan.jpg',
      'category': 'minuman'
    },
  ];

  static List<Map<String, dynamic>> getMenuItems() {
    return menuItems;
  }


}



class SelectedItems {
  static final ValueNotifier<Map<String, Map<String, dynamic>>> _selectedItems =
  ValueNotifier<Map<String, Map<String, dynamic>>>(<String, Map<String, dynamic>>{});

  static ValueNotifier<Map<String, Map<String, dynamic>>> get items => _selectedItems;

  static void addItem(Map<String, dynamic> item) {
    final itemName = item['item'];
    final currentItems = _selectedItems.value;


    if (currentItems.containsKey(itemName)) {
      // Increase quantity
      currentItems[itemName]!['quantity'] += 1;

    } else {
      // Add new item with quantity 1
      currentItems[itemName] = {
        ...item,
        'quantity': 1,
      };
    }

    _selectedItems.value = Map.from(currentItems); // Notify listeners
    _selectedItems.notifyListeners(); // Notify listeners about the change
  }

  static Map<String, Map<String, dynamic>> getItems() {
    return _selectedItems.value;
  }
}

