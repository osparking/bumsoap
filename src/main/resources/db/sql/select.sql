/* 새 명령 위에 삽입 */

select * from ingridients i where i.BSSN = 1;

/* 전성분 중량 합, %합 계산 */
select sum(weight), sum(percent)
from ingrids;

/* price and stock for each <shape,weight> pair */
select ss.SHAPE_W, sp.SHAPE, sp.price, ss.stock 
from soap_stock ss
join soap_price sp on sp.Price_SN = ss.PRICE_SN
order by ss.SHAPE_W, sp.SHAPE; /*weight major order */

/* given shape and weight find price record */
select ss.STOCK_SN, stock from soap_stock ss
join soap_price sp on sp.price_sn = ss.PRICE_SN 
	and ss.SHAPE_W = 0 and sp.SHAPE = 0;
