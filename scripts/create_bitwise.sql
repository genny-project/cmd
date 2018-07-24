delimiter $$
CREATE FUNCTION myFunction (in_dob datetime) returns int
 NO SQL
 BEGIN
  DECLARE l_age INT;
  IF DATE_FORMAT(NOW(),'00-%m-%d') >= DATE_FORMAT(in_dob,'00-%m-%d') THEN
    SET l_age=DATE_FORMAT(NOW(),'%Y')-DATE_FORMAT(in_dob,'%Y');
  ELSE
    SET l_age=DATE_FORMAT(NOW(),'%Y')-DATE_FORMAT(in_dob,'%Y')-1;
  END IF;
  RETURN(l_age);

END$$
