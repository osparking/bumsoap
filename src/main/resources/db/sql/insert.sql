/* 새 명령 위에 삽입 */

/* root 로써 실행해야 됨 */
insert into soap_pic(bssn, DP_ORDER, EXT_NAME, PICTURE)
values (1, 2, 'jpg',
  load_file('D:\\ws\\bumsoap\\image\\im_soap\\two-soaps.jpg'));

INSERT INTO `bumsoap`(bs_name, ingridi_1, mall_name, fragrance, 
  `desc`, 
  `function`, target)
VALUES ('올리브오일 수제비누', '올리브오일 엑스트라 버진', '카스틸 CP 여드름 알칼리성 율무 어성초 비누','비자나무향',
  '엑스트라 버진 올리브 오일을 저온처리과정으로 비누화 과정을 거쳤습니다. 범이비누는 pH 가 10.7 이어서 강력한 세정효과를 드림니다. 올리브 오일( 특히, 엑스트라 버진)에 천연 글리세린비누 많이 함유되어 있다고 합니다. 글리세린은 공기 중의 수분을 흡수하여 피부를 촉촉하게 지켜줄 것입니다.',
  '고 세정력, 피부 관리(care), 피부 수분 유지, 건성 및 지성 피부용', 1);