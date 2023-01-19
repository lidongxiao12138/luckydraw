import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:luckydraw/server/httpServer.dart';
import 'package:scan_gun/scan_monitor_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../award_records_entity.dart';
import '../take_award_entity.dart';
import '../user_info_entity.dart';

//网络音频地址
const kUrl =
    "https://www.mediacollege.com/downloads/sound-effects/nature/forest/rainforest-ambient.mp3";

const int repeatInt = 10;

class luckydrawBody extends StatefulWidget {
  const luckydrawBody({Key? key}) : super(key: key);

  @override
  State<luckydrawBody> createState() => _luckydrawBodyState();
}

class _luckydrawBodyState extends State<luckydrawBody>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
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
  String drawText = '';

  //是否显示中奖信息
  bool _visbility = false;

  GlobalKey _myKey = GlobalKey();
  ScrollController _controller = ScrollController();
  int index = 0;

  //工号输入框
  final TextEditingController _textcontroller = TextEditingController();

  //工号
  String _textfiled = '';

  //区域列表
  List arealist = ['综保区', '巴城'];

  //是否显示区域列表
  bool areaSelect = false;

  //选择当前区域
  String areaText = '请选择您的区域';

  //person 个人信息模块
  String _UserName = '';
  String _UserNo = '';
  String _UserOS = '';
  String _message = '';
  bool _IsPersonal = false;

  //查询是否是第一次点击
  int countClick = 0;

  //中奖名单列表
  List<AwardRecordsDataResult> awardRecordList = [];


  @override
  void dispose() {
    _controller.dispose();
    _repeatController.dispose();
    assetsAudioPlayer.dispose();
    hardwareKeyboard.clearState();
    cancelTimer();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    hardwareKeyboard = HardwareKeyboard.instance;
    repeatController();
    //扫码枪返回结果
    ScanMonitor();
    SharePre();
    getHttpRecords();
  }

//发送网络请求
  //获取抽奖记录
  void getHttpRecords () async {
    awardRecordList.clear();
    await LDXHttpRequest.request('https://lzhr.luxsan-ict.com:8443/jeecg-boot/outside/getAwardRecords').then((value) {
      var award = AwardRecordsEntity.fromJson(value);
      var res = award.data?.result;
      setState(() {
        awardRecordList.addAll(res!);
      });
    }).onError((error, stackTrace) {

    });
  }

  //获取个人信息
  void getHttp() async {
    var params = {
      "userNo": _textfiled,
      "plant": areaText,
    };
    print(params);
    await LDXHttpRequest.request("https://lzhr.luxsan-ict.com:8443/jeecg-boot/outside/getUserInfo",
            params: params)
        .then((res) {
      print(res);
      var userInfo = UserInfoEntity.fromJson(res);
      _UserName = (userInfo.data?.user?.cpf02).toString();
      _UserNo = (userInfo.data?.user?.cpf01).toString();
      _UserOS = (userInfo.data?.user?.oStext).toString();
      _message = (userInfo.message).toString();
      if (_message.length > 0) {
        setState(() {
          _IsPersonal = false;
          _visbility = true;
          drawText = _message;
        });
      }else {
        print('开始抽奖啦！');
        //隐藏中奖提示
        if (_visbility == true) {
          _visbility = false;
        }
        setState(() {
          _IsPersonal = true;
        });
        if (countClick > 2) {
          setState(() {
            second = 0;//重制音频播放时间
            playLocal(); //点击回车，播放音乐
            finishAudio();//播放结束后回调
            countClick = 0;//重制点击次数
            protection = true;
            //更新抽奖列表
            getHttpRecords();
          });
        }
        if (countClick == 1) {
          postHttpDraw();
        }
        print('countClick ==== $countClick');
        countClick++;
      }
    }).onError((error, stackTrace){
      print(error);
    });
  }
  
  void postHttpDraw() async{
    var params = {
      "userNo": _textfiled,
      "plant": areaText,
    };
    print('中奖信息查询 === $params');
    LDXHttpRequest.request('https://lzhr.luxsan-ict.com:8443/jeecg-boot/outside/takeAward',params: params,method: 'post').then((value){
      print('中奖啦！！！ +++++ $value');
      var userInfo = TakeAwardEntity.fromJson(value);
      String message = (userInfo.message).toString();
      String prize = '恭喜您获得${(userInfo.data?.result?.level)}等奖\n${userInfo.data?.result?.howmuch}元';
      if ((userInfo.data?.result?.level).toString() == "4") {
        prize = '很遗憾您未中奖\n新年快乐!';
      }
      if (message.length > 0) {
        setState(() {
          print('已经抽过奖了');
          _visbility = true;
          drawText = message;
        });
      }else {
        //禁止两次
        setState(() {
          // _visbility = true;
          drawText = prize;
        });

      }
    }).onError((error, stackTrace) {
      print(error);
    });
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
    )..repeat(); // 设置动画重复播放

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
          _textfiled = _textcontroller.text.replaceAll(' ', '');
          print('输入的工号： $_textfiled');
          //判断当前是否有工号
          if (_textfiled.isEmpty || areaText == "请选择您的区域") {
            countClick = 0;
            print('当前工号为空！！！');
            setState(() {
              _visbility = true;
              drawText = '当前工号或区域不能为空！';
            });
          } else {
            print('当前工号不为空！！！');
            //发送网络请求，获取用户信息
            getHttp();
          }
        } else {
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
          print('----- $drawText');
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

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
            BigimageView(),
            rotTransition(),
            GifImage1(),
            DrawListView(),

          Visibility(visible: _visbility, child: CreatDrawText()),
            CreatTextFiled(),
            CreatAreaSelect(),
            Visibility(visible: areaSelect, child: areaListSelect()),
            Visibility(visible: _IsPersonal, child: CreatPersonal()),
          ],
        ),
    );
  }

  Widget BigimageView() {
    return GestureDetector(
      onTap: () {
        hardwareKeyboard.clearState();
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

  Widget DrawListView() {
    return Container(
        child: ListView.builder(
          padding:const EdgeInsets.only(left:1200,top: 30),
            itemCount: awardRecordList.length,
            itemExtent: 25,
            itemBuilder: (BuildContext ctx, int index) {
            return ListTile(
              hoverColor: Colors.black12,
              title: Text(
                '${awardRecordList[index].userName} ${awardRecordList[index].plant} ${'恭喜您获得${(awardRecordList[index].level)}等奖${awardRecordList[index].howmuch}元'}',
                style: TextStyle(color: Colors.white),
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
          child: Text(drawText, style: TextStyle(fontSize: 50,color: Colors.red)),
        ),
      ),
    );
  }

//personal个人信息
  Widget CreatPersonal() {
    return Container(
        padding: EdgeInsets.only(left: 25, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.white,
              child: Text(
                '用户姓名: $_UserName',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            Card(
              color: Colors.white,
              child: Text(
                '用户工号:$_UserNo',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            Card(
              color: Colors.white,
              child: Text(
                '用户部门:$_UserOS',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ],
        ));
  }

//输入工号
  Widget CreatTextFiled() {
    return Container(
        padding: EdgeInsets.only(left: 25, top: 180),
        width: 300,
        child: TextFormField(
          autofocus: true,
          showCursor: true,
          focusNode: textFileNode,
          controller: _textcontroller,
          // readOnly: true,
          onEditingComplete: () {
            hardwareKeyboard.clearState();
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
        ));
  }

  Widget CreatAreaSelect() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 18, top: 250),
          width: 300,
          child: GestureDetector(
            onTap: () {
              setState(() {
                areaSelect = true;
              });
              print('选择区域');
            },
            child: Card(
              color: Colors.white,
              child: Text(
                areaText,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: 250, top: 257),
            child: Icon(
              Icons.arrow_drop_down,
              size: 25,
            )),
      ],
    );
  }

  Widget areaListSelect() {
    return Container(
      width: 290,
      child: ListView(
        padding: EdgeInsets.only(left: 18, top: 287),
        itemExtent: 50,
        children: List.generate(
          arealist.length,
          (index) {
            return GestureDetector(
              onTap: () async {
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
                  border: Border.all(width: 0.1, color: Colors.black),
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
