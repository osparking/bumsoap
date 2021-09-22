/* 새 명령 위에 삽입 */
/* given shape and weight find price record */

select ss.STOCK_SN, stock from soap_stock ss
join soap_price sp on sp.price_sn = ss.PRICE_SN 
	and ss.SHAPE_W = 0 and sp.SHAPE = 0;
