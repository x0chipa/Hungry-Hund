import 'package:flutter/material.dart';
import 'package:hungry_hund/core/app_asset.dart';
import 'package:hungry_hund/src/model/furniture.dart';
import 'package:hungry_hund/src/model/bottom_navigation_item.dart';

class AppData {
  const AppData._();

  
  static List<Furniture> furnitureList = [
    Furniture(
      quantity: 1,
      isFavorite: false,
      title: 'Hambuguesa de pollo con papas fritas',
      description: "Hamburguesa de pollo con papas fritas, acompañada de una bebida a elección",
      price: 469.99,
      score: 3.5,
      images: [
        AppAsset.hamburguesaPollo1,
        AppAsset.hamburguesaPollo2,
        AppAsset.hamburguesaPollo3,
        AppAsset.hamburguesaPollo4,
        AppAsset.hamburguesaPollo5,
      ],
      category: 'Hamburguesas',
    ),
    Furniture(
      isFavorite: false,
      quantity: 1,
      title: 'Hamburguesa de res con papas fritas',
      //agrega una descripcion detallada
      description: "Hamburguesa de res con papas fritas, acompañada de una bebida a elección",
      price: 299.99,
      score: 4.5,
      images: [
        AppAsset.hamburguesaRes1,
        AppAsset.hamburguesaRes2,
        AppAsset.hamburguesaRes3,
        AppAsset.hamburguesaRes4,
        AppAsset.hamburguesaRes5,
      ],
      category: 'Hamburguesas',
    ),
    Furniture(
      quantity: 1,
      isFavorite: false,
      title: 'Hamburguesa hawaiana con papas fritas',
      description: "Hamburguesa hawaiana con papas fritas, acompañada de una bebida a elección",
      price: 659.99,
      score: 3.0,
      images: [
        AppAsset.hamburguesaHawaiana1,
        AppAsset.hamburguesaHawaiana2,
        AppAsset.hamburguesaHawaiana3,
      ],
      category: 'Hamburguesas',
    ),
    Furniture(
      quantity: 1,
      isFavorite: false,
      title: 'Pizza de peperoni',
      description:  "Pizza de peperoni, acompañada de una bebida a elección",
      price: 349.99,
      score: 2.5,
      images: [
        AppAsset.pizzaPeperoni1,
        AppAsset.pizzaPeperoni2,
        AppAsset.pizzaPeperoni3,
      ], category: 'Pizzas',
    
    ),
    Furniture(
      quantity: 1,
      isFavorite: false,
      title: 'Pizza hawaiana',
      description: "Pizza hawaiana, acompañada de una bebida a elección",
      price: 499.99,
      score: 2.8,
      images: [
        AppAsset.pizzaHawaiana1,
        AppAsset.pizzaHawaiana2,
      ],
      category: 'Pizzas',
    ),

    Furniture(
      quantity: 1,
      isFavorite: false,
      title: 'Pizza de queso',
      description: "Pizza de queso, acompañada de una bebida a elección",
      price: 499.99,
      score: 2.8,
      images: [
        AppAsset.pizzaQueso1,
        AppAsset.pizzaQueso2,
      ],
      category: 'Pizzas',
    ),

    Furniture(
      quantity: 1,
      isFavorite: false,
      title: 'Refresco de cola',
      description: "Refresco de cola",
      price: 19.99,
      score: 4.5,
      images: [
        AppAsset.refrescoCola,
      ],
      category: 'Bebidas',
    ),

    Furniture(
      quantity: 1,
      isFavorite: false,
      title: 'Refresco de naranja',
      description: "Refresco de naranja",
      price: 19.99,
      score: 4.5,
      images: [
        AppAsset.refrescoNaranja,
      ],
      category: 'Bebidas',
    ),

    Furniture(
      quantity: 1,
      isFavorite: false,
      title: 'Refresco de limón',
      description: "Refresco de limón",
      price: 19.99,
      score: 4.5,
      images: [
        AppAsset.refrescoLimon,
      ],
      category: 'Bebidas',
    ),

    Furniture(
      quantity: 1,
      isFavorite: false,
      title: 'Refresco de manzana',
      description: "Refresco de manzana",
      price: 19.99,
      score: 4.5,
      images: [
        AppAsset.refrescoManzana,
      ],
      category: 'Bebidas',
    ),

    Furniture(
      quantity: 1,
      isFavorite: false,
      title: 'Refresco de uva',
      description: "Refresco de uva",
      price: 19.99,
      score: 4.5,
      images: [
        AppAsset.refrescoUva,
      ],
      category: 'Bebidas',
    ),

    Furniture(
      quantity: 1,
      isFavorite: false,
      title: 'Agua natural',
      description: "Agua natural",
      price: 9.99,
      score: 4.5,
      images: [
        AppAsset.aguaNatural,
      ],
      category: 'Bebidas',
    ),
  ];



  static List<BottomNavigationItem> bottomNavigationItems = [
    const BottomNavigationItem(Icon(Icons.home), 'Inicio'),
    const BottomNavigationItem(Icon(Icons.add_shopping_cart_rounded), 'Carrito'),
    const BottomNavigationItem(Icon(Icons.bookmark), 'Favoritos'),
    const BottomNavigationItem(Icon(Icons.person), 'Yo')
  ];
}
