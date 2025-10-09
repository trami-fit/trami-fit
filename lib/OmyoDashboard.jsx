import React, { useEffect, useRef, useState } from "react";
import { XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, PieChart, Pie, Cell, BarChart, Bar, LineChart, Line } from "recharts";

/**
 * Trami / Omyo Dashboard – fixed build
 * - 홈: 상단 요약(총 운동시간/체중 변화/운동 주기) + 타이머
 * - 루틴: 우상단 검색, 상단 작성한 루틴(+4주 히트스트립), 하단 즐겨찾기
 * - 기록: 달력 + 날짜별 리스트 + 주간 막대 + 카테고리 도넛 + 몸무게 선그래프
 */
export default function OmyoDashboard() {
  const [activeTab, setActiveTab] = useState("home");
  return (
    <div className="min-h-screen w-full bg-neutral-50 text-neutral-900 pb-24">
      {activeTab === "home" && <HomeDashboard />}
      {activeTab === "routine" && <RoutineTab />}
      {activeTab === "log" && <LogTab />}
      {activeTab === "settings" && <SettingsTab />}
      <BottomNav active={activeTab} onNavigate={setActiveTab} />
    </div>
  );
}

/* ---------------- Home ---------------- */
function HomeDashboard() {
  const [lastWorkoutAgoHours] = useState(52);
  const monthStats = { totalMinutes: 440, weightDiff: -1.2, avgInterval: 2.5 };

  // 타이머
  const [isRunning, setIsRunning] = useState(false);
  const [seconds, setSeconds] = useState(0);
  const tickRef = useRef(null);
  useEffect(() => {
    if (isRunning) tickRef.current = setInterval(() => setSeconds((s) => s + 1), 1000);
    return () => tickRef.current && clearInterval(tickRef.current);
  }, [isRunning]);
  const minutes = String(Math.floor(seconds / 60)).padStart(2, "0");
  const secs = String(seconds % 60).padStart(2, "0");
  const circumference = 2 * Math.PI * 90;
  const progress = Math.min(seconds % (45 * 60), 45 * 60) / (45 * 60);
  const dashOffset = circumference * (1 - progress);

  return (
    <>
      {/* 헤더 */}
      <header className="px-5 pt-6 pb-4">
        <div className="flex items-center justify-between">
          <div className="space-y-1">
            <h2 className="text-lg font-semibold">오늘 루틴 준비됐나요?</h2>
          </div>
          <div className="flex items-center gap-2">
            <button aria-label="달력" className="p-2 rounded-full bg-white ring-1 ring-black/5 shadow-sm">
              <svg viewBox="0 0 24 24" className="h-5 w-5"><path d="M7 2v3m10-3v3M3 9h18M5 7h14a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V9a2 2 0 0 1 2-2Z" fill="none" stroke="currentColor" strokeWidth="2"/></svg>
            </button>
            <button aria-label="몸무게" className="p-2 rounded-full bg-white ring-1 ring-black/5 shadow-sm">
              <svg viewBox="0 0 24 24" className="h-5 w-5"><path d="M6 3h12a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2Zm6 5a4 4 0 1 1 0 8 4 4 0 0 1 0-8Z" fill="currentColor"/></svg>
            </button>
          </div>
        </div>
      </header>

      {/* 상단 요약 3종 */}
      <section className="px-5">
        <div className="rounded-2xl bg-white ring-1 ring-black/5 shadow-sm p-3">
          <div className="grid grid-cols-3 divide-x divide-black/5">
            <StatBlock label="총 운동시간" value={`${Math.floor(monthStats.totalMinutes/60)}시간 ${monthStats.totalMinutes%60}분`} />
            <StatBlock label="체중 변화" value={`${monthStats.weightDiff>0?"+":""}${monthStats.weightDiff}kg`} />
            <StatBlock label="운동 주기" value={`${monthStats.avgInterval.toFixed(1)}일마다`} />
          </div>
        </div>
      </section>

      {/* 타이머 */}
      <main className="px-5 pt-4 pb-2">
        <div className="rounded-3xl bg-white ring-1 ring-black/5 shadow-sm p-6">
          <div className="w-full grid place-items-center">
            <div className="relative h-56 w-56">
              <svg viewBox="0 0 200 200" className="h-56 w-56">
                <circle cx="100" cy="100" r="90" className="fill-none stroke-neutral-200" strokeWidth="16" />
                <circle cx="100" cy="100" r="90" className="fill-none stroke-neutral-900" strokeWidth="16" strokeLinecap="round" strokeDasharray={circumference} strokeDashoffset={dashOffset} transform="rotate(-90 100 100)" />
              </svg>
              <div className="absolute inset-0 grid place-items-center">
                <div className="text-4xl font-bold tabular-nums">{minutes}:{secs}</div>
                <div className="text-xs text-neutral-500 mt-1">목표 45:00</div>
              </div>
            </div>
          </div>
          <div className="mt-4 flex items-center justify-center gap-3">
            <button onClick={() => setIsRunning((v) => !v)} className={`px-5 py-2 rounded-full text-white text-sm ${isRunning ? "bg-red-600" : "bg-neutral-900"}`}>{isRunning ? "일시정지" : "시작"}</button>
            <button onClick={() => setSeconds(0)} className="px-5 py-2 rounded-full bg-neutral-100 text-sm">리셋</button>
          </div>
          <p className="mt-3 text-center text-xs text-neutral-500">최근 운동 {Math.floor(lastWorkoutAgoHours/24)}일 전</p>
        </div>
      </main>
    </>
  );
}

function StatBlock({ label, value }) {
  return (
    <div className="px-3 py-2 text-center">
      <div className="text-[11px] text-neutral-500">{label}</div>
      <div className="text-sm font-semibold mt-1">{value}</div>
    </div>
  );
}

/* ---------------- Routine ---------------- */
function RoutineTab() {
  const [favorites, setFavorites] = useState(["스쿼트", "플랭크", "힙브릿지"]);
  const [routines, setRoutines] = useState([
    { title: "하체 집중 트레이닝", time: "30분", level: "초급", usage: { sessions: 6, minutes: 145, weeks: [2,1,0,3] } },
    { title: "밤 요가", time: "20분", level: "릴랙스", usage: { sessions: 9, minutes: 180, weeks: [3,2,2,2] } },
  ]);

  function removeFav(name) { setFavorites((list) => list.filter((x) => x !== name)); }

  return (
    <div className="p-6 pb-24 relative">
      <div className="flex items-center justify-between mb-5">
        <h2 className="text-lg font-semibold">내 루틴</h2>
        <button aria-label="검색" className="p-2 rounded-full bg-white ring-1 ring-black/5 shadow-sm">
          <svg viewBox="0 0 24 24" className="h-5 w-5"><path d="M11 4a7 7 0 1 1 0 14 7 7 0 0 1 0-14Zm0 0l9 9" fill="none" stroke="currentColor" strokeWidth="2"/></svg>
        </button>
      </div>

      {/* 작성한 루틴 */}
      <section className="mb-6">
        <div className="text-sm font-medium mb-2">작성한 루틴</div>
        {routines.length === 0 ? (
          <div className="rounded-2xl bg-white ring-1 ring-black/5 p-4 text-sm text-neutral-500 text-center">작성된 루틴이 없습니다.</div>
        ) : (
          <div className="space-y-3">
            {routines.map((r, i) => (
              <div key={i} className="bg-white rounded-2xl ring-1 ring-black/5 shadow-sm p-4">
                <div className="flex items-center justify-between">
                  <div>
                    <div className="font-medium text-sm">{r.title}</div>
                    <div className="text-xs text-neutral-500 mt-1">{r.time} · {r.level}</div>
                  </div>
                  <button className="px-4 py-2 rounded-full bg-neutral-900 text-white text-xs">시작</button>
                </div>
                {/* 4주 히트스트립 + 누적치 */}
                <div className="mt-3 flex items-center justify-between">
                  <div className="flex items-center gap-1">
                    {r.usage.weeks.map((w, idx) => (
                      <div key={idx} className="h-2.5 w-10 rounded bg-neutral-200 overflow-hidden">
                        <div className="h-full bg-neutral-900" style={{ width: `${Math.min(w,5)/5*100}%` }} />
                      </div>
                    ))}
                  </div>
                  <div className="text-xs text-neutral-500 tabular-nums">
                    {r.usage.sessions}회 · {Math.floor(r.usage.minutes/60)}시간{r.usage.minutes%60}분
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}
      </section>

      {/* 즐겨찾기 운동 */}
      <section>
        <div className="text-sm font-medium mb-2">즐겨찾기 운동</div>
        {favorites.length === 0 ? (
          <div className="rounded-2xl bg-white ring-1 ring-black/5 p-4 text-sm text-neutral-500 text-center">즐겨찾기한 운동이 없습니다.</div>
        ) : (
          <div className="flex flex-wrap gap-2">
            {favorites.map((name) => (
              <div key={name} className="flex items-center gap-2 px-3 py-2 rounded-full bg-white ring-1 ring-black/5 shadow-sm text-sm">
                <span>{name}</span>
                <button aria-label="즐겨찾기 제거" onClick={() => removeFav(name)} className="text-neutral-400 hover:text-neutral-700">✕</button>
              </div>
            ))}
          </div>
        )}
      </section>

      {/* 작성 버튼 */}
      <button className="fixed bottom-20 right-6 h-14 w-14 rounded-full bg-neutral-900 text-white shadow-lg grid place-items-center" aria-label="루틴 작성" onClick={() => alert('루틴 작성 페이지로 이동')}>
        <svg viewBox="0 0 24 24" className="h-6 w-6"><path d="M12 5v14M5 12h14" stroke="currentColor" strokeWidth="2" fill="none"/></svg>
      </button>
    </div>
  );
}

/* ---------------- Log ---------------- */
function LogTab() {
  const today = new Date();
  const [currentMonth, setCurrentMonth] = useState(new Date(today.getFullYear(), today.getMonth(), 1));
  const [selectedDate, setSelectedDate] = useState(today);

  // 샘플 기록 데이터
  const logs = [
    { date: "2025-10-02", routine: "하체 집중 트레이닝", category: "하체", minutes: 40, intensity: 3, note: "스쿼트 폼 안정적" },
    { date: "2025-10-03", routine: "밤 요가", category: "요가", minutes: 20, intensity: 1, note: "호흡 위주" },
    { date: "2025-10-05", routine: "유산소 서킷", category: "유산소", minutes: 25, intensity: 2, note: "약간 숨참" },
    { date: "2025-10-08", routine: "상체 루틴", category: "상체", minutes: 35, intensity: 3, note: "랫풀다운 중량 +" },
    { date: "2025-10-10", routine: "하체 집중 트레이닝", category: "하체", minutes: 45, intensity: 4, note: "불가리안 스쿼트" },
    { date: "2025-10-12", routine: "밤 요가", category: "요가", minutes: 30, intensity: 1, note: "스트레칭" },
    { date: "2025-10-14", routine: "유산소 서킷", category: "유산소", minutes: 22, intensity: 2, note: "버피 3세트" },
  ];

  // 유틸
  const fmt = (d) => d.toISOString().slice(0,10);
  const monthKey = (d) => `${d.getFullYear()}-${String(d.getMonth()+1).padStart(2,'0')}`;
  const selectedKey = fmt(selectedDate);

  // 달력 생성
  const start = new Date(currentMonth.getFullYear(), currentMonth.getMonth(), 1);
  const end = new Date(currentMonth.getFullYear(), currentMonth.getMonth()+1, 0);
  const firstDow = start.getDay(); // 0=Sun
  const daysInMonth = end.getDate();
  const calendarCells = [];
  for (let i=0; i<firstDow; i++) calendarCells.push(null);
  for (let d=1; d<=daysInMonth; d++) calendarCells.push(new Date(currentMonth.getFullYear(), currentMonth.getMonth(), d));

  const logsThisMonth = logs.filter(l => l.date.startsWith(monthKey(currentMonth)));
  const logDatesSet = new Set(logsThisMonth.map(l => l.date));

  // 선택일 기록
  const dayLogs = logs.filter(l => l.date === selectedKey);

  // 리포트: 주간 집계
  const firstWeekday = start.getDay();
  const weekOfMonth = (d) => Math.floor((firstWeekday + (d-1)) / 7) + 1; // 1..5
  const weekly = [0,0,0,0,0];
  for (let d=1; d<=daysInMonth; d++) {
    const key = `${currentMonth.getFullYear()}-${String(currentMonth.getMonth()+1).padStart(2,'0')}-${String(d).padStart(2,'0')}`;
    const total = logs.filter(l=> l.date===key).reduce((s,l)=> s+l.minutes, 0);
    const w = weekOfMonth(d)-1;
    weekly[w] += total;
  }
  const weeklyData = weekly.map((m, i)=> ({ week: `${i+1}주`, minutes: m }));
  const totalMin = weekly.reduce((a,b)=>a+b,0);
  const avgMin = Math.round(totalMin / (weekly.filter(v=>v>0).length || 1));

  // 리포트: 카테고리 분포
  const group = {};
  logsThisMonth.forEach(l => { group[l.category] = (group[l.category]||0) + l.minutes; });
  const pieData = Object.entries(group).map(([name, value]) => ({ name, value }));
  const PIE_COLORS = ["#0f172a", "#334155", "#94a3b8", "#cbd5e1"];

  // 몸무게 추세
  const weightData = [
    { date: '10/01', weight: 60.2 },
    { date: '10/04', weight: 60.0 },
    { date: '10/07', weight: 59.8 },
    { date: '10/10', weight: 59.5 },
    { date: '10/13', weight: 59.4 },
    { date: '10/15', weight: 59.2 },
  ];

  function changeMonth(delta) {
    const m = new Date(currentMonth);
    m.setMonth(m.getMonth()+delta);
    setCurrentMonth(m);
    setSelectedDate(new Date(m.getFullYear(), m.getMonth(), 1));
  }

  return (
    <div className="p-6 space-y-6">
      {/* 상단 달력 */}
      <section className="bg-white rounded-2xl ring-1 ring-black/5 shadow-sm p-4">
        <div className="flex items-center justify-between mb-3">
          <button onClick={()=>changeMonth(-1)} className="px-2 py-1 rounded-lg bg-neutral-100">‹</button>
          <div className="text-sm font-medium">{currentMonth.getFullYear()}. {currentMonth.getMonth()+1}</div>
          <button onClick={()=>changeMonth(1)} className="px-2 py-1 rounded-lg bg-neutral-100">›</button>
        </div>
        <div className="grid grid-cols-7 gap-1 text-center text-[11px] text-neutral-500 mb-1">
          {['일','월','화','수','목','금','토'].map(d=> <div key={d}>{d}</div>)}
        </div>
        <div className="grid grid-cols-7 gap-1">
          {calendarCells.map((d, idx)=> (
            <button key={idx}
              disabled={!d}
              onClick={()=> d && setSelectedDate(d)}
              className={`h-10 rounded-xl grid place-items-center relative ${!d? 'bg-transparent' : 'bg-neutral-50 hover:bg-neutral-100'} ${d && fmt(d)===selectedKey ? 'ring-1 ring-black/5 bg-white shadow-sm' : ''}`}
            >
              {d && <span className="text-xs">{d.getDate()}</span>}
              {d && logDatesSet.has(fmt(d)) && <span className="absolute bottom-1 h-1.5 w-1.5 rounded-full bg-neutral-900" />}
            </button>
          ))}
        </div>
      </section>

      {/* 중단: 선택 날짜 기록 리스트 */}
      <section className="bg-white rounded-2xl ring-1 ring-black/5 shadow-sm p-4">
        <div className="text-sm font-medium mb-2">{selectedKey} 기록</div>
        {dayLogs.length === 0 ? (
          <div className="text-sm text-neutral-500">기록 없음</div>
        ) : (
          <div className="space-y-3">
            {dayLogs.map((l, i)=> (
              <div key={i} className="flex items-center justify-between">
                <div>
                  <div className="text-sm font-medium">{l.routine}</div>
                  <div className="text-xs text-neutral-500">{l.minutes}분 · {l.category} · 강도 {"🔥".repeat(l.intensity)}</div>
                  {l.note && <div className="text-xs text-neutral-400 mt-0.5">메모: {l.note}</div>}
                </div>
                <div className="text-sm tabular-nums text-neutral-600">{l.minutes}분</div>
              </div>
            ))}
          </div>
        )}
      </section>

      {/* 하단: 리포트 */}
      <section className="grid grid-cols-1 gap-4">
        <div className="bg-white rounded-2xl ring-1 ring-black/5 shadow-sm p-4">
          <div className="text-sm font-medium mb-2">이번달 주간 운동시간</div>
          <div className="flex items-center gap-2 mb-2 text-xs text-neutral-600">
            <span className="px-2 py-0.5 rounded-full bg-neutral-100">합계 {Math.floor(totalMin/60)}시간 {totalMin%60}분</span>
            <span className="px-2 py-0.5 rounded-full bg-neutral-100">주평균 {Math.floor(avgMin/60)}시간 {avgMin%60}분</span>
          </div>
          <div className="h-36">
            <ResponsiveContainer width="100%" height="100%">
              <BarChart data={weeklyData} margin={{ left: 8, right: 8, top: 4, bottom: 0 }}>
                <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
                <XAxis dataKey="week" tick={{ fontSize: 10 }} />
                <YAxis tick={{ fontSize: 10 }} width={28} />
                <Tooltip />
                <Bar dataKey="minutes" fill="#0f172a" radius={[8,8,0,0]} />
              </BarChart>
            </ResponsiveContainer>
          </div>
        </div>

        <div className="bg-white rounded-2xl ring-1 ring-black/5 shadow-sm p-4">
          <div className="text-sm font-medium mb-2">카테고리 비율</div>
          <div className="h-40">
            <ResponsiveContainer width="100%" height="100%">
              <PieChart>
                <Pie data={pieData} dataKey="value" nameKey="name" innerRadius={40} outerRadius={70}>
                  {pieData.map((entry, index) => (
                    <Cell key={`cell-${index}`} fill={PIE_COLORS[index % PIE_COLORS.length]} />
                  ))}
                </Pie>
                <Tooltip />
              </PieChart>
            </ResponsiveContainer>
          </div>
        </div>

        <div className="bg-white rounded-2xl ring-1 ring-black/5 shadow-sm p-4">
          <div className="text-sm font-medium mb-2">몸무게 변화</div>
          <div className="h-40">
            <ResponsiveContainer width="100%" height="100%">
              <LineChart data={weightData} margin={{ left: 8, right: 8, top: 4, bottom: 0 }}>
                <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
                <XAxis dataKey="date" tick={{ fontSize: 10 }} />
                <YAxis domain={[58, 61]} tick={{ fontSize: 10 }} width={32} />
                <Tooltip />
                <Line type="monotone" dataKey="weight" stroke="#334155" strokeWidth={2} dot={{ r: 3 }} />
              </LineChart>
            </ResponsiveContainer>
          </div>
        </div>
      </section>
    </div>
  );
}

/* ---------------- Settings ---------------- */
function SettingsTab() {
  return (
    <div className="p-6">
      <h2 className="text-lg font-semibold mb-3">설정</h2>
      <ul className="bg-white rounded-2xl divide-y ring-1 ring-black/5">
        <li className="p-4 text-sm">계정 관리</li>
        <li className="p-4 text-sm">알림 설정</li>
        <li className="p-4 text-sm">테마 변경</li>
        <li className="p-4 text-sm">앱 정보</li>
      </ul>
    </div>
  );
}

/* ---------------- Bottom Nav ---------------- */
function BottomNav({ active, onNavigate }) {
  const items = [
    { key: "home", label: "홈", icon: "🏠" },
    { key: "routine", label: "루틴", icon: "🧘" },
    { key: "log", label: "기록", icon: "📊" },
    { key: "settings", label: "설정", icon: "⚙️" },
  ];
  return (
    <nav className="fixed bottom-0 inset-x-0 bg-white border-t border-black/10">
      <div className="grid grid-cols-4 text-center">
        {items.map((it) => (
          <button key={it.key} onClick={() => onNavigate(it.key)} className={`py-2.5 flex flex-col items-center justify-center text-xs ${active === it.key ? "text-neutral-900 font-medium" : "text-neutral-500"}`}>
            <div>{it.icon}</div>
            <div className="mt-1">{it.label}</div>
          </button>
        ))}
      </div>
    </nav>
  );
}

/* no-scrollbar utility (runtime inject) */
if (typeof document !== "undefined") {
  const style = document.createElement("style");
  style.innerHTML = `
    .no-scrollbar::-webkit-scrollbar { display: none; }
    .no-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }
  `;
  document.head.appendChild(style);
}
