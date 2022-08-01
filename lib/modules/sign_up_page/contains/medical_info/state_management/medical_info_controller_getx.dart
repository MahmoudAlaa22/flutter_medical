import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../common/controller/upload_image_and_video_controller.dart';


enum Recording { startRecording, stopRecording, deleteRecording }

enum AudioPlayerEnum { play, stop }

class MedicalInfoControllerGetx extends GetxController {
  FlutterSoundRecorder? audioRecord;
  AudioPlayer player = AudioPlayer();
  RxString diagnosis = ''.obs;
  RxList<String> listOfDiagnosis = <String>[].obs;
  RxString previousOperations = ''.obs;
  RxList<String> listOfPreviousOperations = <String>[].obs;
  RxString medications = ''.obs;
  RxList<String> listOfMedications = <String>[].obs;
  RxString recording = 'Start Recording'.obs;
  RxString pathRecord = ''.obs;
  Rx<Recording> enumRecord = Recording.startRecording.obs;
  Rx<AudioPlayerEnum> audioPlayerEnum = AudioPlayerEnum.play.obs;
  RxString videoPath = ''.obs;

  final List<GlobalKey<FormState>> listOfKey =
      List.generate(3, (index) => GlobalKey<FormState>());

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    audioRecord = FlutterSoundRecorder();
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission has error');
    }
    await audioRecord!.openRecorder();
  }

  void changeDiagnosis(String v) => diagnosis(v);

  void addToListOfDiagnosis(int index) {
    final form = listOfKey[index].currentState;
    if (form!.validate()) {
      form.save();
      listOfDiagnosis.add(diagnosis.value);
      form.reset();
    }
  }

  void deleteItemOfDiagnosis(String element) => listOfDiagnosis.remove(element);

  void changePreviousOperations(String v) => previousOperations(v);

  void addToListOfPreviousOperations(int index) {
    final form = listOfKey[index].currentState;
    if (form!.validate()) {
      form.save();
      listOfPreviousOperations.add(previousOperations.value);
      form.reset();
    }
  }

  void deleteItemOfPreviousOperations(String element) =>
      listOfPreviousOperations.remove(element);

  void changeMedications(String v) => medications(v);

  void addToListOfMedications(int index) {
    final form = listOfKey[index].currentState;
    if (form!.validate()) {
      form.save();
      listOfMedications.add(medications.value);
      form.reset();
    }
  }

  void deleteItemOfMedications(String element) =>
      listOfMedications.remove(element);

  void changeVideoPath() async {
    final uploadImageAndVideoController =
        Get.find<UploadImageAndVideoController>();
    final file = await uploadImageAndVideoController.uploadImageOrVideo(
        fileType: FileType.video);
    videoPath(file!.path);
  }

  Future<void> toggleRecording() async {
    if (enumRecord.value == Recording.deleteRecording) {
      audioRecord!.deleteRecord(fileName: pathRecord.value);
      changeEnumRecord(Recording.startRecording);
      changeRecording('Start Recording');
      pathRecord('');
    } else {
      if (audioRecord!.isStopped) {
        await _startRecord();
      } else {
        await _stopRecord();
      }
    }
  }

  Future<void> _startRecord() async {
    const pathToSaveAudio = 'audio_example.aac';
    await audioRecord?.startRecorder(toFile: pathToSaveAudio);
    changeRecording('Stop Recording');
    changeEnumRecord(Recording.stopRecording);
  }

  Future<void> _stopRecord() async {
    pathRecord(await audioRecord?.stopRecorder());
    changeRecording('Delete Recording');
    changeEnumRecord(Recording.deleteRecording);
  }

  Future<void> playAudioPlayer() async {
    if (player.playing) {
      stopAudio();
    } else {
      await player
          .setAudioSource(
        ConcatenatingAudioSource(
          children: [AudioSource.uri(Uri.file(pathRecord.value))],
        ),
        initialIndex: 0,
      )
          .catchError((error) {
        log('in playlistVersesPath there is Error: $error');
      });
      await playAudio();
      stopAudio();
    }
  }

  void changeRecording(String v) => recording(v);

  void changeEnumRecord(Recording v) => enumRecord(v);

  void changeAudioPlayerEnum(AudioPlayerEnum v) => audioPlayerEnum(v);

  Future<void> playAudio() async {
    changeAudioPlayerEnum(AudioPlayerEnum.stop);
    await player.play();
  }

  void stopAudio() {
    changeAudioPlayerEnum(AudioPlayerEnum.play);
    player.stop();
  }

  @override
  void onClose() {
    super.onClose();
    audioRecord!.closeRecorder();
    audioRecord = null;
  }

}
