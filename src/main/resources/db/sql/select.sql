/* 새 명령 위에 삽입 */

SELECT * FROM soap;  so join soap_pic sp on sp.BSSN = so.BSSN;

SELECT *
FROM soap_pic sp where BSSN = 1;

select * from ingredients i where i.BSSN = 1;

/* 전성분 중량 합, %합 계산 */
select sum(weight), sum(percent)
from ingrids;

/* price and stock for each <shape,weight> pair */
select ss.SHAPE_W, sp.SHAPE, sp.price, ss.stock 
from soap_weight ss
join soap_shape sp on sp.Price_SN = ss.PRICE_SN
order by ss.SHAPE_W, sp.SHAPE; /*weight major order */

/* given shape and weight find price record */
select ss.STOCK_SN, stock from soap_weight ss
join soap_shape sp on sp.price_sn = ss.PRICE_SN 
	and ss.SHAPE_W = 0 and sp.SHAPE = 0;
