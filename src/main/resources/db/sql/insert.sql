/* 새 명령 위에 삽입 */

INSERT INTO bumsoap.users
(userId, `role`, password, email, delete_time)
VALUES('kdhong2', 2, 'dddfddff#$56', null, null);

/* root 로써 실행해야 됨 */
insert into soap_pic(bssn, DP_ORDER, EXT_NAME, PICTURE)
values (1, 3, 'jpg',
  load_file('D:\\ws\\bumsoap\\image\\im_soap\\sml_slimy.jpg'));
 
/* root 로써 실행해야 됨 */
insert into soap_pic(bssn, DP_ORDER, EXT_NAME, PICTURE)
values (1, 2, 'jpg',
  load_file('D:\\ws\\bumsoap\\image\\im_soap\\land_boston.jpg'));

/* root 로써 실행해야 됨 */
insert into soap_pic(bssn, DP_ORDER, EXT_NAME, PICTURE)
values (1, 2, 'jpg', 
  load_file('D:\\ws\\bumsoap\\image\\im_soap\\_DSC2579.jpg'));

INSERT INTO `soap`(bs_name, ingridi_1, mall_link, fragrance, 
  descrip , 
  spec_func, target)
VALUES ('올리브오일 수제비누', '올리브오일 엑스트라 버진', 'https://smartstore.naver.com/bumsoap/products/5335155773','비자나무향',
  '엑스트라 버진 올리브 오일을 저온처리과정으로 비누화 과정을 거쳤습니다. 범이비누는 pH 가 10.7 이어서 강력한 세정효과를 드림니다. 올리브 오일( 특히, 엑스트라 버진)에 천연 글리세린비누 많이 함유되어 있다고 합니다. 글리세린은 공기 중의 수분을 흡수하여 피부를 촉촉하게 지켜줄 것입니다.',
  '고 세정력, 피부 관리(care), 피부 수분 유지, 건성 및 지성 피부용', 0);