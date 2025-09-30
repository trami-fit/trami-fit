import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

// 언어별 번역 클래스
class AppLocalizations {
  static const Map<String, Map<String, String>> _translations = {
    '日本語': {
      'home': 'ホーム',
      'routine': 'ルーティン',
      'log': 'ログ',
      'setting': '設定',
      'start_workout': '運動を開始する',
      'stop_workout': '運動を停止する',
      'pause_workout': '一時停止',
      'resume_workout': '再開',
      'workout_time': '運動時間',
      'next_workout': '次に運動日まで',
      'workout_in_progress': '運動中...',
      'workout_paused': '一時停止中...',
      'goal_remaining': 'ゴールまであと',
      'goal_setting': '目標設定',
      'monthly_activity': '今月活動日数',
      'days': '日',
      'schedule': 'スケジュール',
      'fixed_workout_days': '固定運動日',
      'set_schedule': '運動予定にする',
      'cancel_schedule': '予定解除',
      'close': '閉じる',
      'weight_input': '体重入力',
      'current_weight': '現在の体重 (kg)',
      'save': '保存',
      'cancel': 'キャンセル',
      'records': '記録',
      'workout_records': '運動記録',
      'weight_records': '体重記録',
      'no_workout_records': '運動記録がありません',
      'no_weight_records': '体重記録がありません',
      'profile': 'プロフィール',
      'app_settings': 'アプリ設定',
      'account': 'アカウント',
      'info': '情報',
      'dark_mode': 'ダークモード',
      'dark_mode_subtitle': '暗いテーマに切り替え',
      'language': '言語',
      'notifications': '通知設定',
      'notification_subtitle': 'プッシュ通知の管理',
      'privacy': 'プライバシー設定',
      'privacy_subtitle': 'データの管理とセキュリティ',
      'backup': 'データバックアップ',
      'backup_subtitle': 'データの保存と復元',
      'logout': 'ログアウト',
      'logout_subtitle': 'アカウントからサインアウト',
      'help': 'ヘルプとサポート',
      'help_subtitle': 'よくある質問とサポート',
      'version': 'バージョン',
      'last_workout': 'ラスト運動から',
      'create_schedule': '運動スケジュールを作成してください',
      'skip_workout': 'スキップ',
      'minutes': '分',
      'seconds': '秒',
      'edit_profile': 'プロフィール編集',
      'user_name': 'ユーザー名',
      'user_email': 'メールアドレス',
      'select_language': '言語選択',
      'korean': '한국어',
      'japanese': '日本語',
      'english': 'English',
      'search_placeholder': '私の運動を見つかる!',
      'favorites': 'お気に入り',
      'squat': 'スクウォット',
      'push_up': '腕立て伏せ',
      'plank': 'プランク',
      'lunges': 'ランジ',
      'burpees': 'バーピー',
      'mountain_climber': 'マウンテンクライマー',
      'routine1': 'ルーティン1',
      'routine2': 'ルーティン2',
      'add_to_favorites': 'お気に入りに追加',
      'remove_from_favorites': 'お気に入りから削除',
      'create_routine': '新しいルーティンを作成',
      'routine_name': 'ルーティン名',
      'select_exercises': '運動を選択',
      'add_exercise': '運動を追加',
      'save_routine': 'ルーティンを保存',
      'search_exercises': '運動を検索...',
    },
    '한국어': {
      'home': '홈',
      'routine': '루틴',
      'log': '로그',
      'setting': '설정',
      'start_workout': '운동 시작',
      'stop_workout': '운동 중지',
      'pause_workout': '일시정지',
      'resume_workout': '재개',
      'workout_time': '운동 시간',
      'next_workout': '다음 운동일까지',
      'workout_in_progress': '운동 중...',
      'workout_paused': '일시정지 중...',
      'goal_remaining': '목표까지',
      'goal_setting': '목표 설정',
      'monthly_activity': '이번 달 활동일수',
      'days': '일',
      'schedule': '스케줄',
      'fixed_workout_days': '고정 운동일',
      'set_schedule': '운동 예정으로 설정',
      'cancel_schedule': '예정 해제',
      'close': '닫기',
      'weight_input': '체중 입력',
      'current_weight': '현재 체중 (kg)',
      'save': '저장',
      'cancel': '취소',
      'records': '기록',
      'workout_records': '운동 기록',
      'weight_records': '체중 기록',
      'no_workout_records': '운동 기록이 없습니다',
      'no_weight_records': '체중 기록이 없습니다',
      'profile': '프로필',
      'app_settings': '앱 설정',
      'account': '계정',
      'info': '정보',
      'dark_mode': '다크 모드',
      'dark_mode_subtitle': '어두운 테마로 전환',
      'language': '언어',
      'notifications': '알림 설정',
      'notification_subtitle': '푸시 알림 관리',
      'privacy': '개인정보 설정',
      'privacy_subtitle': '데이터 관리 및 보안',
      'backup': '데이터 백업',
      'backup_subtitle': '데이터 저장 및 복원',
      'logout': '로그아웃',
      'logout_subtitle': '계정에서 로그아웃',
      'help': '도움말 및 지원',
      'help_subtitle': '자주 묻는 질문 및 지원',
      'version': '버전',
      'last_workout': '마지막 운동부터',
      'create_schedule': '운동 스케줄을 생성하세요',
      'skip_workout': '건너뛰기',
      'minutes': '분',
      'seconds': '초',
      'edit_profile': '프로필 편집',
      'user_name': '사용자 이름',
      'user_email': '이메일',
      'select_language': '언어 선택',
      'korean': '한국어',
      'japanese': '일본어',
      'english': '영어',
      'search_placeholder': '내 운동을 찾기!',
      'favorites': '즐겨찾기',
      'squat': '스쿼트',
      'push_up': '팔굽혀펴기',
      'plank': '플랭크',
      'lunges': '런지',
      'burpees': '버피',
      'mountain_climber': '마운틴 클라이머',
      'routine1': '루틴1',
      'routine2': '루틴2',
      'add_to_favorites': '즐겨찾기에 추가',
      'remove_from_favorites': '즐겨찾기에서 제거',
      'create_routine': '새 루틴 만들기',
      'routine_name': '루틴 이름',
      'select_exercises': '운동 선택',
      'add_exercise': '운동 추가',
      'save_routine': '루틴 저장',
      'search_exercises': '운동 검색...',
    },
    'English': {
      'home': 'Home',
      'routine': 'Routine',
      'log': 'Log',
      'setting': 'Setting',
      'start_workout': 'Start Workout',
      'stop_workout': 'Stop Workout',
      'pause_workout': 'Pause',
      'resume_workout': 'Resume',
      'workout_time': 'Workout Time',
      'next_workout': 'Until next workout',
      'workout_in_progress': 'Workout in progress...',
      'workout_paused': 'Workout paused...',
      'goal_remaining': 'Goal until',
      'goal_setting': 'Set Goal',
      'monthly_activity': 'This month activity',
      'days': 'days',
      'schedule': 'Schedule',
      'fixed_workout_days': 'Fixed Workout Days',
      'set_schedule': 'Set Workout Schedule',
      'cancel_schedule': 'Cancel Schedule',
      'close': 'Close',
      'weight_input': 'Weight Input',
      'current_weight': 'Current Weight (kg)',
      'save': 'Save',
      'cancel': 'Cancel',
      'records': 'Records',
      'workout_records': 'Workout Records',
      'weight_records': 'Weight Records',
      'no_workout_records': 'No workout records',
      'no_weight_records': 'No weight records',
      'profile': 'Profile',
      'app_settings': 'App Settings',
      'account': 'Account',
      'info': 'Info',
      'dark_mode': 'Dark Mode',
      'dark_mode_subtitle': 'Switch to dark theme',
      'language': 'Language',
      'notifications': 'Notification Settings',
      'notification_subtitle': 'Manage push notifications',
      'privacy': 'Privacy Settings',
      'privacy_subtitle': 'Data management and security',
      'backup': 'Data Backup',
      'backup_subtitle': 'Data save and restore',
      'logout': 'Logout',
      'logout_subtitle': 'Sign out from account',
      'help': 'Help & Support',
      'help_subtitle': 'FAQ and support',
      'version': 'Version',
      'last_workout': 'Since last workout',
      'create_schedule': 'Please create a workout schedule',
      'skip_workout': 'Skip',
      'minutes': 'min',
      'seconds': 'sec',
      'edit_profile': 'Edit Profile',
      'user_name': 'User Name',
      'user_email': 'Email',
      'select_language': 'Select Language',
      'korean': 'Korean',
      'japanese': 'Japanese',
      'english': 'English',
      'search_placeholder': 'Find my workout!',
      'favorites': 'Favorites',
      'squat': 'Squat',
      'push_up': 'Push Up',
      'plank': 'Plank',
      'lunges': 'Lunges',
      'burpees': 'Burpees',
      'mountain_climber': 'Mountain Climber',
      'routine1': 'Routine 1',
      'routine2': 'Routine 2',
      'add_to_favorites': 'Add to Favorites',
      'remove_from_favorites': 'Remove from Favorites',
      'create_routine': 'Create New Routine',
      'routine_name': 'Routine Name',
      'select_exercises': 'Select Exercises',
      'add_exercise': 'Add Exercise',
      'save_routine': 'Save Routine',
      'search_exercises': 'Search exercises...',
    },
  };

  static String getText(String key, String language) {
    return _translations[language]?[key] ?? _translations['日本語']![key]!;
  }
}

void main() {
  runApp(const TramiApp());
}

class TramiApp extends StatelessWidget {
  const TramiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trami',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF87CEEB)),
        useMaterial3: true,
        fontFamily: 'NotoSans',
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  bool _isDarkMode = false;
  String _selectedLanguage = '日本語';

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('is_dark_mode') ?? false;
      _selectedLanguage = prefs.getString('selected_language') ?? '日本語';
    });
  }

  void _updateDarkMode(bool isDark) {
    setState(() {
      _isDarkMode = isDark;
    });
  }

  void _updateLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
  }

  List<Widget> get _screens => [
    HomeScreen(isDarkMode: _isDarkMode, language: _selectedLanguage),
    RoutineScreen(isDarkMode: _isDarkMode, language: _selectedLanguage),
    LogScreen(isDarkMode: _isDarkMode, language: _selectedLanguage),
    SettingScreen(
      isDarkMode: _isDarkMode,
      onDarkModeChanged: _updateDarkMode,
      language: _selectedLanguage,
      onLanguageChanged: _updateLanguage,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode
          ? const Color(0xFF121212)
          : const Color(0xFFF8F9FA),
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: _isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
          boxShadow: [
            BoxShadow(
              color: _isDarkMode
                  ? Colors.black.withOpacity(0.3)
                  : Colors.black12,
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: const Color(0xFF87CEEB),
          unselectedItemColor: _isDarkMode ? Colors.grey[400] : Colors.grey,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: AppLocalizations.getText(
                'home',
                _selectedLanguage,
              ).toUpperCase(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center_outlined),
              activeIcon: Icon(Icons.fitness_center),
              label: AppLocalizations.getText(
                'routine',
                _selectedLanguage,
              ).toUpperCase(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.analytics_outlined),
              activeIcon: Icon(Icons.analytics),
              label: AppLocalizations.getText(
                'log',
                _selectedLanguage,
              ).toUpperCase(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings),
              label: AppLocalizations.getText(
                'setting',
                _selectedLanguage,
              ).toUpperCase(),
            ),
          ],
        ),
      ),
    );
  }
}

// 운동 기록 데이터 모델
class WorkoutRecord {
  final DateTime date;
  final int duration; // seconds
  final String type;

  WorkoutRecord({
    required this.date,
    required this.duration,
    required this.type,
  });

  Map<String, dynamic> toJson() => {
    'date': date.toIso8601String(),
    'duration': duration,
    'type': type,
  };

  factory WorkoutRecord.fromJson(Map<String, dynamic> json) => WorkoutRecord(
    date: DateTime.parse(json['date']),
    duration: json['duration'],
    type: json['type'],
  );
}

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final String language;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.language,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  Timer? _timer;
  bool _isWorkoutMode = false;
  bool _isPaused = false;

  // D-Day 카운트다운용
  int _days = 3;
  int _hours = 12;
  int _minutes = 24;
  int _seconds = 42;

  // 스탑워치용
  int _workoutHours = 0;
  int _workoutMinutes = 0;
  int _workoutSeconds = 0;

  // 애니메이션 컨트롤러
  late AnimationController _animationController;
  late AnimationController _progressController;

  // 달력 및 운동 기록
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<DateTime> _workoutDays = [];
  List<int> _fixedWorkoutDays = []; // 0=Sunday, 1=Monday, etc.
  List<WorkoutRecord> _workoutRecords = [];
  DateTime? _nextWorkoutDate;
  List<DateTime> _scheduledDays = [];

  @override
  void initState() {
    super.initState();
    _loadData();
    _startCountdownTimer();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _progressController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();

    // 운동한 날짜들 로드
    final workoutDaysJson = prefs.getStringList('workout_days') ?? [];
    _workoutDays = workoutDaysJson.map((e) => DateTime.parse(e)).toList();

    // 고정 운동일 로드
    _fixedWorkoutDays =
        prefs
            .getStringList('fixed_workout_days')
            ?.map((e) => int.parse(e))
            .toList() ??
        [];

    // 운동 기록 로드
    final recordsJson = prefs.getStringList('workout_records') ?? [];
    _workoutRecords = recordsJson
        .map((e) => WorkoutRecord.fromJson(jsonDecode(e)))
        .toList();

    // 예정된 운동일 로드
    final scheduledJson = prefs.getStringList('scheduled_workout_days') ?? [];
    _scheduledDays = scheduledJson.map((e) => DateTime.parse(e)).toList();

    _calculateNextWorkoutDate();
    setState(() {});
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();

    // 운동한 날짜들 저장
    await prefs.setStringList(
      'workout_days',
      _workoutDays.map((e) => e.toIso8601String()).toList(),
    );

    // 고정 운동일 저장
    await prefs.setStringList(
      'fixed_workout_days',
      _fixedWorkoutDays.map((e) => e.toString()).toList(),
    );

    // 운동 기록 저장
    await prefs.setStringList(
      'workout_records',
      _workoutRecords.map((e) => jsonEncode(e.toJson())).toList(),
    );

    // 예정된 운동일 저장
    await prefs.setStringList(
      'scheduled_workout_days',
      _scheduledDays
          .map((e) => DateTime(e.year, e.month, e.day).toIso8601String())
          .toList(),
    );
  }

  void _calculateNextWorkoutDate() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    // 후보 1: 사용자가 직접 지정한 예정일 중 오늘 이후(오늘 포함)
    final scheduledCandidates = _scheduledDays
        .map((d) => DateTime(d.year, d.month, d.day))
        .where((d) => !d.isBefore(today))
        .toList();

    // 후보 2: 고정 운동일의 다음 14일 내 발생일들
    final List<DateTime> fixedCandidates = [];
    for (int i = 0; i < 14; i++) {
      final checkDate = today.add(Duration(days: i));
      if (_fixedWorkoutDays.contains(checkDate.weekday % 7)) {
        fixedCandidates.add(checkDate);
      }
    }

    final allCandidates = <DateTime>[
      ...scheduledCandidates,
      ...fixedCandidates,
    ];
    allCandidates.sort();
    _nextWorkoutDate = allCandidates.isNotEmpty ? allCandidates.first : null;
    _calculateCountdown();
  }

  void _calculateCountdown() {
    if (_nextWorkoutDate == null) return;

    final now = DateTime.now();
    // 목표는 해당 날짜의 00:00:00
    final target = DateTime(
      _nextWorkoutDate!.year,
      _nextWorkoutDate!.month,
      _nextWorkoutDate!.day,
    );
    final difference = target.difference(now);

    setState(() {
      _days = difference.inDays;
      _hours = difference.inHours % 24;
      _minutes = difference.inMinutes % 60;
      _seconds = difference.inSeconds % 60;
    });
  }

  void _startCountdownTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // 매 틱마다 남은 시간 재계산하여 정확도 유지
      _calculateCountdown();
    });
  }

  void _startWorkoutTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isPaused) {
        setState(() {
          _workoutSeconds++;
          if (_workoutSeconds >= 60) {
            _workoutSeconds = 0;
            _workoutMinutes++;
            if (_workoutMinutes >= 60) {
              _workoutMinutes = 0;
              _workoutHours++;
            }
          }
        });
      }
    });
  }

  void _startWorkoutMode() {
    setState(() {
      _isWorkoutMode = true;
      _isPaused = false;
      _timer?.cancel();

      // 운동 모드 시작
      _workoutHours = 0;
      _workoutMinutes = 0;
      _workoutSeconds = 0;
      _startWorkoutTimer();
      _animationController.repeat();
      _progressController.forward();
    });
  }

  void _pauseWorkout() {
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _finishWorkout() {
    _showFinishDialog();
  }

  void _endWorkout() {
    setState(() {
      _isWorkoutMode = false;
      _isPaused = false;
      _timer?.cancel();

      // 운동 기록 저장
      final totalSeconds =
          _workoutHours * 3600 + _workoutMinutes * 60 + _workoutSeconds;
      if (totalSeconds > 0) {
        final record = WorkoutRecord(
          date: DateTime.now(),
          duration: totalSeconds,
          type: '근력운동',
        );
        _workoutRecords.add(record);

        // 오늘을 운동한 날로 추가
        final today = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
        );
        if (!_workoutDays.any((d) => isSameDay(d, today))) {
          _workoutDays.add(today);
        }

        _saveData();
      }

      // 대기 모드로 돌아가기
      _calculateNextWorkoutDate();
      _startCountdownTimer();
      _animationController.stop();
      _animationController.reset();
      _progressController.reset();
    });
  }

  String _getTimerText() {
    if (_isWorkoutMode) {
      // 스탑워치 모드: 00:00:00 형식
      return '${_workoutHours.toString().padLeft(2, '0')}:${_workoutMinutes.toString().padLeft(2, '0')}:${_workoutSeconds.toString().padLeft(2, '0')}';
    } else {
      // D-Day 모드
      if (_days > 0) {
        // 1일 이상 남은 경우: 3일 12:24:42
        return '$_days일 ${_hours.toString().padLeft(2, '0')}:${_minutes.toString().padLeft(2, '0')}:${_seconds.toString().padLeft(2, '0')}';
      } else {
        // 1일 미만 남은 경우: 12:24:42
        return '${_hours.toString().padLeft(2, '0')}:${_minutes.toString().padLeft(2, '0')}:${_seconds.toString().padLeft(2, '0')}';
      }
    }
  }

  void _showCalendarDialog() {
    // 항상 오늘 기준으로 달력을 열도록 초기화
    setState(() {
      _focusedDay = DateTime.now();
      _selectedDay = DateTime.now();
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            // 화면의 80% 높이로 크게
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                // 상단 제목: "8月のスケジュール" 형식
                Text(
                  '${_focusedDay.month}月のスケジュール',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: TableCalendar<String>(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: _focusedDay,
                    calendarFormat: CalendarFormat.month,
                    eventLoader: (day) {
                      final isDone = _workoutDays.any((d) => isSameDay(d, day));
                      final isScheduled = _scheduledDays.any(
                        (d) => isSameDay(d, day),
                      );
                      final List<String> events = [];
                      if (isDone) events.add('done');
                      if (isScheduled) events.add('scheduled');
                      return events;
                    },
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    calendarStyle: const CalendarStyle(
                      outsideDaysVisible: false,
                      weekendTextStyle: TextStyle(color: Colors.red),
                      holidayTextStyle: TextStyle(color: Colors.red),
                    ),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    calendarBuilders: CalendarBuilders(
                      markerBuilder: (context, day, events) {
                        if (events.isEmpty) return null;
                        // 여러 이벤트를 작은 점 두 개로 표현
                        return Positioned(
                          right: 4,
                          bottom: 4,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (events.contains('scheduled'))
                                Container(
                                  width: 6,
                                  height: 6,
                                  margin: const EdgeInsets.only(right: 2),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF2196F3), // 파란색: 예정
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              if (events.contains('done'))
                                Container(
                                  width: 6,
                                  height: 6,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF4CAF50), // 초록색: 완료
                                    shape: BoxShape.circle,
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                      defaultBuilder: (context, day, focusedDay) {
                        // 고정 운동일 표시
                        if (_fixedWorkoutDays.contains(day.weekday % 7)) {
                          return Container(
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF87CEEB).withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                '${day.day}',
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        }
                        return null;
                      },
                    ),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                  ),
                ),
                const SizedBox(height: 10),
                // 선택 날짜를 운동 예정으로 등록/해제
                if (_selectedDay != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: ElevatedButton(
                      onPressed: () {
                        final sel = DateTime(
                          _selectedDay!.year,
                          _selectedDay!.month,
                          _selectedDay!.day,
                        );
                        setState(() {
                          final exists = _scheduledDays.any(
                            (d) => isSameDay(d, sel),
                          );
                          if (exists) {
                            _scheduledDays.removeWhere(
                              (d) => isSameDay(d, sel),
                            );
                          } else {
                            _scheduledDays.add(sel);
                          }
                          _saveData();
                          _calculateNextWorkoutDate();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2196F3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        _scheduledDays.any(
                              (d) =>
                                  _selectedDay != null &&
                                  isSameDay(d, _selectedDay!),
                            )
                            ? '予定解除'
                            : '運動予定にする',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                // 고정 운동일 인라인 설정
                const SizedBox(height: 4),
                const Text(
                  '固定運動日',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(7, (index) {
                    final dayNames = ['日', '月', '火', '水', '木', '金', '土'];
                    final selected = _fixedWorkoutDays.contains(index);
                    return ChoiceChip(
                      label: Text(dayNames[index]),
                      selected: selected,
                      selectedColor: const Color(0xFF87CEEB).withOpacity(0.8),
                      onSelected: (bool value) {
                        setState(() {
                          if (value) {
                            if (!_fixedWorkoutDays.contains(index)) {
                              _fixedWorkoutDays.add(index);
                            }
                          } else {
                            _fixedWorkoutDays.remove(index);
                          }
                          _fixedWorkoutDays.sort();
                          _saveData();
                          _calculateNextWorkoutDate();
                        });
                      },
                    );
                  }),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          '閉じる',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showFixedWorkoutDaysDialog() {
    List<int> tempFixedDays = List.from(_fixedWorkoutDays);
    final dayNames = ['日', '月', '火', '水', '木', '金', '土'];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('固定運動日設定'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(7, (index) {
                  return CheckboxListTile(
                    title: Text('${dayNames[index]}曜日'),
                    value: tempFixedDays.contains(index),
                    onChanged: (bool? value) {
                      setDialogState(() {
                        if (value == true) {
                          tempFixedDays.add(index);
                        } else {
                          tempFixedDays.remove(index);
                        }
                      });
                    },
                  );
                }),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('キャンセル'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _fixedWorkoutDays = tempFixedDays;
                      _calculateNextWorkoutDate();
                    });
                    _saveData();
                    Navigator.of(context).pop();
                  },
                  child: const Text('保存'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showFinishDialog() {
    final totalSeconds =
        _workoutHours * 3600 + _workoutMinutes * 60 + _workoutSeconds;
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'お疲れ様でした🎉',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  '今日の運動時間',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 10),
                Text(
                  '$minutes分$seconds秒',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 120,
                      height: 45,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF87CEEB), Color(0xFF4FC3F7)],
                        ),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          // TODO: 다음 운동일 설정 화면으로 이동
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                        child: const Text(
                          '次の運動日設定',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 45,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF4CAF50), Color(0xFF66BB6A)],
                        ),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          // TODO: 체중 입력 화면으로 이동
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                        child: const Text(
                          '体重の入力に',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _endWorkout();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    child: const Text(
                      '終了',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode
          ? const Color(0xFF121212)
          : const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Header with icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF87CEEB).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: GestureDetector(
                      onTap: _showCalendarDialog,
                      child: const Icon(
                        Icons.calendar_today_outlined,
                        color: Color(0xFF87CEEB),
                        size: 24,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF87CEEB).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.speed_outlined,
                      color: Color(0xFF87CEEB),
                      size: 24,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Goal and activity stats
              Column(
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(text: 'ゴールまであと '),
                        TextSpan(
                          text: '6kg',
                          style: TextStyle(
                            color: Color(0xFFFF6B9D),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        const TextSpan(text: '今月活動日数 '),
                        TextSpan(
                          text:
                              '${_workoutDays.where((d) => d.month == DateTime.now().month).length}日',
                          style: const TextStyle(
                            color: Color(0xFFFF6B9D),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60),

              // Circular timer
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 280,
                    height: 280,
                    child: AnimatedBuilder(
                      animation: _isWorkoutMode
                          ? _progressController
                          : _animationController,
                      builder: (context, child) {
                        return CircularProgressIndicator(
                          value: _isWorkoutMode
                              ? _progressController.value
                              : 0.3,
                          strokeWidth: 12,
                          backgroundColor: Colors.grey.withOpacity(0.2),
                          valueColor: _isWorkoutMode
                              ? AlwaysStoppedAnimation<Color>(
                                  Color.lerp(
                                    const Color(0xFF4CAF50), // 초록색
                                    const Color(0xFF2196F3), // 파란색
                                    (sin(_animationController.value * 2 * pi) +
                                            1) /
                                        2,
                                  )!,
                                )
                              : const AlwaysStoppedAnimation<Color>(
                                  Color(0xFF87CEEB),
                                ),
                        );
                      },
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        _isWorkoutMode
                            ? AppLocalizations.getText(
                                'workout_time',
                                widget.language,
                              )
                            : AppLocalizations.getText(
                                'next_workout',
                                widget.language,
                              ),
                        style: TextStyle(
                          fontSize: 16,
                          color: widget.isDarkMode
                              ? Colors.grey[400]
                              : Colors.black54,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _getTimerText(),
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: widget.isDarkMode
                              ? Colors.white
                              : Colors.black87,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color:
                              (_isWorkoutMode
                                      ? const Color(0xFF4CAF50)
                                      : const Color(0xFF87CEEB))
                                  .withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _isWorkoutMode
                              ? (_isPaused
                                    ? AppLocalizations.getText(
                                        'workout_paused',
                                        widget.language,
                                      )
                                    : AppLocalizations.getText(
                                        'workout_in_progress',
                                        widget.language,
                                      ))
                              : '8月22日 火曜日',
                          style: TextStyle(
                            fontSize: 14,
                            color: _isWorkoutMode
                                ? const Color(0xFF4CAF50)
                                : const Color(0xFF87CEEB),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const Spacer(),

              // Workout buttons
              if (!_isWorkoutMode)
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF87CEEB), Color(0xFF4FC3F7)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF87CEEB).withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: _startWorkoutMode,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.getText(
                        'start_workout',
                        widget.language,
                      ),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              if (_isWorkoutMode)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // 一時停止 버튼
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: _isPaused
                              ? [
                                  const Color(0xFF4CAF50),
                                  const Color(0xFF66BB6A),
                                ]
                              : [
                                  const Color(0xFFFFA726),
                                  const Color(0xFFFFB74D),
                                ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color:
                                (_isPaused
                                        ? const Color(0xFF4CAF50)
                                        : const Color(0xFFFFA726))
                                    .withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: _pauseWorkout,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          _isPaused
                              ? AppLocalizations.getText(
                                  'resume_workout',
                                  widget.language,
                                )
                              : AppLocalizations.getText(
                                  'pause_workout',
                                  widget.language,
                                ),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    // 終了 버튼
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFE57373), Color(0xFFEF5350)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFE57373).withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: _finishWorkout,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.getText(
                            'stop_workout',
                            widget.language,
                          ),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 16),

              // Skip button (운동 모드가 아닐 때만 표시)
              if (!_isWorkoutMode)
                TextButton(
                  onPressed: () {
                    // TODO: 스킵 기능 구현
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF87CEEB),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

              const SizedBox(height: 20),

              // Bottom instruction (운동 모드가 아닐 때만 표시)
              if (!_isWorkoutMode)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.grey.withOpacity(0.6),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '下にスライドして今日の運動プランを立てる',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.withOpacity(0.8),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Placeholder screens for other tabs
class RoutineScreen extends StatefulWidget {
  final bool isDarkMode;
  final String language;

  const RoutineScreen({
    super.key,
    required this.isDarkMode,
    required this.language,
  });

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _favoriteExercises = [];
  List<Map<String, dynamic>> _routines = []; // 루틴 이름과 운동 목록을 저장
  List<String> _allExercises = [
    'squat',
    'push_up',
    'plank',
    'lunges',
    'burpees',
    'mountain_climber',
  ];
  List<String> _filteredExercises = [];
  bool _showSearchResults = false;

  @override
  void initState() {
    super.initState();
    _filteredExercises = _allExercises;
    _loadData();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      if (_searchController.text.isEmpty) {
        _showSearchResults = false;
        _filteredExercises = _allExercises;
      } else {
        _showSearchResults = true;
        _filteredExercises = _allExercises
            .where(
              (exercise) => AppLocalizations.getText(
                exercise,
                widget.language,
              ).toLowerCase().contains(_searchController.text.toLowerCase()),
            )
            .toList();
      }
    });
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoriteExercises = prefs.getStringList('favorite_exercises') ?? [];
      final routinesJson = prefs.getStringList('user_routines') ?? [];
      _routines = routinesJson
          .map((routine) => jsonDecode(routine) as Map<String, dynamic>)
          .toList();
    });
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorite_exercises', _favoriteExercises);
    final routinesJson = _routines
        .map((routine) => jsonEncode(routine))
        .toList();
    await prefs.setStringList('user_routines', routinesJson);
  }

  void _toggleFavorite(String exercise) {
    setState(() {
      if (_favoriteExercises.contains(exercise)) {
        _favoriteExercises.remove(exercise);
      } else {
        _favoriteExercises.add(exercise);
      }
    });
    _saveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode
          ? const Color(0xFF121212)
          : const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            // 검색바
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildSearchBar(),
            ),

            // 스크롤 가능한 컨텐츠
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 검색 결과 또는 즐겨찾기 섹션
                    if (_showSearchResults)
                      _buildSearchResults()
                    else
                      _buildFavoritesSection(),

                    const SizedBox(height: 32),

                    // 루틴 섹션
                    _buildRoutineSection(),

                    const SizedBox(height: 100), // FAB을 위한 여백
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showCreateRoutineDialog,
        backgroundColor: const Color(0xFF87CEEB),
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          AppLocalizations.getText('create_routine', widget.language),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: widget.isDarkMode ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        style: TextStyle(
          color: widget.isDarkMode ? Colors.white : Colors.black,
        ),
        decoration: InputDecoration(
          hintText: AppLocalizations.getText(
            'search_placeholder',
            widget.language,
          ),
          hintStyle: TextStyle(
            color: widget.isDarkMode ? Colors.grey[400] : Colors.grey[600],
          ),
          prefixIcon: Icon(
            Icons.search,
            color: widget.isDarkMode ? Colors.grey[400] : Colors.grey[600],
          ),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: widget.isDarkMode
                        ? Colors.grey[400]
                        : Colors.grey[600],
                  ),
                  onPressed: () {
                    _searchController.clear();
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.getText('search_exercises', widget.language),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: widget.isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${_filteredExercises.length}개의 운동을 찾았습니다',
          style: TextStyle(
            fontSize: 14,
            color: widget.isDarkMode ? Colors.grey[400] : Colors.grey[600],
          ),
        ),
        const SizedBox(height: 16),
        if (_filteredExercises.isEmpty)
          Center(
            child: Column(
              children: [
                Icon(
                  Icons.search_off,
                  size: 48,
                  color: widget.isDarkMode
                      ? Colors.grey[600]
                      : Colors.grey[400],
                ),
                const SizedBox(height: 8),
                Text(
                  '검색 결과가 없습니다',
                  style: TextStyle(
                    color: widget.isDarkMode
                        ? Colors.grey[400]
                        : Colors.grey[600],
                  ),
                ),
              ],
            ),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _filteredExercises.length,
            itemBuilder: (context, index) {
              return _buildSearchResultCard(_filteredExercises[index]);
            },
          ),
      ],
    );
  }

  Widget _buildSearchResultCard(String exerciseKey) {
    final isFavorite = _favoriteExercises.contains(exerciseKey);

    // 운동별 아이콘 매핑
    final iconMap = {
      'squat': Icons.accessibility_new,
      'push_up': Icons.fitness_center,
      'plank': Icons.airline_seat_flat,
      'lunges': Icons.directions_walk,
      'burpees': Icons.speed,
      'mountain_climber': Icons.terrain,
    };

    // 운동별 색상 매핑
    final colorMap = {
      'squat': Colors.purple,
      'push_up': Colors.blue,
      'plank': Colors.orange,
      'lunges': Colors.green,
      'burpees': Colors.red,
      'mountain_climber': Colors.teal,
    };

    final icon = iconMap[exerciseKey] ?? Icons.fitness_center;
    final color = colorMap[exerciseKey] ?? Colors.blue;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color.withOpacity(0.1), color.withOpacity(0.2)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _toggleFavorite(exerciseKey),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    AppLocalizations.getText(exerciseKey, widget.language),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: widget.isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => _toggleFavorite(exerciseKey),
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : color,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFavoritesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            AppLocalizations.getText('favorites', widget.language),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: widget.isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 16),
        if (_favoriteExercises.isEmpty)
          Center(
            child: Text(
              '즐겨찾기한 운동이 없습니다',
              style: TextStyle(
                color: widget.isDarkMode ? Colors.grey[400] : Colors.grey[600],
              ),
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: _favoriteExercises.length,
            itemBuilder: (context, index) {
              return _buildFavoriteCard(_favoriteExercises[index]);
            },
          ),
      ],
    );
  }

  Widget _buildFavoriteCard(String exerciseKey) {
    // 운동별 아이콘 매핑
    final iconMap = {
      'squat': Icons.accessibility_new,
      'push_up': Icons.fitness_center,
      'plank': Icons.airline_seat_flat,
      'lunges': Icons.directions_walk,
      'burpees': Icons.speed,
      'mountain_climber': Icons.terrain,
    };

    // 운동별 색상 매핑
    final colorMap = {
      'squat': Colors.purple,
      'push_up': Colors.blue,
      'plank': Colors.orange,
      'lunges': Colors.green,
      'burpees': Colors.red,
      'mountain_climber': Colors.teal,
    };

    final icon = iconMap[exerciseKey] ?? Icons.fitness_center;
    final color = colorMap[exerciseKey] ?? Colors.blue;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color.withOpacity(0.7), color.withOpacity(0.9)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 32),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.getText(exerciseKey, widget.language),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoutineSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            AppLocalizations.getText('routine', widget.language),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: widget.isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 16),
        if (_routines.isEmpty)
          Center(
            child: Text(
              '생성된 루틴이 없습니다',
              style: TextStyle(
                color: widget.isDarkMode ? Colors.grey[400] : Colors.grey[600],
              ),
            ),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _routines.length,
            itemBuilder: (context, index) {
              return _buildRoutineCard(_routines[index]);
            },
          ),
      ],
    );
  }

  void _showCreateRoutineDialog() {
    final TextEditingController nameController = TextEditingController();
    List<String> selectedExercises = [];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: widget.isDarkMode
                  ? Colors.grey[800]
                  : Colors.white,
              title: Text(
                AppLocalizations.getText('create_routine', widget.language),
                style: TextStyle(
                  color: widget.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      style: TextStyle(
                        color: widget.isDarkMode ? Colors.white : Colors.black,
                      ),
                      decoration: InputDecoration(
                        labelText: AppLocalizations.getText(
                          'routine_name',
                          widget.language,
                        ),
                        labelStyle: TextStyle(
                          color: widget.isDarkMode
                              ? Colors.grey[400]
                              : Colors.grey[600],
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: widget.isDarkMode
                                ? Colors.grey[600]!
                                : Colors.grey[400]!,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppLocalizations.getText(
                        'select_exercises',
                        widget.language,
                      ),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: widget.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ..._allExercises
                        .map(
                          (exercise) => CheckboxListTile(
                            title: Text(
                              AppLocalizations.getText(
                                exercise,
                                widget.language,
                              ),
                              style: TextStyle(
                                color: widget.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            value: selectedExercises.contains(exercise),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == true) {
                                  selectedExercises.add(exercise);
                                } else {
                                  selectedExercises.remove(exercise);
                                }
                              });
                            },
                            activeColor: Colors.blue,
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    AppLocalizations.getText('cancel', widget.language),
                    style: TextStyle(
                      color: widget.isDarkMode
                          ? Colors.grey[400]
                          : Colors.grey[600],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        selectedExercises.isNotEmpty) {
                      setState(() {
                        _routines.add({
                          'name': nameController.text,
                          'exercises': selectedExercises,
                          'createdAt': DateTime.now().toIso8601String(),
                        });
                      });
                      _saveData();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    AppLocalizations.getText('save_routine', widget.language),
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildRoutineCard(Map<String, dynamic> routine) {
    final routineName = routine['name'] as String;
    final exercises = (routine['exercises'] as List<dynamic>).cast<String>();

    // 루틴 인덱스에 따라 다른 색상 적용
    final index = _routines.indexOf(routine);
    final colors = [
      [const Color(0xFF667EEA), const Color(0xFF764BA2)],
      [const Color(0xFFF093FB), const Color(0xFFF5576C)],
      [const Color(0xFF4FACFE), const Color(0xFF00F2FE)],
      [const Color(0xFF43E97B), const Color(0xFF38F9D7)],
      [const Color(0xFFFA709A), const Color(0xFFFEE140)],
    ];

    final colorPair = colors[index % colors.length];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colorPair,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorPair[0].withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // 루틴 시작 로직 (나중에 구현)
            _showRoutineDetails(routine);
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.play_circle_filled,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        routineName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${exercises.length} ${AppLocalizations.getText('select_exercises', widget.language)}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, color: Colors.white),
                  onSelected: (value) {
                    if (value == 'delete') {
                      setState(() {
                        _routines.remove(routine);
                      });
                      _saveData();
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete, color: Colors.red),
                          SizedBox(width: 8),
                          Text('삭제'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showRoutineDetails(Map<String, dynamic> routine) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: widget.isDarkMode ? Colors.grey[800] : Colors.white,
        title: Text(
          routine['name'],
          style: TextStyle(
            color: widget.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '포함된 운동:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: widget.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            ...((routine['exercises'] as List<dynamic>).cast<String>().map(
              (exercise) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  '• ${AppLocalizations.getText(exercise, widget.language)}',
                  style: TextStyle(
                    color: widget.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
            )),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('닫기'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // 루틴 시작 로직
            },
            child: Text('시작하기'),
          ),
        ],
      ),
    );
  }
}

class LogScreen extends StatefulWidget {
  final bool isDarkMode;
  final String language;

  const LogScreen({
    super.key,
    required this.isDarkMode,
    required this.language,
  });

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  List<WorkoutRecord> _workoutRecords = [];

  @override
  void initState() {
    super.initState();
    _loadWorkoutRecords();
  }

  Future<void> _loadWorkoutRecords() async {
    final prefs = await SharedPreferences.getInstance();
    final recordsJson = prefs.getStringList('workout_records') ?? [];
    setState(() {
      _workoutRecords =
          recordsJson.map((e) => WorkoutRecord.fromJson(jsonDecode(e))).toList()
            ..sort((a, b) => b.date.compareTo(a.date));
    });
  }

  String _formatDuration(int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    if (hours > 0) {
      return '$hours時間$minutes分$seconds秒';
    } else {
      return '$minutes分$seconds秒';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          '運動記録',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _workoutRecords.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.fitness_center_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    '運動記録がありません',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _workoutRecords.length,
              itemBuilder: (context, index) {
                final record = _workoutRecords[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF87CEEB).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Icon(
                          Icons.fitness_center,
                          color: Color(0xFF87CEEB),
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              record.type,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${record.date.year}年${record.date.month}月${record.date.day}日',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        _formatDuration(record.duration),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4CAF50),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

class SettingScreen extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onDarkModeChanged;
  final String language;
  final Function(String) onLanguageChanged;

  const SettingScreen({
    super.key,
    required this.isDarkMode,
    required this.onDarkModeChanged,
    required this.language,
    required this.onLanguageChanged,
  });

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String _userName = 'ユーザー';
  String _userEmail = 'user@example.com';

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('user_name') ?? 'ユーザー';
      _userEmail = prefs.getString('user_email') ?? 'user@example.com';
    });
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_dark_mode', widget.isDarkMode);
    await prefs.setString('selected_language', widget.language);
    await prefs.setString('user_name', _userName);
    await prefs.setString('user_email', _userEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode
          ? const Color(0xFF121212)
          : const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text(
          AppLocalizations.getText('setting', widget.language),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: widget.isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 프로필 섹션
          _buildProfileSection(),
          const SizedBox(height: 24),

          // 앱 설정 섹션
          _buildAppSettingsSection(),
          const SizedBox(height: 24),

          // 언어 설정 섹션
          _buildLanguageSection(),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: widget.isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: widget.isDarkMode
                ? Colors.black.withOpacity(0.3)
                : Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.getText('profile', widget.language),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: widget.isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF87CEEB).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.person,
                  size: 30,
                  color: Color(0xFF87CEEB),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _userName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: widget.isDarkMode
                            ? Colors.white
                            : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _userEmail,
                      style: TextStyle(
                        fontSize: 14,
                        color: widget.isDarkMode
                            ? Colors.grey[400]
                            : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppSettingsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: widget.isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: widget.isDarkMode
                ? Colors.black.withOpacity(0.3)
                : Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.getText('app_settings', widget.language),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: widget.isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          _buildSettingItem(
            icon: Icons.dark_mode,
            title: AppLocalizations.getText('dark_mode', widget.language),
            subtitle: AppLocalizations.getText(
              'dark_mode_subtitle',
              widget.language,
            ),
            trailing: Switch(
              value: widget.isDarkMode,
              onChanged: (value) {
                widget.onDarkModeChanged(value);
                _saveSettings();
              },
              activeColor: const Color(0xFF87CEEB),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: widget.isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: widget.isDarkMode
                ? Colors.black.withOpacity(0.3)
                : Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.getText('language', widget.language),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: widget.isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          _buildLanguageOption('日本語', '日本語'),
          _buildLanguageOption('한국어', '한국어'),
          _buildLanguageOption('English', 'English'),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(String value, String label) {
    return RadioListTile<String>(
      title: Text(
        label,
        style: TextStyle(
          color: widget.isDarkMode ? Colors.white : Colors.black87,
        ),
      ),
      value: value,
      groupValue: widget.language,
      onChanged: (String? newValue) {
        if (newValue != null) {
          widget.onLanguageChanged(newValue);
          _saveSettings();
        }
      },
      activeColor: const Color(0xFF87CEEB),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget trailing,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF87CEEB)),
      title: Text(
        title,
        style: TextStyle(
          color: widget.isDarkMode ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: widget.isDarkMode ? Colors.grey[400] : Colors.grey[600],
        ),
      ),
      trailing: trailing,
      contentPadding: EdgeInsets.zero,
    );
  }
}
