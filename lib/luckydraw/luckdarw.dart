import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:scan_gun/scan_monitor_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kUrl = "https://www.mediacollege.com/downloads/sound-effects/nature/forest/rainforest-ambient.mp3";

const int repeatInt = 10;

class luckydrawBody extends StatefulWidget {
  const luckydrawBody({Key? key}) : super(key: key);

  @override
  State<luckydrawBody> createState() => _luckydrawBodyState();
}

class _luckydrawBodyState extends State<luckydrawBody> with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  //扫码的Text文本
  FocusNode textFileNode = FocusNode();

  // 会重复播放的控制器
  late final AnimationController _repeatController;

  /// 线性动画
  late final Animation<double> _animationstat;

  late HardwareKeyboard hardwareKeyboard; //监听机械键盘
  final assetsAudioPlayer = AssetsAudioPlayer();

  late Timer _timer;
  int second = 0;

  //防止二次触发方法
  bool protection = false;
  String drawText = '恭喜您！中二等奖';


  //是否显示中奖信息
  bool _visbility = false;

  GlobalKey _myKey = GlobalKey();
  ScrollController _controller = ScrollController();
  int index = 0;

  //工号输入框
  final TextEditingController _textcontroller = TextEditingController();
  //区域列表
  List arealist = ['综保区','巴城'];
  //是否显示区域列表
  bool areaSelect = false;
  //选择当前区域
  String areaText = '请选择您的区域';

  @override
  void dispose() {
    _controller.dispose();
    _repeatController.dispose();
    assetsAudioPlayer.dispose();
    cancelTimer();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    hardwareKeyboard = HardwareKeyboard.instance;
    WidgetTime();
    // heardwareKeyboard();
    repeatController();
    //扫码枪返回结果
    ScanMonitor();
    SharePre();
  }

  void SharePre() async {
    var sp = await SharedPreferences.getInstance();
    String? name = sp.getString("area");
    setState(() {
      areaText = name!;
    });
    print('000000 =====  $name');
  }

  void playLocal() async {
    print('playLocal');
    await assetsAudioPlayer.open(
      Audio("assets/sounds/test.mp3"),
      autoStart: true,
      showNotification: true,

      //播放多个音乐的方法
      // _assetsAudioPlayer.loopMode.listen((loopMode){
      //   _assetsAudioPlayer.open(
      //     Playlist(
      //         audios: [
      //           Audio("assets/sound/mafia-sound.mp3"),
      //           Audio("assets/sound/mafia-sound.mp3")
      //         ]
      //     ),
      //   );
      // });
    );

    // 播放网络音乐的方法
    // try {
    //   await assetsAudioPlayer.open(
    //     Audio.network(kUrl),
    //   );
    //   print('ttttttt = open');
    // } catch (t) {
    //   print('ttttttt = $t');
    //   //mp3 unreachable
    // }
  }

//转盘动画
  void repeatController() {
    print('repeatController');

    /// 动画持续时间是 3秒，此处的this指 TickerProviderStateMixin
    _repeatController = AnimationController(
      duration: const Duration(seconds: repeatInt),
      vsync: this,
    )
      ..repeat(); // 设置动画重复播放

    // 创建一个从0到360弧度的补间动画 v * 2 * π
    _animationstat = Tween<double>(begin: 0, end: 1).animate(_repeatController);
  }

//检测键盘点击事件
  void heardwareKeyboard() {
    print('heardwareKeyboard');
    hardwareKeyboard.addHandler((event) {
      if (protection == false) {
        print("点击了=${event.logicalKey.keyLabel}");
        if (event.logicalKey.keyLabel == "Enter") {
          print('$areaText');
          //将多余空格去掉
          String textfiled = _textcontroller.text.replaceAll(' ', '');
          print('输入的工号： $textfiled');
          //判断当前是否有工号
          if (textfiled.isEmpty || areaText == "请选择您的区域") {
            print ('当前工号为空！！！');
            setState(() {
              _visbility=true;
              drawText = '当前工号或区域不能为空！';
            });
          }else {
            print ('当前工号不为空！！！');
            if (_visbility == true) {
              _visbility = false;
            }
            setState(() {
              drawText = '恭喜您！中二等奖';
              second = 0;
              playLocal(); //点击回车，播放音乐
              finishAudio();
            });
            protection = true;
          }
        }else {
          return false;
        }
      }
      return true;
    });
  }

  //监听完成时间
  //来监听 节点是否build完成
  void finishAudio() {
    print('finishAudio');
    final Duration position = assetsAudioPlayer.currentPosition.value;
    print('position === $position');
    const period = Duration(seconds: 1);
    // cancelTimer();
    _timer = Timer.periodic(period, (timer) {
      second++;
      setState(() {
        if (second == 2) {
          _visbility = true;
          _textcontroller.text = '';
          cancelTimer();
        }
      });
      print(second);
    });
  }

//取消timer逻辑
  void cancelTimer() {
    print('时间暂停');
    if (_timer.isActive) {
      second = 0;
      protection = false;
      _timer.cancel();
    }
  }

//监听中奖信息事件
  void WidgetTime() {
    print('WidgetTime');
    //来监听 节点是否build完成
    WidgetsBinding widgetsBinding = WidgetsBinding.instance;
    widgetsBinding.addPostFrameCallback((callback) {
      Timer.periodic(const Duration(seconds: 3), (timer) {
        index += _myKey.currentContext!.size!.height.toInt();
        _controller.animateTo((index).toDouble(), duration: const Duration(seconds: 1), curve: Curves.easeOutSine);
        // _controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeIn);
        //滚动到底部从头开始
        if ((index - _myKey.currentContext!.size!.height.toInt()).toDouble() > _controller.position.maxScrollExtent) {
          _controller.jumpTo(_controller.position.minScrollExtent);
          index = 0;
        }
      });
    });
    _controller = ScrollController(initialScrollOffset: 0);
    /*   _controller.addListener(() {
      print(_controller.offset);
    });*/
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            BigimageView(),
            rotTransition(),
            TextView(),
            GifImage1(),
            Visibility(visible: _visbility, child: CreatDrawText()),
            CreatTextFiled(),
            CreatAreaSelect(),
            Visibility(visible: areaSelect, child:areaListSelect()),
          ],
        ),
      ),
    );
  }

  Widget BigimageView() {
    return GestureDetector(
      onTap: (){
        heardwareKeyboard();
      },
      child: Container(
        width: double.infinity,
        child: Image.network(
          'assets/images/newYearView.gif',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget GifImage1() {
    return Container(
      alignment: Alignment.bottomRight,
      child: Image.network(
        'assets/images/happlynewyear.gif',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget TextView() {
    return Container(
      padding: EdgeInsets.only(
        right: 100,
      ),
      height: 100,
      child: ListView.builder(
          key: _myKey,
          //禁止手动滑动
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 30,
          //item固定高度
          itemExtent: 100,
          scrollDirection: Axis.vertical,
          controller: _controller,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.topRight,
              child: Text(
                "当前的中奖人$index",
                style: const TextStyle(
                  shadows: <Shadow>[Shadow(color: Colors.black54, blurRadius: 3, offset: Offset(3, 3))],
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
            );
          }),
    );
  }

  Widget rotTransition() {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: RotationTransition(
          turns: _animationstat,
          child: Image.network(
            'assets/images/roulettedraw.webp',
            width: 500,
            height: 500,
            fit: BoxFit.cover,
          ),
          // const Icon(Icons.arrow_drop_up, size: 180),
        ),
      ),
    );
  }

  //扫码枪返回结果
  Widget ScanMonitor() {
    return ScanMonitorWidget(
      childBuilder: (context) {
        return body();
      },
      onSubmit: (String result) {
        print('扫码枪返回结果==== result');
      },
    );
  }

  Widget body() {
    return TextField(
      focusNode: textFileNode,
    );
  }

  //中奖信息展示
  Widget CreatDrawText() {
    return Visibility(
      visible: true,
      child: Center(
        child: Card(
          color: Colors.white,
          child: Text(drawText, style: TextStyle(fontSize: 50)),
        ),
      ),
    );
  }

  //输入工号
  Widget CreatTextFiled() {
    return Container(
        padding: EdgeInsets.only(left: 25, top: 80),
        width: 300,
        child: TextFormField(
          autofocus: true,
          showCursor: true,
          focusNode: textFileNode,
          controller: _textcontroller,
          // readOnly: true,
          onEditingComplete: () {
            heardwareKeyboard();
            print('add');
          },
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'fffff';
            }
            return null;
          },
          onTap: () {
            print('点击输入框');
            hardwareKeyboard.clearState();
          },
          onChanged: (text) {
            setState(() {
              print(Text("监听文字变化：$text"));

            });
          },
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: '请输入您的工号',
            border: InputBorder.none,
          ),
        )
    );
  }

  Widget CreatAreaSelect() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 18, top: 150),
          width: 300,
          child: GestureDetector(
            onTap: (){
              setState(() {
                areaSelect = true;
              });
              print('选择区域');
            },
            child: Card(
              color: Colors.white,
              child: Text(areaText,style:const TextStyle(fontSize: 20),),
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: 250, top: 157),
            child: Icon(Icons.arrow_drop_down,size: 25,)
        ),
      ],
    );
  }

  Widget areaListSelect() {
    return Container(
      width: 290,
      child: ListView(
        padding: EdgeInsets.only(left: 18, top: 187),
        itemExtent: 50,
        children: List.generate(
          arealist.length,
          (index) {
            return GestureDetector(
              onTap: ()async{
                print('${arealist[index]}');
                var sp = await SharedPreferences.getInstance();
                sp.setString('area', '${arealist[index]}');
                setState(() {
                  areaText = arealist[index];
                  areaSelect = false;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.1,color: Colors.black),
                  color: Colors.white,
                ),
                child: ListTile(
                  hoverColor: Colors.black12,
                  title: Text(
                    arealist[index],
                    style: TextStyle(backgroundColor: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
