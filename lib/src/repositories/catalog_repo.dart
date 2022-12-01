import 'package:get/get.dart';

import '../models/catalog.dart';
import 'base_repo.dart';

List<Catalog> catalogList = [
  Catalog(
    id: 1,
    parent: 0,
    name: 'IKEA',
    image: 'https://play-lh.googleusercontent.com/U_hRwbvZcVxq32B'
        'mCBGRd-dH9S2PmkiFovPdEz5CPDzMzELNYP7njs44EQFqTWQJIdc',
    children: <Catalog>[
      Catalog(
        id: 1,
        parent: 1,
        name: 'Бытовая техника',
      ),
      Catalog(
        id: 2,
        parent: 1,
        name: 'Мебель',
      ),
      Catalog(
        id: 2,
        parent: 1,
        name: 'Ковры и напольные покрытия',
      ),
    ],
  ),
  Catalog(
    id: 2,
    parent: 0,
    name: 'Товары для дома',
    image: 'https://max.kg/images/categories/cat_2000000459.jpg',
    children: <Catalog>[
      Catalog(
        id: 1,
        parent: 2,
        name: 'Мебель',
        children: <Catalog>[
          Catalog(
            id: 1,
            parent: 1,
            name: 'Кухоння мебель',
          )
        ],
      )
    ],
  ),
  Catalog(
    id: 3,
    parent: 0,
    name: 'Товары для женщин',
    image: 'https://max.kg/images/menu/bubbles-1962355_640.png',
    children: <Catalog>[
      Catalog(id: 1, parent: 2, name: 'Ткани', children: <Catalog>[
        Catalog(
          id: 1,
          parent: 1,
          name: 'Мех',
        )
      ])
    ],
  ),
  Catalog(
    id: 4,
    parent: 0,
    name: 'Компьютеры, ноуьтбуки, планшеты',
    image: 'https://max.kg/nal/img/4582/b_tov_11421599_e4cd063a.jpg',
    children: <Catalog>[
      Catalog(
        id: 1,
        parent: 2,
        name: 'Компьютерная периферия',
        children: <Catalog>[
          Catalog(
            id: 1,
            parent: 1,
            name: 'Наушники и гарнитуры',
          )
        ],
      )
    ],
  ),
];

class CatalogRepo extends BaseRepo {
  List<Catalog> _catalogList = [
    Catalog(
        id: 1,
        name: 'Сувениры',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQoEHnFMDEknvS9iKTMO75DNJnVyx1Ez_aqQ&usqp=CAU'),
    Catalog(
        id: 2,
        name: 'Ноутбуки',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQoEHnFMDEknvS9iKTMO75DNJnVyx1Ez_aqQ&usqp=CAU'),
    Catalog(
        id: 3,
        name: 'Строительство и ремонт',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQoEHnFMDEknvS9iKTMO75DNJnVyx1Ez_aqQ&usqp=CAU'),
    Catalog(
        id: 4,
        name: 'Спорт и отдых',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQoEHnFMDEknvS9iKTMO75DNJnVyx1Ez_aqQ&usqp=CAU'),
    Catalog(
        id: 5,
        name: 'Мотокультиваторы',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQoEHnFMDEknvS9iKTMO75DNJnVyx1Ez_aqQ&usqp=CAU'),
    Catalog(
        id: 6,
        name: 'Строительство и ремонт',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQoEHnFMDEknvS9iKTMO75DNJnVyx1Ez_aqQ&usqp=CAU')
  ];

  getSeasonCatalogList() async =>
      await get('catalog/season', decoder: (list) => Catalog.fromList(list));

  getFavoriteCatalogList() async =>
      await get('catalog/season', decoder: (list) => Catalog.fromList(list));

  getHomeCatalogList() async =>
      await get('catalog/cathome', decoder: (list) => Catalog.fromList(list));

  getInnerCatalogHistList(int id) async =>
      await get('catalog/catid?id=$id', decoder: (res) => CatalogHist.fromMap(res));

  search(String text) async {
    await Future.delayed(Duration(seconds: 3));

    return _catalogList
        .where((catalog) =>
            catalog.name!.toLowerCase()
                .contains(text.toLowerCase())).toList();
  }
}
