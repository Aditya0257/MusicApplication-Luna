import 'dart:convert';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:luna/app/modules/track/view/track.dart';

import '../../searchpage/view/searchpage.dart';
import '../view/first_tab.dart';

class HomePageController extends GetxController {
  final _tabIndex = 0.obs;
  bool checkPlayMusic = true;
  int get tabIndex => _tabIndex.value;
  List<Widget> tab = [const FirstTab(), SearchPage(), Profile()];
  onChangeTab(int x) {
    _tabIndex(x);
  }

  @override
  void onInit() async {
    super.onInit();
    await artists();
    await albums();
    await recommendation();
    await musicPlayerInitialization();
  }

  final assetsAudioPlayer = AssetsAudioPlayer();

  musicPlayerInitialization() {
    
    assetsAudioPlayer.open(
      Audio("assets/audios/song1.mp3"),
    );
  }

  onPressPlay() async {
    checkPlayMusic = !checkPlayMusic;
    if (checkPlayMusic == true) {
      await assetsAudioPlayer.play();
    }
    if (checkPlayMusic == false) {
      await assetsAudioPlayer.pause();
    }
    update();
  }

  List artistsList = [];
  List albumsList = [];
  List recommendationList = [];
  Future<void> artists() async {
    final String response =
        await rootBundle.loadString('assets/json_dumy_data/artists.json');
    final data = await jsonDecode(response);
    artistsList = data['artists'];
    update();
  }

  Future<void> albums() async {
    final String response =
        await rootBundle.loadString('assets/json_dumy_data/albums.json');
    final data = await jsonDecode(response);
    albumsList = data['albums']['items'];
    update();
  }

  Future<void> recommendation() async {
    final String response = await rootBundle
        .loadString('assets/json_dumy_data/recommendation.json');
    final data = await jsonDecode(response);

    recommendationList = data['tracks'];
    update();
  }
}
