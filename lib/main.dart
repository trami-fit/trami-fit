import 'package:flutter/material.dart';
import 'dart:async';
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
      'next': '次へ',
      'back': '戻る',
      // 추가 운동 키 (일본어)
      'dumbbell_fly': 'ダンベルフライ',
      'overhead_extension': 'オーバーヘッドエクステンション',
      'bicep_curl': 'バイセップカール',
      'tricep_dips': 'トライセプスディップス',
      'shoulder_press': 'ショルダープレス',
      'deadlift': 'デッドリフト',
      'bench_press': 'ベンチプレス',
      'pull_up': '懸垂',
      'sit_up': 'シットアップ',
      'crunches': 'クランチ',
      'jumping_jacks': 'ジャンピングジャック',
      'sun_salutation': '太陽礼拝',
      'downward_dog': 'ダウンドッグ',
      'warrior_pose': 'ウォーリアポーズ',
      'tree_pose': '木のポーズ',
      'child_pose': 'チャイルドポーズ',
      'cobra_pose': 'コブラのポーズ',
      'bridge_pose': 'ブリッジ',
      'cat_cow': 'キャット＆カウ',
      'pigeon_pose': 'ピジョンポーズ',
      'wall_sit': 'ウォールシット',
      'glute_bridge': 'グルートブリッジ',
      'high_knees': 'ハイニー',
      'butt_kicks': 'バットキック',
      'side_plank': 'サイドプランク',
      // 상체 추가
      'lateral_raise': 'ラテラルレイズ',
      'front_raise': 'フロントレイズ',
      'arnold_press': 'アーノルドプレス',
      'hammer_curl': 'ハンマーカール',
      'concentration_curl': 'コンセントレーションカール',
      'skull_crusher': 'スカルクラッシャー',
      'chest_press': 'チェストプレス',
      'incline_press': 'インクラインプレス',
      'decline_press': 'デクラインプレス',
      'cable_crossover': 'ケーブルクロスオーバー',
      'pec_deck': 'ペックデック',
      'tricep_pushdown': 'トライセッププッシュダウン',
      'rope_pulldown': 'ロープラットプルダウン',
      'overhead_tricep': 'オーバーヘッドトライセップ',
      // 하체 추가
      'romanian_deadlift': 'ルーマニアンデッドリフト',
      'sumo_deadlift': '相撲デッドリフト',
      'front_squat': 'フロントスクワット',
      'goblet_squat': 'ゴブレットスクワット',
      'bulgarian_split_squat': 'ブルガリアンスプリットスクワット',
      'leg_press': 'レッグプレス',
      'leg_extension': 'レッグエクステンション',
      'leg_curl': 'レッグカール',
      'calf_raise': 'カーフレイズ',
      'hip_thrust': 'ヒップスラスト',
      'step_up': 'ステップアップ',
      // 등 추가
      'chin_up': 'チンアップ',
      'lat_pulldown': 'ラットプルダウン',
      'bent_over_row': 'ベントオーバーロウ',
      'single_arm_row': 'シングルアームロウ',
      'seated_row': 'シーテッドロウ',
      't_bar_row': 'Tバーロウ',
      'face_pull': 'フェイスプル',
      'reverse_fly': 'リバースフライ',
      'shrug': 'シュラッグ',
      // 코어 추가
      'bicycle_crunch': 'バイシクルクランチ',
      'russian_twist': 'ロシアンツイスト',
      'leg_raise': 'レッグレイズ',
      'flutter_kicks': 'フラッターキック',
      'scissors_kicks': 'シザーズキック',
      'v_up': 'Vアップ',
      'hollow_hold': 'ホローホールド',
      'dead_bug': 'デッドバグ',
      'bird_dog': 'バードドッグ',
      'plank_up_down': 'プランクアップダウン',
      'plank_jack': 'プランクジャック',
      'ab_wheel': 'アブホイール',
      'hanging_leg_raise': 'ハンギングレッグレイズ',
      // 유산소 추가
      'running': 'ランニング',
      'jogging': 'ジョギング',
      'sprints': 'スプリント',
      'jump_rope': '縄跳び',
      'bear_crawl': 'ベアクロール',
      'crab_walk': 'クラブウォーク',
      'shuttle_run': 'シャトルラン',
      'stair_climb': '階段昇り',
      // 요가 추가
      'upward_dog': 'アップドッグ',
      'warrior_2': 'ウォーリア2',
      'warrior_3': 'ウォーリア3',
      'triangle_pose': '三角のポーズ',
      'half_moon': '半月のポーズ',
      'chair_pose': '椅子のポーズ',
      'boat_pose': 'ボートポーズ',
      'bow_pose': '弓のポーズ',
      'camel_pose': 'ラクダのポーズ',
      'fish_pose': '魚のポーズ',
      'seated_forward_bend': '長座前屈',
      'spinal_twist': 'スパイナルツイスト',
      // 기능성 추가
      'turkish_get_up': 'ターキッシュゲットアップ',
      'farmers_walk': 'ファーマーズウォーク',
      'sled_push': 'スレッドプッシュ',
      'sled_pull': 'スレッドプル',
      'tire_flip': 'タイヤフリップ',
      'battle_rope': 'バトルロープ',
      'medicine_ball_slam': 'メディシンボールスラム',
      'wall_ball': 'ウォールボール',
      'kettlebell_swing': 'ケトルベルスイング',
      'kettlebell_snatch': 'ケトルベルスナッチ',
      'clean_and_jerk': 'クリーン＆ジャーク',
      'power_clean': 'パワークリーン',
      'hang_clean': 'ハングクリーン',
      'snatch': 'スナッチ',
      // 플라이오메트릭 추가
      'depth_jump': 'デプスジャンプ',
      'broad_jump': 'ブロードジャンプ',
      'tuck_jump': 'タックジャンプ',
      'split_jump': 'スプリットジャンプ',
      'lateral_bound': 'ラテラルバウンド',
      'single_leg_hop': 'シングルレッグホップ',
      'plyo_push_up': 'プライオプッシュアップ',
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
      'next': '다음',
      'back': '이전',
      // 추가 운동 키 (한국어)
      'dumbbell_fly': '덤벨 플라이',
      'overhead_extension': '오버헤드 익스텐션',
      'bicep_curl': '바이셉 컬',
      'tricep_dips': '트라이셉 딥스',
      'shoulder_press': '숄더 프레스',
      'deadlift': '데드리프트',
      'bench_press': '벤치 프레스',
      'pull_up': '턱걸이',
      'sit_up': '윗몸일으키기',
      'crunches': '크런치',
      'jumping_jacks': '점핑 잭',
      'sun_salutation': '태양 경배 자세',
      'downward_dog': '다운독',
      'warrior_pose': '전사 자세',
      'tree_pose': '나무 자세',
      'child_pose': '아기 자세',
      'cobra_pose': '코브라 자세',
      'bridge_pose': '브릿지',
      'cat_cow': '고양이-소 자세',
      'pigeon_pose': '비둘기 자세',
      'wall_sit': '벽에 기대 앉기',
      'glute_bridge': '둔근 브릿지',
      'high_knees': '하이 니즈',
      'butt_kicks': '버트 킥',
      'side_plank': '사이드 플랭크',
      // 상체 추가
      'lateral_raise': '레터럴 레이즈',
      'front_raise': '프론트 레이즈',
      'arnold_press': '아놀드 프레스',
      'hammer_curl': '해머 컬',
      'concentration_curl': '컨센트레이션 컬',
      'skull_crusher': '스컬 크러셔',
      'chest_press': '체스트 프레스',
      'incline_press': '인클라인 프레스',
      'decline_press': '디클라인 프레스',
      'cable_crossover': '케이블 크로스오버',
      'pec_deck': '펙 덱',
      'tricep_pushdown': '트라이셉 푸시다운',
      'rope_pulldown': '로프 풀다운',
      'overhead_tricep': '오버헤드 트라이셉',
      // 하체 추가
      'romanian_deadlift': '루마니안 데드리프트',
      'sumo_deadlift': '스모 데드리프트',
      'front_squat': '프론트 스쿼트',
      'goblet_squat': '고블릿 스쿼트',
      'bulgarian_split_squat': '불가리안 스플릿 스쿼트',
      'leg_press': '레그 프레스',
      'leg_extension': '레그 익스텐션',
      'leg_curl': '레그 컬',
      'calf_raise': '카프 레이즈',
      'hip_thrust': '힙 스러스트',
      'step_up': '스텝 업',
      // 등 추가
      'chin_up': '친업',
      'lat_pulldown': '랫 풀다운',
      'bent_over_row': '벤트오버 로우',
      'single_arm_row': '싱글암 로우',
      'seated_row': '시티드 로우',
      't_bar_row': 'T바 로우',
      'face_pull': '페이스 풀',
      'reverse_fly': '리버스 플라이',
      'shrug': '슈러그',
      // 코어 추가
      'bicycle_crunch': '바이시클 크런치',
      'russian_twist': '러시안 트위스트',
      'leg_raise': '레그 레이즈',
      'flutter_kicks': '플러터 킥',
      'scissors_kicks': '시저스 킥',
      'v_up': 'V업',
      'hollow_hold': '할로우 홀드',
      'dead_bug': '데드 버그',
      'bird_dog': '버드 독',
      'plank_up_down': '플랭크 업다운',
      'plank_jack': '플랭크 잭',
      'ab_wheel': '복근 휠',
      'hanging_leg_raise': '행잉 레그 레이즈',
      // 유산소 추가
      'running': '달리기',
      'jogging': '조깅',
      'sprints': '스프린트',
      'jump_rope': '줄넘기',
      'bear_crawl': '베어 크롤',
      'crab_walk': '크랩 워크',
      'shuttle_run': '왕복 달리기',
      'stair_climb': '계단 오르기',
      // 요가 추가
      'upward_dog': '업독',
      'warrior_2': '전사 2 자세',
      'warrior_3': '전사 3 자세',
      'triangle_pose': '삼각 자세',
      'half_moon': '반달 자세',
      'chair_pose': '의자 자세',
      'boat_pose': '보트 자세',
      'bow_pose': '활 자세',
      'camel_pose': '낙타 자세',
      'fish_pose': '물고기 자세',
      'seated_forward_bend': '앉아서 앞으로 굽히기',
      'spinal_twist': '척추 비틀기',
      // 기능성 추가
      'turkish_get_up': '터키시 겟업',
      'farmers_walk': '파머스 워크',
      'sled_push': '썰매 밀기',
      'sled_pull': '썰매 당기기',
      'tire_flip': '타이어 뒤집기',
      'battle_rope': '배틀 로프',
      'medicine_ball_slam': '메디신볼 슬램',
      'wall_ball': '월볼',
      'kettlebell_swing': '케틀벨 스윙',
      'kettlebell_snatch': '케틀벨 스내치',
      'clean_and_jerk': '클린 앤 저크',
      'power_clean': '파워 클린',
      'hang_clean': '행 클린',
      'snatch': '스내치',
      // 플라이오메트릭 추가
      'depth_jump': '뎁스 점프',
      'broad_jump': '멀리뛰기',
      'tuck_jump': '턱 점프',
      'split_jump': '스플릿 점프',
      'lateral_bound': '래터럴 바운드',
      'single_leg_hop': '외발 뛰기',
      'plyo_push_up': '플라이오 푸시업',
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
      'next': 'Next',
      'back': 'Back',
      // Added exercise keys (English)
      'dumbbell_fly': 'Dumbbell Fly',
      'overhead_extension': 'Overhead Extension',
      'bicep_curl': 'Bicep Curl',
      'tricep_dips': 'Tricep Dips',
      'shoulder_press': 'Shoulder Press',
      'deadlift': 'Deadlift',
      'bench_press': 'Bench Press',
      'pull_up': 'Pull Up',
      'sit_up': 'Sit Up',
      'crunches': 'Crunches',
      'jumping_jacks': 'Jumping Jacks',
      'sun_salutation': 'Sun Salutation',
      'downward_dog': 'Downward Dog',
      'warrior_pose': 'Warrior Pose',
      'tree_pose': 'Tree Pose',
      'child_pose': 'Child Pose',
      'cobra_pose': 'Cobra Pose',
      'bridge_pose': 'Bridge Pose',
      'cat_cow': 'Cat-Cow',
      'pigeon_pose': 'Pigeon Pose',
      'wall_sit': 'Wall Sit',
      'glute_bridge': 'Glute Bridge',
      'high_knees': 'High Knees',
      'butt_kicks': 'Butt Kicks',
      'side_plank': 'Side Plank',
      // 상체 추가
      'lateral_raise': 'Lateral Raise',
      'front_raise': 'Front Raise',
      'arnold_press': 'Arnold Press',
      'hammer_curl': 'Hammer Curl',
      'concentration_curl': 'Concentration Curl',
      'skull_crusher': 'Skull Crusher',
      'chest_press': 'Chest Press',
      'incline_press': 'Incline Press',
      'decline_press': 'Decline Press',
      'cable_crossover': 'Cable Crossover',
      'pec_deck': 'Pec Deck',
      'tricep_pushdown': 'Tricep Pushdown',
      'rope_pulldown': 'Rope Pulldown',
      'overhead_tricep': 'Overhead Tricep Extension',
      // 하체 추가
      'romanian_deadlift': 'Romanian Deadlift',
      'sumo_deadlift': 'Sumo Deadlift',
      'front_squat': 'Front Squat',
      'goblet_squat': 'Goblet Squat',
      'bulgarian_split_squat': 'Bulgarian Split Squat',
      'leg_press': 'Leg Press',
      'leg_extension': 'Leg Extension',
      'leg_curl': 'Leg Curl',
      'calf_raise': 'Calf Raise',
      'hip_thrust': 'Hip Thrust',
      'step_up': 'Step Up',
      // 등 추가
      'chin_up': 'Chin Up',
      'lat_pulldown': 'Lat Pulldown',
      'bent_over_row': 'Bent Over Row',
      'single_arm_row': 'Single Arm Row',
      'seated_row': 'Seated Row',
      't_bar_row': 'T-Bar Row',
      'face_pull': 'Face Pull',
      'reverse_fly': 'Reverse Fly',
      'shrug': 'Shrug',
      // 코어 추가
      'bicycle_crunch': 'Bicycle Crunch',
      'russian_twist': 'Russian Twist',
      'leg_raise': 'Leg Raise',
      'flutter_kicks': 'Flutter Kicks',
      'scissors_kicks': 'Scissors Kicks',
      'v_up': 'V-Up',
      'hollow_hold': 'Hollow Hold',
      'dead_bug': 'Dead Bug',
      'bird_dog': 'Bird Dog',
      'plank_up_down': 'Plank Up-Down',
      'plank_jack': 'Plank Jack',
      'ab_wheel': 'Ab Wheel',
      'hanging_leg_raise': 'Hanging Leg Raise',
      // 유산소 추가
      'running': 'Running',
      'jogging': 'Jogging',
      'sprints': 'Sprints',
      'jump_rope': 'Jump Rope',
      'bear_crawl': 'Bear Crawl',
      'crab_walk': 'Crab Walk',
      'shuttle_run': 'Shuttle Run',
      'stair_climb': 'Stair Climb',
      // 요가 추가
      'upward_dog': 'Upward Dog',
      'warrior_2': 'Warrior II',
      'warrior_3': 'Warrior III',
      'triangle_pose': 'Triangle Pose',
      'half_moon': 'Half Moon',
      'chair_pose': 'Chair Pose',
      'boat_pose': 'Boat Pose',
      'bow_pose': 'Bow Pose',
      'camel_pose': 'Camel Pose',
      'fish_pose': 'Fish Pose',
      'seated_forward_bend': 'Seated Forward Bend',
      'spinal_twist': 'Spinal Twist',
      // 기능성 추가
      'turkish_get_up': 'Turkish Get-Up',
      'farmers_walk': 'Farmers Walk',
      'sled_push': 'Sled Push',
      'sled_pull': 'Sled Pull',
      'tire_flip': 'Tire Flip',
      'battle_rope': 'Battle Rope',
      'medicine_ball_slam': 'Medicine Ball Slam',
      'wall_ball': 'Wall Ball',
      'kettlebell_swing': 'Kettlebell Swing',
      'kettlebell_snatch': 'Kettlebell Snatch',
      'clean_and_jerk': 'Clean and Jerk',
      'power_clean': 'Power Clean',
      'hang_clean': 'Hang Clean',
      'snatch': 'Snatch',
      // 플라이오메트릭 추가
      'depth_jump': 'Depth Jump',
      'broad_jump': 'Broad Jump',
      'tuck_jump': 'Tuck Jump',
      'split_jump': 'Split Jump',
      'lateral_bound': 'Lateral Bound',
      'single_leg_hop': 'Single Leg Hop',
      'plyo_push_up': 'Plyometric Push-Up',
    },
  };

  static String getText(String key, String language) {
    return _translations[language]?[key] ?? _translations['日本語']?[key] ?? key;
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
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center_outlined),
              activeIcon: Icon(Icons.fitness_center),
              label: 'ROUTINE',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.analytics_outlined),
              activeIcon: Icon(Icons.analytics),
              label: 'LOG',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings),
              label: 'SETTING',
            ),
          ],
        ),
      ),
    );
  }
}

// 운동 기록 데이터 모델
class WorkoutRecord {
  final DateTime startTime;
  final DateTime endTime;
  final int duration; // seconds
  final String type;

  WorkoutRecord({
    required this.startTime,
    required this.endTime,
    required this.duration,
    required this.type,
  });

  // 날짜만 반환하는 getter (기존 호환성을 위해)
  DateTime get date => DateTime(startTime.year, startTime.month, startTime.day);

  Map<String, dynamic> toJson() => {
    'startTime': startTime.toIso8601String(),
    'endTime': endTime.toIso8601String(),
    'duration': duration,
    'type': type,
  };

  factory WorkoutRecord.fromJson(Map<String, dynamic> json) {
    // 기존 데이터 호환성을 위해 date 필드도 확인
    if (json.containsKey('startTime') && json.containsKey('endTime')) {
      return WorkoutRecord(
        startTime: DateTime.parse(json['startTime']),
        endTime: DateTime.parse(json['endTime']),
        duration: json['duration'],
        type: json['type'],
      );
    } else {
      // 기존 데이터 형식 (date만 있는 경우)
      final date = DateTime.parse(json['date']);
      final duration = json['duration'];
      return WorkoutRecord(
        startTime: date,
        endTime: date.add(Duration(seconds: duration)),
        duration: duration,
        type: json['type'],
      );
    }
  }
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

class _HomeScreenState extends State<HomeScreen> {
  Timer? _timer;
  bool _isWorkoutMode = false;
  bool _isPaused = false;

  // D-Day 카운트다운용 (현재는 하드코딩된 값 사용)

  // 스탑워치용
  int _workoutHours = 0;
  int _workoutMinutes = 0;
  int _workoutSeconds = 0;
  DateTime? _workoutStartTime;

  // 애니메이션 컨트롤러 제거됨

  // 달력 및 운동 기록
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<DateTime> _workoutDays = [];
  List<int> _fixedWorkoutDays = []; // 0=Sunday, 1=Monday, etc.
  List<WorkoutRecord> _workoutRecords = [];
  DateTime? _nextWorkoutDate;
  List<DateTime> _scheduledDays = [];
  // _countdownProgress 변수 제거됨

  @override
  void initState() {
    super.initState();
    _loadData();
    _startCountdownTimer();
    // 애니메이션 컨트롤러 초기화 제거됨
  }

  @override
  void dispose() {
    _timer?.cancel();
    // 애니메이션 컨트롤러 dispose 제거됨
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

  String _getMonthlyWorkoutTimeText() {
    final now = DateTime.now();
    final currentMonth = now.month;
    final currentYear = now.year;

    // 이번 달 운동 기록들 필터링
    final monthlyRecords = _workoutRecords.where((record) {
      return record.date.year == currentYear &&
          record.date.month == currentMonth;
    }).toList();

    // 총 운동 시간 계산 (초 단위)
    int totalSeconds = 0;
    for (final record in monthlyRecords) {
      totalSeconds += record.duration;
    }

    // 시간과 분으로 변환
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;

    if (hours > 0) {
      return '$hours時間$minutes分';
    } else {
      return '$minutes分';
    }
  }

  String _getCountdownText() {
    if (_isWorkoutMode) {
      // 운동 중일 때는 스탑워치 형식
      return '${_workoutHours.toString().padLeft(2, '0')}:${_workoutMinutes.toString().padLeft(2, '0')}:${_workoutSeconds.toString().padLeft(2, '0')}';
    } else {
      // 운동 전에는 다음 운동예정일까지 카운트다운
      if (_nextWorkoutDate == null) {
        return '00:00:00';
      }

      final now = DateTime.now();
      final target = DateTime(
        _nextWorkoutDate!.year,
        _nextWorkoutDate!.month,
        _nextWorkoutDate!.day,
      );

      final difference = target.difference(now);

      if (difference.isNegative) {
        return '00:00:00';
      }

      final hours = difference.inHours;
      final minutes = difference.inMinutes % 60;
      final seconds = difference.inSeconds % 60;

      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
  }

  String _getNextWorkoutDateText() {
    if (_nextWorkoutDate == null) {
      return '予定なし';
    }

    final month = _nextWorkoutDate!.month;
    final day = _nextWorkoutDate!.day;

    return '$month月$day日予定';
  }

  String _getCurrentDateText() {
    final now = DateTime.now();
    final month = now.month;
    final day = now.day;

    // 요일 계산
    final weekdays = ['月', '火', '水', '木', '金', '土', '日'];
    final weekday = weekdays[now.weekday - 1];

    return '$month/$day($weekday)';
  }

  void _calculateCountdown() {
    if (_nextWorkoutDate == null) return;

    final now = DateTime.now();

    setState(() {
      // 홈탭 원형 테두리 진행도 (오늘 설정해서 내일모레 00시까지를 100으로 가정)
      // 기준 시작: 오늘 00:00, 기준 종료: 오늘 기준 + 2일 00:00
      final startOfToday = DateTime(now.year, now.month, now.day);
      final endOfDayAfterTomorrow = startOfToday.add(const Duration(days: 2));
      final totalWindowSeconds = endOfDayAfterTomorrow
          .difference(startOfToday)
          .inSeconds
          .clamp(1, 1 << 31);
      final remainingSeconds = endOfDayAfterTomorrow.difference(now).inSeconds;

      double progress = remainingSeconds / totalWindowSeconds;
      if (progress.isNaN || progress.isInfinite) {
        progress = 0.0;
      }
      // _countdownProgress 계산 제거됨
    });
  }

  void _startCountdownTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // 매 틱마다 남은 시간 재계산하여 정확도 유지
      _calculateCountdown();
      setState(() {
        // UI 업데이트를 위해 setState 호출
      });
    });
  }

  // ----- Hybrid idle timer helpers -----
  WorkoutRecord? _lastWorkout() {
    if (_workoutRecords.isEmpty) return null;
    final sorted = [..._workoutRecords]
      ..sort((a, b) => b.endTime.compareTo(a.endTime));
    return sorted.first;
  }

  String _formatHms(int totalSeconds) {
    final h = totalSeconds ~/ 3600;
    final m = (totalSeconds % 3600) ~/ 60;
    final s = totalSeconds % 60;
    return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  String _getIdleTimerText() {
    // If next workout date exists and is in the future => countdown
    if (_nextWorkoutDate != null) {
      final now = DateTime.now();
      final target = DateTime(
        _nextWorkoutDate!.year,
        _nextWorkoutDate!.month,
        _nextWorkoutDate!.day,
      );
      final diff = target.difference(now);
      if (!diff.isNegative) {
        final hours = diff.inHours;
        final minutes = diff.inMinutes % 60;
        final seconds = diff.inSeconds % 60;
        return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
      }
    }
    // Otherwise, count up since last workout end time
    final last = _lastWorkout();
    if (last == null) return '00:00:00';
    final elapsed = DateTime.now().difference(last.endTime).inSeconds;
    return _formatHms(elapsed);
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
      _workoutStartTime = DateTime.now(); // 운동 시작 시간 저장
      _startWorkoutTimer();
      // 애니메이션 컨트롤러 실행 제거됨
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
      if (totalSeconds > 0 && _workoutStartTime != null) {
        final endTime = DateTime.now();
        final record = WorkoutRecord(
          startTime: _workoutStartTime!,
          endTime: endTime,
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

      // 운동 시작 시간 초기화
      _workoutStartTime = null;

      // 대기 모드로 돌아가기
      _calculateNextWorkoutDate();
      _startCountdownTimer();
      // 애니메이션 컨트롤러 정지 제거됨
    });
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
          backgroundColor: Colors.transparent,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
              maxWidth: MediaQuery.of(context).size.width * 0.9,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: widget.isDarkMode
                    ? const Color(0xFF1E1E1E)
                    : Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Close button only
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.close, size: 20),
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Calendar content
                  Flexible(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 300,
                            child: TableCalendar<String>(
                              firstDay: DateTime.utc(2020, 1, 1),
                              lastDay: DateTime.utc(2030, 12, 31),
                              focusedDay: _focusedDay,
                              calendarFormat: CalendarFormat.month,
                              eventLoader: (day) {
                                final isDone = _workoutDays.any(
                                  (d) => isSameDay(d, day),
                                );
                                final isScheduled = _scheduledDays.any(
                                  (d) => isSameDay(d, day),
                                );
                                final List<String> events = [];
                                if (isDone) events.add('done');
                                if (isScheduled) events.add('scheduled');
                                return events;
                              },
                              startingDayOfWeek: StartingDayOfWeek.sunday,
                              calendarStyle: CalendarStyle(
                                outsideDaysVisible: false,
                                weekendTextStyle: TextStyle(
                                  color: widget.isDarkMode
                                      ? Colors.red[300]
                                      : Colors.red,
                                ),
                                holidayTextStyle: TextStyle(
                                  color: widget.isDarkMode
                                      ? Colors.red[300]
                                      : Colors.red,
                                ),
                                defaultTextStyle: TextStyle(
                                  color: widget.isDarkMode
                                      ? Colors.white
                                      : Colors.black87,
                                ),
                                selectedTextStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                todayTextStyle: TextStyle(
                                  color: const Color(0xFF87CEEB),
                                  fontWeight: FontWeight.bold,
                                ),
                                selectedDecoration: BoxDecoration(
                                  color: const Color(0xFF87CEEB),
                                  shape: BoxShape.circle,
                                ),
                                todayDecoration: BoxDecoration(
                                  color: const Color(
                                    0xFF87CEEB,
                                  ).withOpacity(0.2),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFF87CEEB),
                                    width: 2,
                                  ),
                                ),
                              ),
                              headerStyle: HeaderStyle(
                                formatButtonVisible: false,
                                titleCentered: true,
                                titleTextStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: widget.isDarkMode
                                      ? Colors.white
                                      : Colors.black87,
                                ),
                                leftChevronIcon: Icon(
                                  Icons.chevron_left,
                                  color: const Color(0xFF87CEEB),
                                ),
                                rightChevronIcon: Icon(
                                  Icons.chevron_right,
                                  color: const Color(0xFF87CEEB),
                                ),
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
                                            margin: const EdgeInsets.only(
                                              right: 2,
                                            ),
                                            decoration: const BoxDecoration(
                                              color: Color(
                                                0xFF2196F3,
                                              ), // 파란색: 예정
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        if (events.contains('done'))
                                          Container(
                                            width: 6,
                                            height: 6,
                                            decoration: const BoxDecoration(
                                              color: Color(
                                                0xFF4CAF50,
                                              ), // 초록색: 완료
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                      ],
                                    ),
                                  );
                                },
                                defaultBuilder: (context, day, focusedDay) {
                                  // 고정 운동일 표시
                                  if (_fixedWorkoutDays.contains(
                                    day.weekday % 7,
                                  )) {
                                    return Container(
                                      margin: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: const Color(
                                          0xFF87CEEB,
                                        ).withOpacity(0.3),
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
                          const SizedBox(height: 8),
                          // Fixed workout days section
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: widget.isDarkMode
                                  ? const Color(0xFF2A2A2A)
                                  : Colors.grey[50],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.schedule,
                                      color: const Color(0xFF87CEEB),
                                      size: 16,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      '고정 운동일',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: widget.isDarkMode
                                            ? Colors.white
                                            : Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(7, (index) {
                                      final dayNames = [
                                        '일',
                                        '월',
                                        '화',
                                        '수',
                                        '목',
                                        '금',
                                        '토',
                                      ];
                                      final selected = _fixedWorkoutDays
                                          .contains(index);
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          right: 4,
                                        ),
                                        child: FilterChip(
                                          label: Text(
                                            dayNames[index],
                                            style: TextStyle(
                                              color: selected
                                                  ? Colors.white
                                                  : (widget.isDarkMode
                                                        ? Colors.white
                                                        : Colors.black87),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11,
                                            ),
                                          ),
                                          selected: selected,
                                          onSelected: (bool value) {
                                            setState(() {
                                              if (value) {
                                                if (!_fixedWorkoutDays.contains(
                                                  index,
                                                )) {
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
                                          selectedColor: const Color(
                                            0xFF87CEEB,
                                          ),
                                          checkmarkColor: Colors.white,
                                          backgroundColor: widget.isDarkMode
                                              ? Colors.grey[700]
                                              : Colors.grey[200],
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
              // Header with date and icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[600]!, width: 1),
                    ),
                    child: GestureDetector(
                      onTap: _showCalendarDialog,
                      child: Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.grey[600],
                        size: 16,
                      ),
                    ),
                  ),
                  Text(
                    _getCurrentDateText(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: widget.isDarkMode
                          ? Colors.white
                          : Colors.grey[800],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[600]!, width: 1),
                    ),
                    child: Icon(
                      Icons.monitor_weight_outlined,
                      color: Colors.grey[600],
                      size: 16,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Metrics card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    // Left section - Exercise time
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '今月の運動時間',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _getMonthlyWorkoutTimeText(),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Hiragino Sans',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    // Divider
                    Container(height: 40, width: 1, color: Colors.grey[300]),
                    // Middle section - Weight change
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '体重の変化',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '+2.3kg',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Hiragino Sans',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    // Divider
                    Container(height: 40, width: 1, color: Colors.grey[300]),
                    // Right section - Exercise pace
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '運動ペース',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '3.6日',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Hiragino Sans',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),

              // Central countdown timer with 45-min circular progress
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 320,
                    height: 320,
                    child: CustomPaint(
                      painter: _CircularProgressPainter(
                        progress: (() {
                          if (!_isWorkoutMode) return 0.0;
                          final total =
                              _workoutHours * 3600 +
                              _workoutMinutes * 60 +
                              _workoutSeconds;
                          final capped = total % 2700; // 45 * 60
                          return capped / 2700.0;
                        })(),
                        isDark: widget.isDarkMode,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        _isWorkoutMode
                            ? '運動時間'
                            : (_nextWorkoutDate != null
                                  ? '次に運動日まで'
                                  : '마지막 운동 이후'),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _isWorkoutMode
                            ? _getCountdownText()
                            : _getIdleTimerText(),
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '目標 45:00',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _isWorkoutMode
                            ? (_isPaused ? '一時停止中...' : '運動中...')
                            : (_nextWorkoutDate != null
                                  ? _getNextWorkoutDateText()
                                  : '카운트업 중'),
                        style: TextStyle(
                          fontSize: 14,
                          color: _isWorkoutMode
                              ? Colors.green[600]
                              : Colors.grey[500],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Start workout button
              if (!_isWorkoutMode)
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFAEE8E6), Color(0xFF3DA8EF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(25),
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
                      '運動を開始する',
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
            ],
          ),
        ),
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double progress; // 0.0..1.0
  final bool isDark;

  _CircularProgressPainter({required this.progress, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.shortestSide / 2) - 16;

    final background = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16
      ..color = isDark ? const Color(0xFF2A2A2A) : const Color(0xFFE5E7EB)
      ..strokeCap = StrokeCap.round;

    final foreground = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16
      ..color = isDark ? Colors.white : const Color(0xFF111827)
      ..strokeCap = StrokeCap.round;

    // Base circle
    canvas.drawCircle(center, radius, background);

    // Progress arc (starts at -90 degrees)
    final startAngle = -90 * 3.1415926535 / 180;
    final sweepAngle = 2 * 3.1415926535 * progress.clamp(0.0, 1.0);
    final rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(rect, startAngle, sweepAngle, false, foreground);
  }

  @override
  bool shouldRepaint(covariant _CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.isDark != isDark;
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
  late FocusNode _searchFocus;
  OverlayEntry? _searchOverlay;
  List<String> _favoriteExercises = [];
  List<Map<String, dynamic>> _routines = []; // 루틴 이름과 운동 목록을 저장
  final List<String> _allExercises = [
    // 기본 운동
    'squat',
    'push_up',
    'plank',
    'lunges',
    'burpees',
    'mountain_climber',
    'jumping_jacks',
    'high_knees',
    'butt_kicks',

    // 상체 근력
    'bench_press',
    'dumbbell_fly',
    'overhead_extension',
    'bicep_curl',
    'tricep_dips',
    'shoulder_press',
    'lateral_raise',
    'front_raise',
    'arnold_press',
    'hammer_curl',
    'concentration_curl',
    'skull_crusher',
    'chest_press',
    'incline_press',
    'decline_press',
    'cable_crossover',
    'pec_deck',
    'tricep_pushdown',
    'rope_pulldown',
    'overhead_tricep',

    // 하체 근력
    'deadlift',
    'romanian_deadlift',
    'sumo_deadlift',
    'front_squat',
    'goblet_squat',
    'bulgarian_split_squat',
    'leg_press',
    'leg_extension',
    'leg_curl',
    'calf_raise',
    'glute_bridge',
    'hip_thrust',
    'wall_sit',
    'step_up',
    'box_jump',

    // 등/풀 운동
    'pull_up',
    'chin_up',
    'lat_pulldown',
    'bent_over_row',
    'single_arm_row',
    'seated_row',
    't_bar_row',
    'face_pull',
    'reverse_fly',
    'shrug',

    // 코어/복근
    'sit_up',
    'crunches',
    'bicycle_crunch',
    'russian_twist',
    'leg_raise',
    'flutter_kicks',
    'scissors_kicks',
    'v_up',
    'hollow_hold',
    'dead_bug',
    'bird_dog',
    'side_plank',
    'plank_up_down',
    'plank_jack',
    'ab_wheel',
    'hanging_leg_raise',

    // 유산소
    'running',
    'jogging',
    'sprints',
    'jump_rope',
    'bear_crawl',
    'crab_walk',
    'shuttle_run',
    'stair_climb',

    // 요가/스트레칭
    'sun_salutation',
    'downward_dog',
    'upward_dog',
    'warrior_pose',
    'warrior_2',
    'warrior_3',
    'tree_pose',
    'child_pose',
    'cobra_pose',
    'bridge_pose',
    'cat_cow',
    'pigeon_pose',
    'triangle_pose',
    'half_moon',
    'chair_pose',
    'boat_pose',
    'bow_pose',
    'camel_pose',
    'fish_pose',
    'seated_forward_bend',
    'spinal_twist',

    // 기능성/운동선수
    'turkish_get_up',
    'farmers_walk',
    'sled_push',
    'sled_pull',
    'tire_flip',
    'battle_rope',
    'medicine_ball_slam',
    'wall_ball',
    'kettlebell_swing',
    'kettlebell_snatch',
    'clean_and_jerk',
    'power_clean',
    'hang_clean',
    'snatch',

    // 플라이오메트릭
    'depth_jump',
    'broad_jump',
    'tuck_jump',
    'split_jump',
    'lateral_bound',
    'single_leg_hop',
    'plyo_push_up',
  ];
  List<String> _filteredExercises = [];

  @override
  void initState() {
    super.initState();
    _searchFocus = FocusNode();
    _searchFocus.addListener(() {
      if (_searchFocus.hasFocus) {
        setState(() {
          _filteredExercises = _allExercises;
          _sortExercises(); // 검색창을 열 때 즐겨찾기 정렬 적용
        });
        _showSearchDropdown();
      } else {
        _removeSearchDropdown();
      }
    });
    _filteredExercises = _allExercises;
    _loadData();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _searchFocus.dispose();
    _removeSearchDropdown();
    super.dispose();
  }

  // 운동 리스트 정렬 (즐겨찾기 우선, 그 다음 언어별 정렬)
  void _sortExercises() {
    _filteredExercises.sort((a, b) {
      final aIsFavorite = _favoriteExercises.contains(a);
      final bIsFavorite = _favoriteExercises.contains(b);

      // 1순위: 즐겨찾기 운동이 먼저 오도록 정렬
      if (aIsFavorite && !bIsFavorite) return -1;
      if (!aIsFavorite && bIsFavorite) return 1;

      // 2순위: 같은 그룹 내에서는 언어별 순으로 정렬
      final aName = AppLocalizations.getText(a, widget.language).toLowerCase();
      final bName = AppLocalizations.getText(b, widget.language).toLowerCase();

      // 언어별 정렬 기준
      if (widget.language == '한국어') {
        // 한국어: 가나다 순
        return aName.compareTo(bName);
      } else if (widget.language == '日本語') {
        // 일본어: 히라가나/가타카나 순
        final aHiragana = _toHiragana(aName);
        final bHiragana = _toHiragana(bName);
        return aHiragana.compareTo(bHiragana);
      } else {
        // 영어: 알파벳 순
        return aName.compareTo(bName);
      }
    });
  }

  void _onSearchChanged() {
    setState(() {
      if (_searchController.text.isEmpty) {
        _filteredExercises = _allExercises;
      } else {
        final searchText = _searchController.text.toLowerCase();
        _filteredExercises = _allExercises.where((exercise) {
          final exerciseName = AppLocalizations.getText(
            exercise,
            widget.language,
          ).toLowerCase();

          // 기본 검색
          if (exerciseName.contains(searchText)) {
            return true;
          }

          // 일본어인 경우 히라가나-가타카나 변환 검색
          if (widget.language == '日本語') {
            final hiraganaSearch = _toHiragana(searchText);
            final katakanaSearch = _toKatakana(searchText);
            final hiraganaExercise = _toHiragana(exerciseName);
            final katakanaExercise = _toKatakana(exerciseName);

            return hiraganaExercise.contains(hiraganaSearch) ||
                katakanaExercise.contains(katakanaSearch) ||
                hiraganaExercise.contains(katakanaSearch) ||
                katakanaExercise.contains(hiraganaSearch);
          }

          return false;
        }).toList();
      }

      // 즐겨찾기한 운동들을 상단으로 정렬 (검색어 유무 관계없이 항상 적용)
      _sortExercises();
    });
    _markSearchOverlayNeedsBuild();
  }

  // 히라가나를 가타카나로 변환
  String _toKatakana(String text) {
    return text.replaceAllMapped(
      RegExp(r'[\u3041-\u3096]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 0x60),
    );
  }

  // 가타카나를 히라가나로 변환
  String _toHiragana(String text) {
    return text.replaceAllMapped(
      RegExp(r'[\u30A1-\u30F6]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) - 0x60),
    );
  }

  void _markSearchOverlayNeedsBuild() {
    _searchOverlay?.markNeedsBuild();
  }

  void _showSearchDropdown() {
    if (_searchOverlay != null) return;
    _searchOverlay = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            // Dimmed backdrop
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  _searchFocus.unfocus();
                  _removeSearchDropdown();
                  _searchController.clear();
                },
                child: Container(color: Colors.black54),
              ),
            ),
            // Search bar and results
            Positioned(
              top: 80,
              left: 24,
              right: 24,
              child: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Search bar
                    Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: widget.isDarkMode
                            ? Colors.grey[800]
                            : Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _searchController,
                        focusNode: _searchFocus,
                        autofocus: true,
                        style: TextStyle(
                          color: widget.isDarkMode
                              ? Colors.white
                              : Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: '운동 검색...',
                          hintStyle: TextStyle(
                            color: widget.isDarkMode
                                ? Colors.grey[400]
                                : Colors.grey[600],
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: widget.isDarkMode
                                ? Colors.grey[300]
                                : Colors.grey[600],
                          ),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: widget.isDarkMode
                                        ? Colors.grey[300]
                                        : Colors.grey[600],
                                  ),
                                  onPressed: () {
                                    _searchController.clear();
                                    setState(() {
                                      _filteredExercises = _allExercises;
                                    });
                                    _markSearchOverlayNeedsBuild();
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
                    ),
                    const SizedBox(height: 12),
                    // Search results
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.6,
                      ),
                      decoration: BoxDecoration(
                        color: widget.isDarkMode
                            ? Colors.grey[900]
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.12),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: _filteredExercises.isEmpty
                          ? SizedBox(
                              height: 120,
                              child: Center(
                                child: Text(
                                  '검색 결과가 없습니다',
                                  style: TextStyle(
                                    color: widget.isDarkMode
                                        ? Colors.grey[400]
                                        : Colors.grey[600],
                                  ),
                                ),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: _filteredExercises.length,
                              itemBuilder: (context, index) {
                                return _buildSearchResultCard(
                                  _filteredExercises[index],
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
    Overlay.of(context).insert(_searchOverlay!);
  }

  void _removeSearchDropdown() {
    _searchOverlay?.remove();
    _searchOverlay = null;
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
    // 검색 오버레이가 열려있다면 즉시 업데이트
    _markSearchOverlayNeedsBuild();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode
          ? const Color(0xFF121212)
          : const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 헤더: 내 루틴 + 검색
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '내 루틴',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    tooltip: '검색',
                    onPressed: () {
                      // 상단에 검색창 포커스 트리거
                      FocusScope.of(context).requestFocus(_searchFocus);
                      _showSearchDropdown();
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // 작성한 루틴
              const Text(
                '작성한 루틴',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              if (_routines.isEmpty)
                _buildEmptyCard('작성된 루틴이 없습니다.')
              else
                Column(
                  children: _routines
                      .map(
                        (r) => Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: _buildRoutineListCard(r),
                        ),
                      )
                      .toList(),
                ),

              const SizedBox(height: 24),

              // 즐겨찾기 운동
              const Text(
                '즐겨찾기 운동',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              if (_favoriteExercises.isEmpty)
                _buildEmptyCard('즐겨찾기한 운동이 없습니다.')
              else
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _favoriteExercises
                      .map((name) => _buildFavoriteChip(name))
                      .toList(),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreateRoutineDialog,
        backgroundColor: widget.isDarkMode ? Colors.white : Colors.black87,
        child: Icon(
          Icons.add,
          color: widget.isDarkMode ? Colors.black : Colors.white,
        ),
      ),
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
      'dumbbell_fly': Icons.sports_gymnastics,
      'overhead_extension': Icons.sports_gymnastics,
      'bicep_curl': Icons.fitness_center,
      'tricep_dips': Icons.fitness_center,
      'shoulder_press': Icons.fitness_center,
      'deadlift': Icons.fitness_center,
      'bench_press': Icons.fitness_center,
      'pull_up': Icons.fitness_center,
      'sit_up': Icons.accessibility_new,
      'crunches': Icons.accessibility_new,
      'jumping_jacks': Icons.directions_run,
      'sun_salutation': Icons.self_improvement,
      'downward_dog': Icons.self_improvement,
      'warrior_pose': Icons.self_improvement,
      'tree_pose': Icons.park,
      'child_pose': Icons.self_improvement,
      'cobra_pose': Icons.self_improvement,
      'bridge_pose': Icons.self_improvement,
      'cat_cow': Icons.pets,
      'pigeon_pose': Icons.self_improvement,
      'wall_sit': Icons.chair_alt,
      'glute_bridge': Icons.self_improvement,
      'high_knees': Icons.directions_run,
      'butt_kicks': Icons.directions_run,
      'side_plank': Icons.self_improvement,
    };

    // 운동별 색상 매핑
    final colorMap = {
      'squat': Colors.purple,
      'push_up': Colors.blue,
      'plank': Colors.orange,
      'lunges': Colors.green,
      'burpees': Colors.red,
      'mountain_climber': Colors.teal,
      'dumbbell_fly': Colors.deepPurple,
      'overhead_extension': Colors.indigo,
      'bicep_curl': Colors.blueGrey,
      'tricep_dips': Colors.cyan,
      'shoulder_press': Colors.lightBlue,
      'deadlift': Colors.brown,
      'bench_press': Colors.redAccent,
      'pull_up': Colors.lightBlueAccent,
      'sit_up': Colors.amber,
      'crunches': Colors.orangeAccent,
      'jumping_jacks': Colors.pinkAccent,
      'sun_salutation': Colors.deepOrange,
      'downward_dog': Colors.greenAccent,
      'warrior_pose': Colors.lime,
      'tree_pose': Colors.green,
      'child_pose': Colors.teal,
      'cobra_pose': Colors.blueAccent,
      'bridge_pose': Colors.deepPurpleAccent,
      'cat_cow': Colors.grey,
      'pigeon_pose': Colors.tealAccent,
      'wall_sit': Colors.blueGrey,
      'glute_bridge': Colors.purpleAccent,
      'high_knees': Colors.pink,
      'butt_kicks': Colors.redAccent,
      'side_plank': Colors.indigoAccent,
    };

    final icon = iconMap[exerciseKey] ?? Icons.fitness_center;
    final color = colorMap[exerciseKey] ?? Colors.blue;

    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      leading: CircleAvatar(
        radius: 16,
        backgroundColor: color.withOpacity(0.15),
        child: Icon(icon, color: color, size: 18),
      ),
      title: Text(
        AppLocalizations.getText(exerciseKey, widget.language),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: widget.isDarkMode ? Colors.white : Colors.black87,
        ),
      ),
      trailing: IconButton(
        onPressed: () => _toggleFavorite(exerciseKey),
        icon: Icon(
          isFavorite ? Icons.star : Icons.star_border,
          color: isFavorite ? Colors.amber : color,
          size: 20,
        ),
        tooltip: isFavorite ? '즐겨찾기 제거' : '즐겨찾기 추가',
      ),
      onTap: () => _toggleFavorite(exerciseKey),
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

  Widget _buildEmptyCard(String message) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: widget.isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: widget.isDarkMode ? Colors.white12 : Colors.black12,
        ),
      ),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 13,
          color: widget.isDarkMode ? Colors.grey[400] : Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildFavoriteChip(String exerciseKey) {
    final label = AppLocalizations.getText(exerciseKey, widget.language);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: widget.isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: widget.isDarkMode ? Colors.white12 : Colors.black12,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(fontSize: 13)),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: () => _toggleFavorite(exerciseKey),
            child: Icon(
              Icons.close,
              size: 16,
              color: widget.isDarkMode ? Colors.grey[400] : Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Map<String, dynamic> _routineMetaOrDefault(Map<String, dynamic> routine) {
    // 지원하는 필드: title/name, time, level, usage {sessions, minutes, weeks: [int,int,int,int]}
    final title = (routine['title'] ?? routine['name'] ?? '루틴').toString();
    final time = (routine['time'] ?? '30분').toString();
    final level = (routine['level'] ?? '초급').toString();
    final usage =
        (routine['usage'] as Map<String, dynamic>?) ??
        {
          'sessions': 0,
          'minutes': 0,
          'weeks': [0, 0, 0, 0],
        };
    final sessions = (usage['sessions'] ?? 0) as int;
    final minutes = (usage['minutes'] ?? 0) as int;
    final weeks = (usage['weeks'] as List?)?.cast<int>() ?? [0, 0, 0, 0];
    return {
      'title': title,
      'time': time,
      'level': level,
      'sessions': sessions,
      'minutes': minutes,
      'weeks': weeks,
    };
  }

  Widget _buildRoutineListCard(Map<String, dynamic> routine) {
    final meta = _routineMetaOrDefault(routine);
    final weeks = (meta['weeks'] as List<int>)
        .map((w) => w.clamp(0, 5))
        .toList();
    final sessions = meta['sessions'] as int;
    final minutes = meta['minutes'] as int;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: widget.isDarkMode ? Colors.white12 : Colors.black12,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meta['title'] as String,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${meta['time']} · ${meta['level']}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                child: const Text('시작'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: weeks
                    .map(
                      (w) => Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: _WeekStripBar(intensity: w),
                      ),
                    )
                    .toList(),
              ),
              Text(
                '$sessions회 · ${minutes ~/ 60}시간${minutes % 60}분',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showCreateRoutineDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _CreateRoutineDialog(
          isDarkMode: widget.isDarkMode,
          language: widget.language,
          allExercises: _allExercises,
          favoriteExercises: _favoriteExercises,
          onSave: (routine) {
            setState(() {
              _routines.add(routine);
            });
            _saveData();
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
            print('🔥 루틴 카드 클릭됨: ${routine['name']}');
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
                        '${exercises.length}개 운동',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.white, size: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _WeekStripBar({required int intensity}) {
    final pct = (intensity.clamp(0, 5) / 5.0).toDouble();
    return Container(
      width: 40,
      height: 10,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(4),
      ),
      clipBehavior: Clip.antiAlias,
      child: Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: pct == 0 ? 0.02 : pct, // 최소 가시 폭
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }

  void _showRoutineDetails(Map<String, dynamic> routine) {
    showDialog(
      context: context,
      builder: (context) => _RoutineAnalysisDialog(
        routine: routine,
        isDarkMode: widget.isDarkMode,
        language: widget.language,
        onEdit: () {
          Navigator.of(context).pop();
          _showEditRoutineDialog(routine);
        },
        onDelete: () {
          Navigator.of(context).pop();
          setState(() {
            _routines.remove(routine);
          });
          _saveData();
        },
      ),
    );
  }

  void _showEditRoutineDialog(Map<String, dynamic> routine) {
    // TODO: 루틴 수정 다이얼로그 구현
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('루틴 수정 기능은 곧 추가됩니다')));
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
  DateTime _currentMonth = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    1,
  );
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _loadWorkoutRecords();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 화면이 다시 활성화될 때마다 데이터 새로고침
    _loadWorkoutRecords();
  }

  Future<void> _loadWorkoutRecords() async {
    final prefs = await SharedPreferences.getInstance();
    final recordsJson = prefs.getStringList('workout_records') ?? [];

    setState(() {
      _workoutRecords =
          recordsJson.map((e) => WorkoutRecord.fromJson(jsonDecode(e))).toList()
            ..sort((a, b) => b.date.compareTo(a.date));
      // ensure selected date remains valid within loaded data range
      _selectedDate = _selectedDate;
    });
  }

  String _fmt(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  String _monthKey(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}';
  List<WorkoutRecord> _logsOn(DateTime d) {
    return _workoutRecords.where((r) => _fmt(r.date) == _fmt(d)).toList();
  }

  List<WorkoutRecord> get _logsThisMonth {
    final key = _monthKey(_currentMonth);
    return _workoutRecords.where((r) => _fmt(r.date).startsWith(key)).toList();
  }

  Map<String, int> get _categoryMinutesThisMonth {
    final map = <String, int>{};
    for (final r in _logsThisMonth) {
      map[r.type] = (map[r.type] ?? 0) + r.duration ~/ 60;
    }
    return map;
  }

  List<int> get _weeklyMinutes {
    final start = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final end = DateTime(_currentMonth.year, _currentMonth.month + 1, 0);
    final firstDow = start.weekday % 7; // 0=Sun
    final daysInMonth = end.day;
    final weekly = [0, 0, 0, 0, 0];
    for (int d = 1; d <= daysInMonth; d++) {
      final date = DateTime(_currentMonth.year, _currentMonth.month, d);
      final totalMin = _workoutRecords
          .where((r) => _fmt(r.date) == _fmt(date))
          .fold<int>(0, (s, r) => s + r.duration ~/ 60);
      final w = ((firstDow + (d - 1)) / 7).floor();
      if (w >= 0 && w < weekly.length) weekly[w] += totalMin;
    }
    return weekly;
  }

  void _changeMonth(int delta) {
    final m = DateTime(_currentMonth.year, _currentMonth.month + delta, 1);
    setState(() {
      _currentMonth = m;
      _selectedDate = DateTime(m.year, m.month, 1);
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

  Future<void> _clearAllRecords() async {
    // 확인 다이얼로그 표시
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('운동 기록 삭제'),
          content: const Text('모든 운동 기록을 삭제하시겠습니까?\n이 작업은 되돌릴 수 없습니다.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('삭제', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('workout_records');
      print('모든 운동 기록이 삭제되었습니다.');

      setState(() {
        _workoutRecords.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final logsForSelected = _logsOn(_selectedDate);
    final weekly = _weeklyMinutes;
    final totalMin = weekly.fold<int>(0, (a, b) => a + b);
    final activeWeeks = weekly.where((m) => m > 0).length;
    final avgMin = activeWeeks == 0 ? 0 : (totalMin / activeWeeks).round();

    // Build calendar cells for current month
    final start = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final end = DateTime(_currentMonth.year, _currentMonth.month + 1, 0);
    final firstDow = start.weekday % 7; // 0=Sun
    final daysInMonth = end.day;
    final calendarCells = <DateTime?>[];
    for (int i = 0; i < firstDow; i++) {
      calendarCells.add(null);
    }
    for (int d = 1; d <= daysInMonth; d++) {
      calendarCells.add(DateTime(_currentMonth.year, _currentMonth.month, d));
    }
    final logDatesSet = _logsThisMonth.map((l) => _fmt(l.date)).toSet();

    return Scaffold(
      backgroundColor: widget.isDarkMode
          ? const Color(0xFF121212)
          : const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Calendar card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: widget.isDarkMode
                      ? const Color(0xFF1E1E1E)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  border: Border.all(
                    color: widget.isDarkMode ? Colors.white12 : Colors.black12,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => _changeMonth(-1),
                          icon: const Icon(Icons.chevron_left),
                        ),
                        Text(
                          '${_currentMonth.year}. ${_currentMonth.month}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          onPressed: () => _changeMonth(1),
                          icon: const Icon(Icons.chevron_right),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('일'),
                        Text('월'),
                        Text('화'),
                        Text('수'),
                        Text('목'),
                        Text('금'),
                        Text('토'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7,
                            mainAxisSpacing: 6,
                            crossAxisSpacing: 6,
                            childAspectRatio: 1.2,
                          ),
                      itemCount: calendarCells.length,
                      itemBuilder: (context, idx) {
                        final d = calendarCells[idx];
                        if (d == null) return const SizedBox.shrink();
                        final selected = _fmt(d) == _fmt(_selectedDate);
                        final hasLog = logDatesSet.contains(_fmt(d));
                        return GestureDetector(
                          onTap: () => setState(() => _selectedDate = d),
                          child: Container(
                            decoration: BoxDecoration(
                              color: selected
                                  ? (widget.isDarkMode
                                        ? const Color(0xFF2A2A2A)
                                        : Colors.white)
                                  : (widget.isDarkMode
                                        ? const Color(0xFF171717)
                                        : const Color(0xFFF3F4F6)),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: selected
                                    ? (widget.isDarkMode
                                          ? Colors.white12
                                          : Colors.black12)
                                    : Colors.transparent,
                              ),
                              boxShadow: selected
                                  ? [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.06),
                                        blurRadius: 6,
                                        offset: const Offset(0, 2),
                                      ),
                                    ]
                                  : null,
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Text(
                                    '${d.day}',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ),
                                if (hasLog)
                                  Positioned(
                                    bottom: 6,
                                    left: 0,
                                    right: 0,
                                    child: Center(
                                      child: Container(
                                        width: 6,
                                        height: 6,
                                        decoration: BoxDecoration(
                                          color: widget.isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Selected date logs
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: widget.isDarkMode
                      ? const Color(0xFF1E1E1E)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  border: Border.all(
                    color: widget.isDarkMode ? Colors.white12 : Colors.black12,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_fmt(_selectedDate)} 기록',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (logsForSelected.isEmpty)
                      Text(
                        '기록 없음',
                        style: TextStyle(
                          color: widget.isDarkMode
                              ? Colors.grey[400]
                              : Colors.grey[600],
                        ),
                      )
                    else
                      ...logsForSelected.map(
                        (l) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l.type,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '${l.duration ~/ 60}분',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                _formatDuration(l.duration),
                                style: TextStyle(
                                  fontSize: 13,
                                  color: widget.isDarkMode
                                      ? Colors.grey[300]
                                      : Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Reports
              Column(
                children: [
                  // Weekly minutes bar (simple)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: widget.isDarkMode
                          ? const Color(0xFF1E1E1E)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: widget.isDarkMode
                            ? Colors.white12
                            : Colors.black12,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '이번달 주간 운동시간',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            _chip('합계 ${totalMin ~/ 60}시간 ${totalMin % 60}분'),
                            const SizedBox(width: 8),
                            _chip('주평균 ${avgMin ~/ 60}시간 ${avgMin % 60}분'),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            for (int i = 0; i < weekly.length; i++) ...[
                              _bar(
                                weekly[i],
                                weekly.reduce((a, b) => a > b ? a : b),
                              ),
                              if (i < weekly.length - 1)
                                const SizedBox(width: 8),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Category ratios (simple rows)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: widget.isDarkMode
                          ? const Color(0xFF1E1E1E)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: widget.isDarkMode
                            ? Colors.white12
                            : Colors.black12,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '카테고리 비율',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (_categoryMinutesThisMonth.isEmpty)
                          Text(
                            '데이터 없음',
                            style: TextStyle(
                              color: widget.isDarkMode
                                  ? Colors.grey[400]
                                  : Colors.grey[600],
                            ),
                          )
                        else
                          ..._categoryMinutesThisMonth.entries.map((e) {
                            final total = _categoryMinutesThisMonth.values
                                .fold<int>(0, (a, b) => a + b);
                            final pct = total == 0
                                ? 0
                                : ((e.value / total) * 100).round();
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      e.key,
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ),
                                  Text(
                                    '$pct% (${e.value}분)',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Weight trend placeholder
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: widget.isDarkMode
                          ? const Color(0xFF1E1E1E)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: widget.isDarkMode
                            ? Colors.white12
                            : Colors.black12,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '몸무게 변화',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '그래프는 추후 추가 예정',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
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

  Widget _chip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: widget.isDarkMode
            ? const Color(0xFF171717)
            : const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }

  Widget _bar(int value, int max) {
    final h = max == 0 ? 6.0 : (value / max) * 80 + 6;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: h,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'W${_weeklyMinutes.indexOf(value) + 1}',
            style: const TextStyle(fontSize: 10),
          ),
        ],
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
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 24),

            _buildSettingsGroup(
              title: AppLocalizations.getText('app_settings', widget.language),
              children: [
                _buildSettingTile(
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
                    activeThumbColor: const Color(0xFF87CEEB),
                  ),
                ),
                _buildSettingTile(
                  icon: Icons.language,
                  title: AppLocalizations.getText('language', widget.language),
                  subtitle: AppLocalizations.getText(
                    'select_language',
                    widget.language,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.language,
                        style: TextStyle(
                          color: widget.isDarkMode
                              ? Colors.grey[300]
                              : Colors.black54,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.chevron_right,
                        color: widget.isDarkMode
                            ? Colors.grey[400]
                            : Colors.grey,
                      ),
                    ],
                  ),
                  onTap: _showLanguageSheet,
                ),
              ],
            ),
            const SizedBox(height: 24),

            _buildSettingsGroup(
              title: AppLocalizations.getText('notifications', widget.language),
              children: [
                _buildSettingTile(
                  icon: Icons.notifications_active,
                  title: AppLocalizations.getText(
                    'notifications',
                    widget.language,
                  ),
                  subtitle: AppLocalizations.getText(
                    'notification_subtitle',
                    widget.language,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: widget.isDarkMode ? Colors.grey[400] : Colors.grey,
                  ),
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 24),

            _buildSettingsGroup(
              title: AppLocalizations.getText('privacy', widget.language),
              children: [
                _buildSettingTile(
                  icon: Icons.lock,
                  title: AppLocalizations.getText('privacy', widget.language),
                  subtitle: AppLocalizations.getText(
                    'privacy_subtitle',
                    widget.language,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: widget.isDarkMode ? Colors.grey[400] : Colors.grey,
                  ),
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 24),

            _buildSettingsGroup(
              title: AppLocalizations.getText('backup', widget.language),
              children: [
                _buildSettingTile(
                  icon: Icons.backup,
                  title: AppLocalizations.getText('backup', widget.language),
                  subtitle: AppLocalizations.getText(
                    'backup_subtitle',
                    widget.language,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: widget.isDarkMode ? Colors.grey[400] : Colors.grey,
                  ),
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 24),

            _buildSettingsGroup(
              title: AppLocalizations.getText('info', widget.language),
              children: [
                _buildSettingTile(
                  icon: Icons.info_outline,
                  title: AppLocalizations.getText('version', widget.language),
                  subtitle: '1.0.0',
                  trailing: SizedBox.shrink(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF87CEEB), Color(0xFF4FC3F7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF87CEEB).withOpacity(0.35),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 34),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _userName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _userEmail,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            icon: const Icon(Icons.edit, size: 18),
            label: Text(
              AppLocalizations.getText('edit_profile', widget.language),
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsGroup({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: widget.isDarkMode ? Colors.white70 : Colors.black54,
              letterSpacing: 0.2,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: widget.isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: widget.isDarkMode
                    ? Colors.black.withOpacity(0.3)
                    : Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              for (int i = 0; i < children.length; i++) ...[
                if (i > 0)
                  Divider(
                    height: 1,
                    thickness: 0.5,
                    color: widget.isDarkMode
                        ? Colors.white.withOpacity(0.08)
                        : Colors.black.withOpacity(0.06),
                  ),
                children[i],
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    final Color iconBg = const Color(0xFF87CEEB).withOpacity(0.15);
    final Color iconColor = const Color(0xFF87CEEB);
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: iconBg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: widget.isDarkMode ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: subtitle == null
          ? null
          : Text(
              subtitle,
              style: TextStyle(
                color: widget.isDarkMode ? Colors.grey[400] : Colors.grey[600],
              ),
            ),
      trailing: trailing,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  void _showLanguageSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: widget.isDarkMode
          ? const Color(0xFF1E1E1E)
          : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('日本語'),
                onTap: () {
                  widget.onLanguageChanged('日本語');
                  _saveSettings();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('한국어'),
                onTap: () {
                  widget.onLanguageChanged('한국어');
                  _saveSettings();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('English'),
                onTap: () {
                  widget.onLanguageChanged('English');
                  _saveSettings();
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
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
              activeThumbColor: const Color(0xFF87CEEB),
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

// 루틴 생성 다이얼로그
class _CreateRoutineDialog extends StatefulWidget {
  final bool isDarkMode;
  final String language;
  final List<String> allExercises;
  final List<String> favoriteExercises;
  final Function(Map<String, dynamic>) onSave;

  const _CreateRoutineDialog({
    required this.isDarkMode,
    required this.language,
    required this.allExercises,
    required this.favoriteExercises,
    required this.onSave,
  });

  @override
  State<_CreateRoutineDialog> createState() => _CreateRoutineDialogState();
}

class _CreateRoutineDialogState extends State<_CreateRoutineDialog> {
  int _currentStep = 0;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  Set<int> _selectedDays = {};
  List<String> _selectedExercises = [];
  List<String> _filteredExercises = [];

  @override
  void initState() {
    super.initState();
    _filteredExercises = widget.allExercises;
    _searchController.addListener(_onSearchChanged);
    _sortExercises();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      if (_searchController.text.isEmpty) {
        _filteredExercises = widget.allExercises;
      } else {
        final searchText = _searchController.text.toLowerCase();
        _filteredExercises = widget.allExercises.where((exercise) {
          final exerciseName = AppLocalizations.getText(
            exercise,
            widget.language,
          ).toLowerCase();

          if (exerciseName.contains(searchText)) {
            return true;
          }

          // 일본어인 경우 히라가나-가타카나 변환 검색
          if (widget.language == '日本語') {
            final hiraganaSearch = _toHiragana(searchText);
            final katakanaSearch = _toKatakana(searchText);
            final hiraganaExercise = _toHiragana(exerciseName);
            final katakanaExercise = _toKatakana(exerciseName);

            return hiraganaExercise.contains(hiraganaSearch) ||
                katakanaExercise.contains(katakanaSearch) ||
                hiraganaExercise.contains(katakanaSearch) ||
                katakanaExercise.contains(hiraganaSearch);
          }

          return false;
        }).toList();
      }
      _sortExercises();
    });
  }

  void _sortExercises() {
    _filteredExercises.sort((a, b) {
      final aIsFavorite = widget.favoriteExercises.contains(a);
      final bIsFavorite = widget.favoriteExercises.contains(b);

      if (aIsFavorite && !bIsFavorite) return -1;
      if (!aIsFavorite && bIsFavorite) return 1;

      final aName = AppLocalizations.getText(a, widget.language).toLowerCase();
      final bName = AppLocalizations.getText(b, widget.language).toLowerCase();

      if (widget.language == '한국어') {
        return aName.compareTo(bName);
      } else if (widget.language == '日本語') {
        final aHiragana = _toHiragana(aName);
        final bHiragana = _toHiragana(bName);
        return aHiragana.compareTo(bHiragana);
      } else {
        return aName.compareTo(bName);
      }
    });
  }

  String _toKatakana(String text) {
    return text.replaceAllMapped(
      RegExp(r'[\u3041-\u3096]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 0x60),
    );
  }

  String _toHiragana(String text) {
    return text.replaceAllMapped(
      RegExp(r'[\u30A1-\u30F6]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) - 0x60),
    );
  }

  void _nextStep() {
    if (_currentStep == 0 && _nameController.text.isEmpty) {
      return;
    }
    if (_currentStep < 1) {
      setState(() => _currentStep++);
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }

  void _saveRoutine() {
    if (_nameController.text.isEmpty || _selectedExercises.isEmpty) {
      return;
    }

    widget.onSave({
      'name': _nameController.text,
      'exercises': _selectedExercises,
      'days': _selectedDays.toList(),
      'createdAt': DateTime.now().toIso8601String(),
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
          maxWidth: MediaQuery.of(context).size.width * 0.9,
        ),
        decoration: BoxDecoration(
          color: widget.isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 헤더
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color(0xFF667EEA), const Color(0xFF764BA2)],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.fitness_center, color: Colors.white, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _currentStep == 0
                          ? AppLocalizations.getText(
                              'create_routine',
                              widget.language,
                            )
                          : AppLocalizations.getText(
                              'select_exercises',
                              widget.language,
                            ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),

            // 진행 표시기
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  _buildStepIndicator(0, '정보'),
                  Expanded(
                    child: Container(
                      height: 2,
                      color: _currentStep > 0
                          ? const Color(0xFF667EEA)
                          : (widget.isDarkMode
                                ? Colors.grey[700]
                                : Colors.grey[300]),
                    ),
                  ),
                  _buildStepIndicator(1, '운동'),
                ],
              ),
            ),

            // 내용
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: _currentStep == 0 ? _buildStep1() : _buildStep2(),
              ),
            ),

            // 버튼들
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: widget.isDarkMode ? Colors.grey[900] : Colors.grey[50],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentStep > 0)
                    TextButton.icon(
                      onPressed: _previousStep,
                      icon: const Icon(Icons.arrow_back),
                      label: Text(
                        AppLocalizations.getText('back', widget.language),
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: widget.isDarkMode
                            ? Colors.grey[400]
                            : Colors.grey[700],
                      ),
                    )
                  else
                    const SizedBox(),

                  ElevatedButton(
                    onPressed: _currentStep == 0 ? _nextStep : _saveRoutine,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF667EEA),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _currentStep == 0
                              ? AppLocalizations.getText(
                                  'next',
                                  widget.language,
                                )
                              : AppLocalizations.getText(
                                  'save_routine',
                                  widget.language,
                                ),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          _currentStep == 0 ? Icons.arrow_forward : Icons.check,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepIndicator(int step, String label) {
    final isActive = _currentStep >= step;
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isActive
                ? const Color(0xFF667EEA)
                : (widget.isDarkMode ? Colors.grey[700] : Colors.grey[300]),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: isActive
                ? Icon(Icons.check, color: Colors.white, size: 18)
                : Text(
                    '${step + 1}',
                    style: TextStyle(
                      color: widget.isDarkMode
                          ? Colors.grey[500]
                          : Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            color: isActive
                ? (widget.isDarkMode ? Colors.white : Colors.black87)
                : (widget.isDarkMode ? Colors.grey[500] : Colors.grey[600]),
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildStep1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 루틴명
        Text(
          AppLocalizations.getText('routine_name', widget.language),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: widget.isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _nameController,
          autofocus: true,
          style: TextStyle(
            color: widget.isDarkMode ? Colors.white : Colors.black,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintText: '예: 아침 운동',
            hintStyle: TextStyle(
              color: widget.isDarkMode ? Colors.grey[600] : Colors.grey[400],
            ),
            filled: true,
            fillColor: widget.isDarkMode ? Colors.grey[800] : Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),

        const SizedBox(height: 32),

        // 요일 선택
        Text(
          '${AppLocalizations.getText('days', widget.language)} (선택사항)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: widget.isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(7, (index) {
            final days = ['월', '화', '수', '목', '금', '토', '일'];
            final isSelected = _selectedDays.contains(index);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    _selectedDays.remove(index);
                  } else {
                    _selectedDays.add(index);
                  }
                });
              },
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF667EEA)
                      : (widget.isDarkMode
                            ? Colors.grey[800]
                            : Colors.grey[100]),
                  borderRadius: BorderRadius.circular(12),
                  border: isSelected
                      ? null
                      : Border.all(
                          color: widget.isDarkMode
                              ? Colors.grey[700]!
                              : Colors.grey[300]!,
                        ),
                ),
                child: Center(
                  child: Text(
                    days[index],
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : (widget.isDarkMode
                                ? Colors.grey[400]
                                : Colors.grey[700]),
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildStep2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 검색창
        TextField(
          controller: _searchController,
          style: TextStyle(
            color: widget.isDarkMode ? Colors.white : Colors.black,
          ),
          decoration: InputDecoration(
            hintText: '운동 검색...',
            hintStyle: TextStyle(
              color: widget.isDarkMode ? Colors.grey[600] : Colors.grey[400],
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
                      _onSearchChanged();
                    },
                  )
                : null,
            filled: true,
            fillColor: widget.isDarkMode ? Colors.grey[800] : Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),

        const SizedBox(height: 16),

        // 선택된 운동 표시
        if (_selectedExercises.isNotEmpty) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '선택된 운동 (${_selectedExercises.length}개)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: widget.isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
              Text(
                '드래그하여 순서 변경',
                style: TextStyle(
                  fontSize: 12,
                  color: widget.isDarkMode
                      ? Colors.grey[500]
                      : Colors.grey[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: widget.isDarkMode ? Colors.grey[850] : Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: widget.isDarkMode
                    ? Colors.grey[800]!
                    : Colors.grey[200]!,
              ),
            ),
            child: ReorderableListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _selectedExercises.length,
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  final item = _selectedExercises.removeAt(oldIndex);
                  _selectedExercises.insert(newIndex, item);
                });
              },
              itemBuilder: (context, index) {
                final exercise = _selectedExercises[index];
                return Container(
                  key: ValueKey(exercise),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF667EEA).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFF667EEA).withOpacity(0.3),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.drag_handle,
                          color: widget.isDarkMode
                              ? Colors.grey[400]
                              : Colors.grey[600],
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            color: Color(0xFF667EEA),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            AppLocalizations.getText(exercise, widget.language),
                            style: TextStyle(
                              color: widget.isDarkMode
                                  ? Colors.white
                                  : Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, size: 20),
                          color: widget.isDarkMode
                              ? Colors.grey[400]
                              : Colors.grey[600],
                          onPressed: () {
                            setState(() {
                              _selectedExercises.remove(exercise);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
        ],

        // 운동 리스트
        ...(_filteredExercises.isEmpty
            ? [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Text(
                      '검색 결과가 없습니다',
                      style: TextStyle(
                        color: widget.isDarkMode
                            ? Colors.grey[500]
                            : Colors.grey[600],
                      ),
                    ),
                  ),
                ),
              ]
            : _filteredExercises.map((exercise) {
                final isSelected = _selectedExercises.contains(exercise);
                final isFavorite = widget.favoriteExercises.contains(exercise);
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF667EEA).withOpacity(0.1)
                        : (widget.isDarkMode
                              ? Colors.grey[850]
                              : Colors.grey[50]),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF667EEA)
                          : (widget.isDarkMode
                                ? Colors.grey[800]!
                                : Colors.grey[200]!),
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: CheckboxListTile(
                    title: Row(
                      children: [
                        if (isFavorite)
                          const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                          ),
                        Expanded(
                          child: Text(
                            AppLocalizations.getText(exercise, widget.language),
                            style: TextStyle(
                              color: widget.isDarkMode
                                  ? Colors.white
                                  : Colors.black87,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    value: isSelected,
                    activeColor: const Color(0xFF667EEA),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _selectedExercises.add(exercise);
                        } else {
                          _selectedExercises.remove(exercise);
                        }
                      });
                    },
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                );
              }).toList()),
      ],
    );
  }
}

// 루틴 분석 다이얼로그
class _RoutineAnalysisDialog extends StatelessWidget {
  final Map<String, dynamic> routine;
  final bool isDarkMode;
  final String language;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _RoutineAnalysisDialog({
    required this.routine,
    required this.isDarkMode,
    required this.language,
    required this.onEdit,
    required this.onDelete,
  });

  Map<String, int> _analyzeBodyParts() {
    final exercises = (routine['exercises'] as List<dynamic>).cast<String>();
    final bodyParts = <String, int>{
      'upper': 0, // 상체
      'lower': 0, // 하체
      'core': 0, // 코어
      'cardio': 0, // 유산소
      'flexibility': 0, // 유연성
    };

    // 운동별 신체 부위 매핑
    final exerciseBodyParts = {
      // 상체
      'push_up': 'upper',
      'bench_press': 'upper',
      'dumbbell_fly': 'upper',
      'shoulder_press': 'upper',
      'bicep_curl': 'upper',
      'tricep_dips': 'upper',
      'pull_up': 'upper',
      'chin_up': 'upper',
      'overhead_extension': 'upper',
      'lateral_raise': 'upper',
      'front_raise': 'upper',
      'arnold_press': 'upper',
      'hammer_curl': 'upper',
      'concentration_curl': 'upper',
      'skull_crusher': 'upper',
      'chest_press': 'upper',
      'incline_press': 'upper',
      'decline_press': 'upper',
      'cable_crossover': 'upper',
      'pec_deck': 'upper',
      'tricep_pushdown': 'upper',
      'rope_pulldown': 'upper',
      'overhead_tricep': 'upper',
      'lat_pulldown': 'upper',
      'bent_over_row': 'upper',
      'single_arm_row': 'upper',
      'seated_row': 'upper',
      't_bar_row': 'upper',
      'face_pull': 'upper',
      'reverse_fly': 'upper',
      'shrug': 'upper',

      // 하체
      'squat': 'lower',
      'lunges': 'lower',
      'deadlift': 'lower',
      'leg_press': 'lower',
      'leg_extension': 'lower',
      'leg_curl': 'lower',
      'calf_raise': 'lower',
      'glute_bridge': 'lower',
      'wall_sit': 'lower',
      'romanian_deadlift': 'lower',
      'sumo_deadlift': 'lower',
      'front_squat': 'lower',
      'goblet_squat': 'lower',
      'bulgarian_split_squat': 'lower',
      'hip_thrust': 'lower',
      'step_up': 'lower',

      // 코어
      'plank': 'core',
      'sit_up': 'core',
      'crunches': 'core',
      'side_plank': 'core',
      'bicycle_crunch': 'core',
      'russian_twist': 'core',
      'leg_raise': 'core',
      'flutter_kicks': 'core',
      'scissors_kicks': 'core',
      'v_up': 'core',
      'hollow_hold': 'core',
      'dead_bug': 'core',
      'bird_dog': 'core',
      'plank_up_down': 'core',
      'plank_jack': 'core',
      'ab_wheel': 'core',
      'hanging_leg_raise': 'core',

      // 유산소
      'burpees': 'cardio',
      'jumping_jacks': 'cardio',
      'high_knees': 'cardio',
      'butt_kicks': 'cardio',
      'mountain_climber': 'cardio',
      'running': 'cardio',
      'jogging': 'cardio',
      'sprints': 'cardio',
      'jump_rope': 'cardio',
      'box_jump': 'cardio',
      'bear_crawl': 'cardio',
      'crab_walk': 'cardio',
      'shuttle_run': 'cardio',
      'stair_climb': 'cardio',
      'depth_jump': 'cardio',
      'broad_jump': 'cardio',
      'tuck_jump': 'cardio',
      'split_jump': 'cardio',
      'lateral_bound': 'cardio',
      'single_leg_hop': 'cardio',
      'plyo_push_up': 'cardio',

      // 유연성
      'sun_salutation': 'flexibility',
      'downward_dog': 'flexibility',
      'upward_dog': 'flexibility',
      'warrior_pose': 'flexibility',
      'warrior_2': 'flexibility',
      'warrior_3': 'flexibility',
      'tree_pose': 'flexibility',
      'child_pose': 'flexibility',
      'cobra_pose': 'flexibility',
      'bridge_pose': 'flexibility',
      'cat_cow': 'flexibility',
      'pigeon_pose': 'flexibility',
      'triangle_pose': 'flexibility',
      'half_moon': 'flexibility',
      'chair_pose': 'flexibility',
      'boat_pose': 'flexibility',
      'bow_pose': 'flexibility',
      'camel_pose': 'flexibility',
      'fish_pose': 'flexibility',
      'seated_forward_bend': 'flexibility',
      'spinal_twist': 'flexibility',
    };

    for (final exercise in exercises) {
      final bodyPart = exerciseBodyParts[exercise];
      if (bodyPart != null) {
        bodyParts[bodyPart] = (bodyParts[bodyPart] ?? 0) + 1;
      }
    }

    return bodyParts;
  }

  String _getPrimaryFocus() {
    final bodyParts = _analyzeBodyParts();
    final maxEntry = bodyParts.entries.reduce(
      (a, b) => a.value > b.value ? a : b,
    );

    final focusNames = {
      'upper': '상체 집중',
      'lower': '하체 집중',
      'core': '코어 집중',
      'cardio': '유산소 집중',
      'flexibility': '유연성 집중',
    };

    return focusNames[maxEntry.key] ?? '균형 운동';
  }

  @override
  Widget build(BuildContext context) {
    final exercises = (routine['exercises'] as List<dynamic>).cast<String>();
    final bodyParts = _analyzeBodyParts();
    final totalExercises = exercises.length;
    final primaryFocus = _getPrimaryFocus();

    // 예상 운동 시간 계산 (운동당 3분 가정)
    final estimatedTime = totalExercises * 3;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
          maxWidth: MediaQuery.of(context).size.width * 0.9,
        ),
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 헤더
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.analytics, color: Colors.white, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      routine['name'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),

            // 내용
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 통계 카드들
                    Row(
                      children: [
                        Expanded(
                          child: _buildStatCard(
                            icon: Icons.fitness_center,
                            label: '총 운동',
                            value: '$totalExercises개',
                            color: const Color(0xFF667EEA),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildStatCard(
                            icon: Icons.timer,
                            label: '예상 시간',
                            value: '~$estimatedTime분',
                            color: const Color(0xFF43E97B),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: _buildStatCard(
                            icon: Icons.psychology,
                            label: '집중 부위',
                            value: primaryFocus,
                            color: const Color(0xFFF093FB),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildStatCard(
                            icon: Icons.calendar_month,
                            label: '사용 횟수',
                            value: '0회', // TODO: 실제 사용 횟수 추적
                            color: const Color(0xFF4FACFE),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // 신체 부위 분석
                    Text(
                      '신체 부위 분석',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildBodyPartChart(bodyParts, totalExercises),

                    const SizedBox(height: 24),

                    // 운동 목록
                    Text(
                      '포함된 운동 (${exercises.length}개)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...exercises.asMap().entries.map((entry) {
                      final index = entry.key;
                      final exercise = entry.value;
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? Colors.grey[850]
                              : Colors.grey[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isDarkMode
                                ? Colors.grey[800]!
                                : Colors.grey[200]!,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: const BoxDecoration(
                                color: Color(0xFF667EEA),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                AppLocalizations.getText(exercise, language),
                                style: TextStyle(
                                  color: isDarkMode
                                      ? Colors.white
                                      : Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),

            // 하단 버튼들
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[900] : Colors.grey[50],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: isDarkMode
                                ? Colors.grey[800]
                                : Colors.white,
                            title: Text(
                              '루틴 삭제',
                              style: TextStyle(
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            content: Text(
                              '이 루틴을 삭제하시겠습니까?',
                              style: TextStyle(
                                color: isDarkMode
                                    ? Colors.grey[300]
                                    : Colors.grey[700],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('취소'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  onDelete();
                                },
                                child: const Text(
                                  '삭제',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.delete_outline, size: 20),
                      label: const Text('삭제'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: onEdit,
                      icon: const Icon(Icons.edit, size: 20),
                      label: const Text('수정'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF667EEA),
                        side: const BorderSide(color: Color(0xFF667EEA)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                        // TODO: 루틴 시작 로직
                      },
                      icon: const Icon(Icons.play_arrow, size: 20),
                      label: const Text('시작'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF667EEA),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBodyPartChart(Map<String, int> bodyParts, int total) {
    final bodyPartNames = {
      'upper': '상체',
      'lower': '하체',
      'core': '코어',
      'cardio': '유산소',
      'flexibility': '유연성',
    };

    final bodyPartColors = {
      'upper': const Color(0xFF667EEA),
      'lower': const Color(0xFF43E97B),
      'core': const Color(0xFFF093FB),
      'cardio': const Color(0xFF4FACFE),
      'flexibility': const Color(0xFFFA709A),
    };

    return Column(
      children: bodyParts.entries.where((e) => e.value > 0).map((entry) {
        final percentage = (entry.value / total * 100).toInt();
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    bodyPartNames[entry.key]!,
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '$percentage% (${entry.value}개)',
                    style: TextStyle(
                      color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: percentage / 100,
                  backgroundColor: isDarkMode
                      ? Colors.grey[800]
                      : Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    bodyPartColors[entry.key]!,
                  ),
                  minHeight: 8,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
