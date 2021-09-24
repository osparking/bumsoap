/* 새 명령 위에 삽입 */

UPDATE soap
SET bs_name=bs_name, ingridi_1=ingridi_1, 
	fragrance=fragrance, descrip=descrip, 
	spec_func=spec_func, target=1, 
	mall_link=mall_link
WHERE BSSN=1; /* BSSN */

/* 비누 중량옵션(정상,2in1) 및 형태(보통,백설,메주) 주어진 경우
 * 비누의 재고량을 요구된 만큼 변화시킨다.
 */
update soap_stock set
	stock = stock + 1
where STOCK_SN in (select ss.STOCK_SN from soap_stock ss
join soap_price sp on sp.price_sn = ss.PRICE_SN 
	and ss.SHAPE_W = 0 and sp.SHAPE = 0);