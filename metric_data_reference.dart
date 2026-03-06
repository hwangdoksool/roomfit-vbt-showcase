import 'package:flutter/material.dart';
import 'package:roomfit/features/spoex_kiosk/spoex_theme.dart';

/// VBT 지표 설명 데이터
///
/// 각 지표마다:
/// - title: 지표명
/// - emoji: 아이콘
/// - oneLiner: 한 줄 요약 (고객 설명용)
/// - whatItMeasures: 무엇을 측정하는가
/// - whyItMatters: 왜 중요한가
/// - howToRead: 숫자를 어떻게 읽는가 (좋은/나쁜 기준)
/// - trainerTip: 트레이너/운영요원이 고객에게 설명할 때 쓸 멘트
class VbtMetricInfo {
  final String id;
  final String title;
  final String emoji;
  final String oneLiner;
  final String whatItMeasures;
  final String whyItMatters;
  final String howToRead;
  final String trainerTip;

  const VbtMetricInfo({
    required this.id,
    required this.title,
    required this.emoji,
    required this.oneLiner,
    required this.whatItMeasures,
    required this.whyItMatters,
    required this.howToRead,
    required this.trainerTip,
  });
}

/// 전체 지표 목록
class VbtMetrics {
  VbtMetrics._();

  static const avgVelocity = VbtMetricInfo(
    id: 'avg_velocity',
    title: '평균 Con 속도',
    emoji: '⚡',
    oneLiner: '들어올리는 구간(컨센트릭)의 평균 속도',
    whatItMeasures:
        '케이블을 당기거나 미는 동작에서 "올리는 구간(Concentric)"의 평균 이동 속도를 m/s 단위로 측정합니다. '
        '좌우 케이블 속도의 평균값입니다.',
    whyItMatters:
        'VBT(Velocity Based Training)의 핵심 지표입니다. 같은 무게를 더 빠르게 들수록 근력과 파워가 좋다는 뜻입니다. '
        '세트가 진행되며 속도가 떨어지면 피로가 쌓이고 있다는 신호입니다.\n\n'
        '프로 선수들은 속도를 보고 "오늘 컨디션이 좋다/나쁘다"를 객관적으로 판단합니다.',
    howToRead:
        '• 0.8 m/s 이상 → 🚀 매우 빠름 (파워 트레이닝 영역)\n'
        '• 0.5~0.8 m/s → ⚡ 빠름 (근비대 최적)\n'
        '• 0.3~0.5 m/s → 💪 보통 (근력 트레이닝 영역)\n'
        '• 0.3 m/s 미만 → 🐢 느림 (최대 근력 근접)\n\n'
        '※ 운동 종류에 따라 기준이 다릅니다. 스쿼트는 벤치보다 기준이 높습니다.',
    trainerTip:
        '"이 숫자가 올리는 속도예요. 세트 후반에 떨어지면 근육이 피로해진 거고, '
        '매번 비슷하면 무게를 올려도 된다는 뜻이에요."',
  );

  static const avgPower = VbtMetricInfo(
    id: 'avg_power',
    title: '평균 파워',
    emoji: '💥',
    oneLiner: '근육이 단위 시간당 발생시킨 힘의 크기',
    whatItMeasures:
        '파워 = 힘(Force) × 속도(Velocity). '
        '케이블의 장력(부하)과 이동 속도를 곱해서 와트(W) 단위로 계산합니다. '
        '좌우 평균값입니다.',
    whyItMatters:
        '파워는 "얼마나 세게, 얼마나 빠르게" 힘을 냈는지를 하나의 숫자로 보여줍니다. '
        '근력만 세도 느리면 파워가 낮고, 빨라도 부하가 가벼우면 파워가 낮습니다.\n\n'
        '스포츠 퍼포먼스와 가장 직결되는 지표입니다. 점프력, 스프린트, 펀치력 모두 파워에 비례합니다.',
    howToRead:
        '• 500W+ → 상급자 수준의 높은 출력\n'
        '• 200~500W → 중급자\n'
        '• 200W 미만 → 초급 또는 저부하\n\n'
        '※ 같은 사람이 같은 무게를 들어도, 컨디션에 따라 20~30% 변동 가능.',
    trainerTip:
        '"파워는 힘×속도예요. 무게가 가벼워도 빠르게 들면 파워가 높고, '
        '무거워도 느리면 낮아요. 실전 운동 능력을 가장 잘 보여주는 숫자입니다."',
  );

  static const avgRom = VbtMetricInfo(
    id: 'avg_rom',
    title: '평균 ROM',
    emoji: '📏',
    oneLiner: '케이블 이동 거리 (가동범위)',
    whatItMeasures:
        'ROM(Range of Motion) = 한 렙에서 케이블이 이동한 총 거리(mm). '
        '좌우 평균값입니다. 센서가 0.05mm 단위로 정밀 측정합니다.',
    whyItMatters:
        '같은 운동이라도 가동범위가 짧으면 근육 자극이 줄어듭니다. '
        '피로가 쌓이면 ROM이 줄어드는 경향이 있어서, 피로 지표로도 활용됩니다.\n\n'
        '또한 재활/교정 운동에서는 ROM 자체가 목표가 됩니다.',
    howToRead:
        '• 렙마다 일정한 ROM → 좋은 폼 유지\n'
        '• 후반 렙에서 ROM 감소 → 피로로 인한 폼 무너짐\n'
        '• 좌우 ROM 차이 → 한쪽 관절 가동성 문제 가능성\n\n'
        '※ 절대값보다는 렙 간 일관성이 중요합니다.',
    trainerTip:
        '"이건 케이블이 움직인 거리예요. 끝까지 당기고 끝까지 놓는 게 중요한데, '
        '힘들어지면 자기도 모르게 거리가 줄어들거든요. 그걸 숫자로 잡아주는 거예요."',
  );

  static const avgTut = VbtMetricInfo(
    id: 'avg_tut',
    title: '평균 TUT',
    emoji: '⏱️',
    oneLiner: '근육에 긴장이 걸린 총 시간',
    whatItMeasures:
        'TUT(Time Under Tension) = 한 렙에서 컨센트릭(올리기) + 이센트릭(내리기) 시간의 합. '
        '초(s) 단위입니다.',
    whyItMatters:
        '근비대(근육 성장)에는 TUT가 매우 중요합니다. '
        '같은 렙이라도 천천히 하면 TUT가 길어져 근육에 더 큰 자극이 갑니다.\n\n'
        '반대로 파워 트레이닝에서는 TUT를 짧게 (빠르게) 하는 것이 목표입니다.',
    howToRead:
        '• 4~6초/렙 → 근비대에 최적\n'
        '• 2~3초/렙 → 파워/폭발력 트레이닝\n'
        '• 6초 이상/렙 → 교정/재활 또는 과도한 이센트릭\n\n'
        '※ 훈련 목표에 따라 "좋은" TUT가 다릅니다.',
    trainerTip:
        '"근육이 힘을 쓰고 있는 시간이에요. 근육을 키우려면 4~6초가 좋고, '
        '폭발력을 키우려면 빠르게 2~3초가 좋아요. 목표에 따라 달라집니다."',
  );

  static const velocityLoss = VbtMetricInfo(
    id: 'velocity_loss',
    title: 'Velocity Loss (피로도)',
    emoji: '📉',
    oneLiner: '세트 처음 대비 마지막 속도가 얼마나 떨어졌는지',
    whatItMeasures:
        'Velocity Loss = (처음 2렙 평균 속도 - 마지막 2렙 평균 속도) / 처음 2렙 평균 속도 × 100%. '
        '세트 내 피로 누적을 정량화합니다.',
    whyItMatters:
        'VBT에서 가장 혁신적인 개념 중 하나입니다. 전통 트레이닝은 "정해진 렙 수"를 채우지만, '
        'VBT는 "속도가 OO% 떨어지면 세트 종료"라는 과학적 기준을 씁니다.\n\n'
        '• 너무 많이 떨어지면 → 과도한 피로, 회복 시간 증가, 부상 위험\n'
        '• 너무 적으면 → 자극 부족, 성장 미미',
    howToRead:
        '• 0~10% → 가벼운 피로 (파워 트레이닝에 적합)\n'
        '• 10~20% → 적절한 피로 (근비대에 최적)\n'
        '• 20~30% → 상당한 피로 (근력 트레이닝)\n'
        '• 30%+ → ⚠️ 과도한 피로 (다음 세트 무게 줄이기 권장)\n\n'
        '🟢 녹색 = 적절 | 🟡 노랑 = 주의 | 🔴 빨강 = 과도',
    trainerTip:
        '"이게 핵심이에요. 처음에 빠르게 들다가 끝에 느려지잖아요? '
        '그 차이가 피로도입니다. 20% 넘으면 힘들었다는 뜻이고, '
        '다음엔 렙 수를 줄이거나 무게를 낮추라는 신호예요."',
  );

  static const balance = VbtMetricInfo(
    id: 'balance',
    title: 'L/R 밸런스',
    emoji: '⚖️',
    oneLiner: '왼쪽과 오른쪽 케이블 속도의 균형도',
    whatItMeasures:
        '좌우 케이블의 평균 속도 비율입니다. '
        '100%면 완벽한 균형, 낮을수록 한쪽이 더 느립니다.\n'
        '계산: min(L속도, R속도) / max(L속도, R속도) × 100',
    whyItMatters:
        '🔥 룸핏만의 고유 기능입니다. 일반 바벨/덤벨로는 측정할 수 없습니다.\n\n'
        '좌우 비대칭은 부상의 가장 큰 원인 중 하나입니다. '
        '대부분의 사람은 본인의 비대칭을 인지하지 못합니다. '
        '룸핏은 양쪽 케이블을 독립 측정해서 이를 실시간으로 보여줍니다.\n\n'
        '재활/교정 운동에서 좌우 밸런스 추적은 회복 진행도의 핵심 지표입니다.',
    howToRead:
        '• 95~100% → 🟢 우수 (균형 잡힘)\n'
        '• 85~95% → 🟡 양호 (경미한 비대칭, 대부분 여기)\n'
        '• 70~85% → 🟠 주의 (교정 트레이닝 권장)\n'
        '• 70% 미만 → 🔴 심각 (부상 이력 의심, 전문가 상담)',
    trainerTip:
        '"이게 룸핏에서만 볼 수 있는 건데요, 왼쪽 오른쪽 따로 측정해서 균형을 보여줘요. '
        '보통 주로 쓰는 팔이 5~10% 더 빠른데, 15% 넘어가면 '
        '약한 쪽을 따로 훈련해야 합니다. 부상 예방에 정말 중요해요."',
  );

  static const estimated1rm = VbtMetricInfo(
    id: 'estimated_1rm',
    title: '추정 1RM',
    emoji: '🏆',
    oneLiner: '한 번에 들 수 있는 최대 무게 추정치',
    whatItMeasures:
        '1RM(1 Repetition Maximum) = 한 번에 들 수 있는 최대 무게. '
        '실제로 최대 무게를 들지 않고, 현재 무게와 렙 수로 수학적으로 추정합니다.\n'
        '공식: 현재 무게 × (1 + 렙 수 / 30)',
    whyItMatters:
        '1RM은 근력의 절대 지표입니다. 주기적으로 측정하면 트레이닝 효과를 객관적으로 확인할 수 있습니다.\n\n'
        '실제로 1RM을 시도하면 부상 위험이 있지만, VBT로 추정하면 안전합니다.',
    howToRead:
        '• 이 숫자가 높을수록 근력이 강합니다\n'
        '• 주 단위/월 단위로 추적하면 성장 곡선을 볼 수 있습니다\n'
        '• 같은 운동, 같은 조건에서 비교해야 의미 있습니다\n\n'
        '※ 추정치이므로 ±5~10% 오차가 있을 수 있습니다.',
    trainerTip:
        '"실제로 최대 무게를 안 들어도, 지금 속도와 렙 수로 최대 무게를 계산해줘요. '
        '매번 확인하면 내 근력이 늘고 있는지 숫자로 볼 수 있습니다."',
  );

  static const conEccVelocity = VbtMetricInfo(
    id: 'con_ecc_velocity',
    title: 'Con / Ecc 속도',
    emoji: '🔄',
    oneLiner: '올리기(Con)와 내리기(Ecc) 각각의 속도',
    whatItMeasures:
        '• Concentric(컨센트릭) = 근육이 수축하며 무게를 들어올리는 구간\n'
        '• Eccentric(이센트릭) = 근육이 늘어나며 무게를 내리는 구간\n\n'
        '각 구간의 좌우 별도 속도를 m/s 단위로 보여줍니다.',
    whyItMatters:
        '컨센트릭은 "힘을 내는" 구간, 이센트릭은 "제어하는" 구간입니다.\n\n'
        '• Con이 빠르면 → 폭발력 좋음\n'
        '• Ecc이 너무 빠르면 → 무게를 "놓는" 것 (근자극 손실, 부상 위험)\n'
        '• Con:Ecc 비율이 2:1~3:1이 이상적\n\n'
        '이센트릭 컨트롤은 근비대의 핵심 요소입니다.',
    howToRead:
        '• 차트에서 밝은 바(뒤) = Con, 테두리 바(앞) = Ecc\n'
        '• 파란색 = 왼쪽, 주황색 = 오른쪽\n'
        '• Con 바가 Ecc보다 커야 정상\n'
        '• Ecc이 Con보다 크면 → "놓듯이" 내리는 중 (주의)',
    trainerTip:
        '"올릴 때는 빠르게 폭발적으로, 내릴 때는 천천히 버티면서 — 이게 가장 효과적인 운동법이에요. '
        '이 차트에서 올리기(밝은 바)는 크고, 내리기(테두리 바)는 작아야 좋은 거예요."',
  );

  static const badRep = VbtMetricInfo(
    id: 'bad_rep',
    title: '교정 필요 렙',
    emoji: '⚠️',
    oneLiner: '폼이나 동작에 문제가 감지된 렙',
    whatItMeasures:
        'AI가 각 렙의 좌우 불균형, 급격한 속도 변화, ROM 부족, 중간 정체 등을 분석해서 '
        '"교정이 필요한 렙"을 자동 표시합니다.',
    whyItMatters:
        '본인은 느끼지 못하는 동작 문제를 잡아냅니다. '
        '특히 피로가 쌓인 후반 렙에서 폼이 무너지는 것을 감지합니다.\n\n'
        '유형:\n'
        '• 좌우 불균형 — 한쪽이 현저히 느림\n'
        '• 불안정한 동작(Jerky) — 속도가 갑자기 변함\n'
        '• ROM 부족 — 가동범위가 평소보다 짧음\n'
        '• 느린 컨센트릭 — 올리는 속도가 급감\n'
        '• 중간 정체(Stall) — 동작 중간에 멈춤',
    howToRead:
        '• ⚠ 표시된 렙 = 문제 감지\n'
        '• 유형별 색상 태그 + 교정 방법 제시\n'
        '• 세트 후반에 집중되면 → 피로 관리 필요\n'
        '• 세트 초반부터 나오면 → 무게가 과하거나 폼 자체의 문제',
    trainerTip:
        '"이건 AI가 동작 문제를 잡아낸 거예요. 보통 힘들어지면 자세가 무너지는데 '
        '그걸 본인은 모르잖아요. 여기 나온 교정 방법대로 하면 됩니다."',
  );

  static const powerScore = VbtMetricInfo(
    id: 'power_score',
    title: 'Power Score',
    emoji: '🔥',
    oneLiner: '힘 × 속도 = 종합 운동 능력 점수',
    whatItMeasures:
        'Power Score = 추정 1RM(kg) × Best MCV(m/s)\n\n'
        '• 1RM = 최대 근력 (얼마나 무거운 걸 들 수 있나)\n'
        '• Best MCV = 최고 평균 속도 (얼마나 빠르게 들 수 있나)\n\n'
        '둘을 곱해서 정수 점수로 환산합니다.',
    whyItMatters:
        '힘만 세면 느리고, 빠르기만 하면 약합니다. '
        'Power Score는 둘의 균형을 보는 종합 점수입니다.\n\n'
        '실제 운동 능력(스포츠 퍼포먼스)과 가장 상관관계가 높은 지표입니다.',
    howToRead:
        '• 🔥 100+ → EXPLOSIVE (폭발적)\n'
        '• ⚡ 70~99 → FAST (빠름)\n'
        '• 💪 40~69 → STRONG (강함)\n'
        '• 🐢 ~39 → GRINDER (꾸준함)\n\n'
        '※ 운동 종류에 따라 점수 범위가 다릅니다.',
    trainerTip:
        '"이게 최종 점수예요. 힘만 세도 안 되고, 빠르기만 해도 안 돼요. '
        '둘 다 좋아야 높은 점수가 나와요. 리더보드에서 순위를 볼 수 있습니다."',
  );

  // 세션 리포트 전용
  static const totalVolume = VbtMetricInfo(
    id: 'total_volume',
    title: '총 볼륨',
    emoji: '📦',
    oneLiner: '전체 세션에서 들어올린 총 무게',
    whatItMeasures:
        '볼륨 = 무게(kg) × 총 렙 수. '
        '세션 전체에서 근육이 감당한 총 작업량을 나타냅니다.',
    whyItMatters:
        '볼륨은 근비대의 가장 중요한 결정 요인입니다. '
        '같은 강도라면, 볼륨이 많을수록 근성장이 큽니다.\n\n'
        '다만 과도한 볼륨은 회복 불능으로 이어지므로, '
        'Velocity Loss와 함께 봐야 합니다.',
    howToRead:
        '• 주간 볼륨을 추적하면 프로그래밍에 도움\n'
        '• 같은 볼륨에서 속도가 오르면 → 근력 향상\n'
        '• 볼륨 늘렸는데 속도가 크게 떨어지면 → 과훈련 신호',
    trainerTip:
        '"총 볼륨은 오늘 근육이 한 일의 양이에요. 이걸 주 단위로 추적하면 '
        '내가 충분히 운동하고 있는지, 아니면 너무 많이 하고 있는지 알 수 있어요."',
  );

  static const setComparison = VbtMetricInfo(
    id: 'set_comparison',
    title: '세트 간 비교',
    emoji: '📊',
    oneLiner: '세트별 속도/파워/피로 변화 추이',
    whatItMeasures:
        '각 세트의 평균 속도, 파워, ROM, Velocity Loss를 나란히 비교합니다. '
        '세트가 진행될수록 어떻게 변하는지 한눈에 보입니다.',
    whyItMatters:
        '세트 간 속도 유지 = 컨디션 좋음, 회복 충분.\n'
        '세트 간 속도 급감 = 피로 누적, 휴식 부족 또는 볼륨 과다.\n\n'
        '3세트 이상에서 특히 유용합니다. 프로그래밍(세트 수, 휴식 시간)을 조정하는 근거가 됩니다.',
    howToRead:
        '• Set 1→2 속도 유지, Set 3에서 급감 → 2세트가 적정\n'
        '• 모든 세트 속도 비슷 → 무게 올릴 여유 있음\n'
        '• 세트마다 VelLoss 증가 → 세트 간 휴식 늘리기',
    trainerTip:
        '"세트마다 얼마나 지쳤는지 비교하는 거예요. 첫 세트랑 마지막 세트 속도 차이가 15% 넘으면 '
        '세트 수를 줄이거나 쉬는 시간을 늘리라는 신호입니다."',
  );

  /// id로 찾기
  static VbtMetricInfo? byId(String id) {
    return all.firstWhere((m) => m.id == id, orElse: () => all.first);
  }

  static const List<VbtMetricInfo> all = [
    avgVelocity,
    avgPower,
    avgRom,
    avgTut,
    velocityLoss,
    balance,
    estimated1rm,
    conEccVelocity,
    badRep,
    powerScore,
    totalVolume,
    setComparison,
  ];
}

/// 롱프레스 → 지표 설명 모달
///
/// 사용: 어떤 위젯이든 감싸면 됨
/// ```dart
/// MetricExplainable(
///   metric: VbtMetrics.avgVelocity,
///   child: _tile('평균 속도', '0.65 m/s', color),
/// )
/// ```
class MetricExplainable extends StatelessWidget {
  final VbtMetricInfo metric;
  final Widget child;

  const MetricExplainable({
    super.key,
    required this.metric,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => showMetricModal(context, metric),
      child: child,
    );
  }

  static void showMetricModal(BuildContext context, VbtMetricInfo metric) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    final f = isTablet ? 1.3 : 1.0;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: SpoexTheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          maxChildSize: 0.9,
          minChildSize: 0.4,
          expand: false,
          builder: (_, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: EdgeInsets.all(24 * f),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 핸들
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: EdgeInsets.only(bottom: 16 * f),
                      decoration: BoxDecoration(
                        color: SpoexTheme.textSecondary.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),

                  // 타이틀
                  Row(children: [
                    Text(metric.emoji, style: TextStyle(fontSize: 28 * f)),
                    SizedBox(width: 12 * f),
                    Expanded(
                      child: Text(metric.title,
                          style: TextStyle(
                            fontSize: 22 * f,
                            fontWeight: FontWeight.w800,
                            color: SpoexTheme.textPrimary,
                          )),
                    ),
                  ]),
                  SizedBox(height: 4 * f),
                  Text(metric.oneLiner,
                      style: TextStyle(
                        fontSize: 14 * f,
                        color: SpoexTheme.primary,
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(height: 20 * f),

                  // 섹션들
                  _section('📐 무엇을 측정하나요?', metric.whatItMeasures, f),
                  SizedBox(height: 16 * f),
                  _section('💡 왜 중요한가요?', metric.whyItMatters, f),
                  SizedBox(height: 16 * f),
                  _section('📖 어떻게 읽나요?', metric.howToRead, f),
                  SizedBox(height: 16 * f),

                  // 트레이너 팁 (특별 강조)
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16 * f),
                    decoration: BoxDecoration(
                      color: SpoexTheme.accent.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: SpoexTheme.accent.withValues(alpha: 0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('💬 고객에게 이렇게 설명하세요',
                            style: TextStyle(
                              fontSize: 14 * f,
                              fontWeight: FontWeight.w700,
                              color: SpoexTheme.accent,
                            )),
                        SizedBox(height: 8 * f),
                        Text(metric.trainerTip,
                            style: TextStyle(
                              fontSize: 14 * f,
                              color: SpoexTheme.textPrimary,
                              fontStyle: FontStyle.italic,
                              height: 1.6,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 24 * f),

                  // 닫기
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: Text('닫기',
                          style: TextStyle(
                              color: SpoexTheme.textSecondary,
                              fontSize: 15 * f)),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  static Widget _section(String title, String body, double f) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
              fontSize: 15 * f,
              fontWeight: FontWeight.w700,
              color: SpoexTheme.textPrimary,
            )),
        SizedBox(height: 6 * f),
        Text(body,
            style: TextStyle(
              fontSize: 13 * f,
              color: SpoexTheme.textSecondary,
              height: 1.6,
            )),
      ],
    );
  }
}
