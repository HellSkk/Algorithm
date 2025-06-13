SELECT 
    p.product_id,
-- 가져온 결과물에 대해서 값이 없을 경우 10으로 바꿔줌
    COALESCE(pp.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) p
-- 해당 날짜의 가격을 left join으로 가져옴
LEFT JOIN Products pp
    ON p.product_id = pp.product_id
    AND pp.change_date = (
        -- 각 프로덕트 별로 2019-08-16일 이전 max 데이터로 뽑음
        SELECT MAX(change_date)
        FROM Products p2
        WHERE p2.product_id = p.product_id
          AND p2.change_date <= '2019-08-16'
    )
ORDER BY p.product_id;